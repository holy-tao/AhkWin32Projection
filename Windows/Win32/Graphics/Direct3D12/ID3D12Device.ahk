#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ID3D12Object.ahk

/**
 * Represents a virtual adapter; it is used to create command allocators, command lists, command queues, fences, resources, pipeline state objects, heaps, root signatures, samplers, and many resource views.
 * @remarks
 * 
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device. 
 * 
 * For Windows 10 Anniversary some additional functionality is available through <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device1">ID3D12Device1</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device extends ID3D12Object{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device
     * @type {Guid}
     */
    static IID => Guid("{189819f1-1db6-4b57-be54-1821339b85f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeCount", "CreateCommandQueue", "CreateCommandAllocator", "CreateGraphicsPipelineState", "CreateComputePipelineState", "CreateCommandList", "CheckFeatureSupport", "CreateDescriptorHeap", "GetDescriptorHandleIncrementSize", "CreateRootSignature", "CreateConstantBufferView", "CreateShaderResourceView", "CreateUnorderedAccessView", "CreateRenderTargetView", "CreateDepthStencilView", "CreateSampler", "CopyDescriptors", "CopyDescriptorsSimple", "GetResourceAllocationInfo", "GetCustomHeapProperties", "CreateCommittedResource", "CreateHeap", "CreatePlacedResource", "CreateReservedResource", "CreateSharedHandle", "OpenSharedHandle", "OpenSharedHandleByName", "MakeResident", "Evict", "CreateFence", "GetDeviceRemovedReason", "GetCopyableFootprints", "CreateQueryHeap", "SetStablePowerState", "CreateCommandSignature", "GetResourceTiling", "GetAdapterLuid"]

    /**
     * Reports the number of physical adapters (nodes) that are associated with this device.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of physical adapters (nodes) that this device has.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getnodecount
     */
    GetNodeCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Creates a command queue.
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_queue_desc">D3D12_COMMAND_QUEUE_DESC</a>*</b>
     * 
     * Specifies a D3D12_COMMAND_QUEUE_DESC that describes the command queue.
     * @param {Pointer<Guid>} riid Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (GUID) for the command queue interface. See remarks.  An input parameter.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a> interface for the command queue.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcommandqueue
     */
    CreateCommandQueue(pDesc, riid) {
        result := ComCall(8, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppCommandQueue := 0, "HRESULT")
        return ppCommandQueue
    }

    /**
     * Creates a command allocator object.
     * @param {Integer} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE</a>-typed value that specifies the type of command allocator to create.
     *             The type of command allocator can be the type that records either direct command lists or bundles.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the command allocator interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandallocator">ID3D12CommandAllocator</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the command allocator can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D12CommandAllocator) will get the <b>GUID</b> of the interface to a command allocator.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandallocator">ID3D12CommandAllocator</a> interface for the command allocator.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcommandallocator
     */
    CreateCommandAllocator(type, riid) {
        result := ComCall(9, this, "int", type, "ptr", riid, "ptr*", &ppCommandAllocator := 0, "HRESULT")
        return ppCommandAllocator
    }

    /**
     * Creates a graphics pipeline state object.
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure that describes graphics pipeline state.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the pipeline state interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the pipeline state can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D12PipelineState) will get the <b>GUID</b> of the interface to a pipeline state.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> interface for the pipeline state object.
     *             The pipeline state object is an immutable state object.  It contains no methods.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate
     */
    CreateGraphicsPipelineState(pDesc, riid) {
        result := ComCall(10, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Creates a compute pipeline state object.
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structure that describes compute pipeline state.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the pipeline state interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the pipeline state can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D12PipelineState) will get the <b>GUID</b> of the interface to a pipeline state.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> interface for the pipeline state object.
     *             The pipeline state object is an immutable state object.  It contains no methods.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcomputepipelinestate
     */
    CreateComputePipelineState(pDesc, riid) {
        result := ComCall(11, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Creates a command list.
     * @param {Integer} nodeMask Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) for which to create the command list. Each bit in the mask corresponds to a single node. Only one bit must be set. Also see [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @param {Integer} type Type: **[D3D12_COMMAND_LIST_TYPE](./ne-d3d12-d3d12_command_list_type.md)**
     * 
     * Specifies the type of command list to create.
     * @param {ID3D12CommandAllocator} pCommandAllocator Type: **[ID3D12CommandAllocator](./nn-d3d12-id3d12commandallocator.md)\***
     * 
     * A pointer to the command allocator object from which the device creates command lists.
     * @param {ID3D12PipelineState} pInitialState Type: **[ID3D12PipelineState](./nn-d3d12-id3d12pipelinestate.md)\***
     * 
     * An optional pointer to the pipeline state object that contains the initial pipeline state for the command list. If it is `nulltpr`, then the runtime sets a dummy initial pipeline state, so that drivers don't have to deal with undefined state. The overhead for this is low, particularly for a command list, for which the overall cost of recording the command list likely dwarfs the cost of a single initial state setting. So there's little cost in not setting the initial pipeline state parameter, if doing so is inconvenient.
     * 
     * For bundles, on the other hand, it might make more sense to try to set the initial state parameter (since bundles are likely smaller overall, and can be reused frequently).
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the command list interface to return in *ppCommandList*.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the [ID3D12CommandList](./nn-d3d12-id3d12commandlist.md) or [ID3D12GraphicsCommandList](./nn-d3d12-id3d12graphicscommandlist.md) interface for the command list.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcommandlist
     */
    CreateCommandList(nodeMask, type, pCommandAllocator, pInitialState, riid) {
        result := ComCall(12, this, "uint", nodeMask, "int", type, "ptr", pCommandAllocator, "ptr", pInitialState, "ptr", riid, "ptr*", &ppCommandList := 0, "HRESULT")
        return ppCommandList
    }

    /**
     * Gets information about the features that are supported by the current graphics driver.
     * @param {Integer} Feature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a></b>
     * 
     * A constant from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration describing the feature(s) that you want to query for support.
     * @param {Pointer} pFeatureSupportData Type: <b>void*</b>
     * 
     * A pointer to a data structure that corresponds to the value of the <i>Feature</i> parameter. To determine the corresponding data structure for each constant, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
     * @param {Integer} FeatureSupportDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the structure pointed to by the <i>pFeatureSupportData</i> parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful. Returns <b>E_INVALIDARG</b> if an unsupported data type is passed to the <i>pFeatureSupportData</i> parameter or if a size mismatch is detected for the <i>FeatureSupportDataSize</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(13, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * Creates a descriptor heap object.
     * @param {Pointer<D3D12_DESCRIPTOR_HEAP_DESC>} pDescriptorHeapDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a> structure that describes the heap.
     * @param {Pointer<Guid>} riid Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the descriptor heap interface. See Remarks.
     *             An input parameter.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the descriptor heap.
     *             <i>ppvHeap</i> can be NULL, to enable capability testing.
     *             When <i>ppvHeap</i> is NULL, no object will be created and S_FALSE will be returned when <i>pDescriptorHeapDesc</i> is valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createdescriptorheap
     */
    CreateDescriptorHeap(pDescriptorHeapDesc, riid) {
        result := ComCall(14, this, "ptr", pDescriptorHeapDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * Gets the size of the handle increment for the given type of descriptor heap. This value is typically used to increment a handle into a descriptor array by the correct amount.
     * @param {Integer} DescriptorHeapType The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a>-typed value that specifies the type of descriptor heap to get the size of the handle increment for.
     * @returns {Integer} Returns the size of the handle increment for the given type of descriptor heap, including any necessary padding.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getdescriptorhandleincrementsize
     */
    GetDescriptorHandleIncrementSize(DescriptorHeapType) {
        result := ComCall(15, this, "int", DescriptorHeapType, "uint")
        return result
    }

    /**
     * Creates a root signature layout.
     * @param {Integer} nodeMask Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) to which the root signature is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {Pointer<Void>} pBlobWithRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">void</a>*</b>
     * 
     * A pointer to the source data for the serialized signature.
     * @param {Pointer} blobLengthInBytes Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pBlobWithRootSignature</i> points to.
     * @param {Pointer<Guid>} riid Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the root signature interface. See Remarks.
     *             An input parameter.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the root signature.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createrootsignature
     */
    CreateRootSignature(nodeMask, pBlobWithRootSignature, blobLengthInBytes, riid) {
        pBlobWithRootSignatureMarshal := pBlobWithRootSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, "uint", nodeMask, pBlobWithRootSignatureMarshal, pBlobWithRootSignature, "ptr", blobLengthInBytes, "ptr", riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    /**
     * Creates a constant-buffer view for accessing resource data.
     * @param {Pointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_constant_buffer_view_desc">D3D12_CONSTANT_BUFFER_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_constant_buffer_view_desc">D3D12_CONSTANT_BUFFER_VIEW_DESC</a> structure that describes the constant-buffer view.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the start of the heap that holds the constant-buffer view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createconstantbufferview
     */
    CreateConstantBufferView(pDesc, DestDescriptor) {
        ComCall(17, this, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Creates a shader-resource view for accessing data in a resource.
     * @remarks
     * 
     * <h3><a id="Processing_YUV_4_2_0_video_formats"></a><a id="processing_yuv_4_2_0_video_formats"></a><a id="PROCESSING_YUV_4_2_0_VIDEO_FORMATS"></a>Processing YUV 4:2:0 video formats</h3>
     * An app must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling <b>CreateShaderResourceView</b> twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.
     * 
     * YUV 4:2:0 formats are listed in <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     * 
     * 
     * 
     * @param {ID3D12Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the shader resource.
     * 
     * At least one of <i>pResource</i> or <i>pDesc</i>  must be provided.
     * A null <i>pResource</i> is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid <i>pDesc</i> in order to determine the descriptor type.
     * @param {Pointer<D3D12_SHADER_RESOURCE_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a> structure that describes the shader-resource view. 
     * 
     * A null <i>pDesc</i> is used to initialize a default descriptor, if possible. This behavior is identical to the D3D11 null descriptor behavior, where defaults are filled in. This behavior inherits the resource format and dimension (if not typeless) and for buffers SRVs target a full buffer and are typed (not raw or structured), and for textures SRVs target a full texture, all mips and all array slices. Not all resources support null descriptor initialization.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the shader-resource view. This handle can be created in a shader-visible or non-shader-visible descriptor heap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc, DestDescriptor) {
        ComCall(18, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Creates a view for unordered accessing.
     * @param {ID3D12Resource} pResource Type: [in, optional] <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the unordered access.
     *           
     * At least one of <i>pResource</i> or <i>pDesc</i> must be provided.
     * 
     * A null <i>pResource</i> is used to initialize a null descriptor, which guarantees Direct3D 11-like null binding behavior (reading 0s, writes are discarded), but must have a valid <i>pDesc</i> in order to determine the descriptor type.
     * @param {ID3D12Resource} pCounterResource Type: [in, optional] <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> for the counter (if any) associated with the UAV.
     * 
     * If <i>pCounterResource</i> is not specified, then the <b>CounterOffsetInBytes</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_uav">D3D12_BUFFER_UAV</a> structure must be 0.
     * 
     * If <i>pCounterResource</i> is specified, then there is a counter associated with the UAV, and the runtime performs validation of the following requirements:
     * 
     * <ul>
     * <li>The <b>StructureByteStride</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_uav">D3D12_BUFFER_UAV</a> structure must be greater than 0.
     *               </li>
     * <li>The format must be DXGI_FORMAT_UNKNOWN.
     *               </li>
     * <li>The D3D12_BUFFER_UAV_FLAG_RAW flag (a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_buffer_uav_flags">D3D12_BUFFER_UAV_FLAGS</a> enumeration constant) must not be set.
     *               </li>
     * <li>Both of the resources (<i>pResource</i> and <i>pCounterResource</i>) must be buffers.
     *               </li>
     * <li>The <b>CounterOffsetInBytes</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_uav">D3D12_BUFFER_UAV</a> structure must be a multiple of **D3D12_UAV_COUNTER_PLACEMENT_ALIGNMENT** (4096), and must be within the range of the counter resource.
     *               </li>
     * <li><i>pResource</i> cannot be NULL
     *               </li>
     * <li><i>pDesc</i> cannot be NULL.
     *               </li>
     * </ul>
     * @param {Pointer<D3D12_UNORDERED_ACCESS_VIEW_DESC>} pDesc Type: [in, optional] <b>const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure that describes the unordered-access view.
     *           
     * A null <i>pDesc</i> is used to initialize a default descriptor, if possible. This behavior is identical to the D3D11 null descriptor behavior, where defaults are filled in. This behavior inherits the resource format and dimension (if not typeless) and for buffers UAVs target a full buffer and are typed, and for textures UAVs target the first mip and all array slices. Not all resources support null descriptor initialization.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the start of the heap that holds the unordered-access view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pCounterResource, pDesc, DestDescriptor) {
        ComCall(19, this, "ptr", pResource, "ptr", pCounterResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Creates a render-target view for accessing resource data.
     * @param {ID3D12Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the render target.
     *           
     * 
     * At least one of <i>pResource</i> or <i>pDesc</i>  must be provided.
     * A null <i>pResource</i> is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid <i>pDesc</i> in order to determine the descriptor type.
     * @param {Pointer<D3D12_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure that describes the render-target view.
     * 
     * A null <i>pDesc</i> is used to initialize a default descriptor, if possible. This behavior is identical to the D3D11 null descriptor behavior, where defaults are filled in. This behavior inherits the resource format and dimension (if not typeless) and RTVs target the first mip and all array slices. Not all resources support null descriptor initialization.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the destination where the newly-created render target view will reside.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc, DestDescriptor) {
        ComCall(20, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Creates a depth-stencil view for accessing resource data.
     * @param {ID3D12Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the depth stencil.
     *           
     * 
     * At least one of <i>pResource</i> or <i>pDesc</i>  must be provided.
     * A null <i>pResource</i> is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid <i>pDesc</i> in order to determine the descriptor type.
     * @param {Pointer<D3D12_DEPTH_STENCIL_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure that describes the depth-stencil view.
     *           
     * 
     * A null <i>pDesc</i> is used to initialize a default descriptor, if possible. This behavior is identical to the D3D11 null descriptor behavior, where defaults are filled in. This behavior inherits the resource format and dimension (if not typeless) and DSVs target the  first mip and all array slices. Not all resources support null descriptor initialization.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the start of the heap that holds the depth-stencil view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc, DestDescriptor) {
        ComCall(21, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Create a sampler object that encapsulates sampling information for a texture.
     * @param {Pointer<D3D12_SAMPLER_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a> structure that describes the sampler.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the start of the heap that holds the sampler.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createsampler
     */
    CreateSampler(pDesc, DestDescriptor) {
        ComCall(22, this, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * Copies descriptors from a source to a destination.
     * @remarks
     * 
     * Where applicable, prefer [**ID3D12Device::CopyDescriptorsSimple**](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple) to this method. It can have a better CPU cache miss rate due to the linear nature of the copy.
     * 
     * 
     * @param {Integer} NumDestDescriptorRanges Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of destination descriptor ranges to copy to.
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDestDescriptorRangeStarts Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>*</b>
     * 
     * An array of <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b> objects to copy to.
     * 
     * All the destination and source descriptors must be in heaps of the same [D3D12_DESCRIPTOR_HEAP_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type).
     * @param {Pointer<Integer>} pDestDescriptorRangeSizes Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of destination descriptor range sizes to copy to.
     * @param {Integer} NumSrcDescriptorRanges Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of source descriptor ranges to copy from.
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pSrcDescriptorRangeStarts Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>*</b>
     * 
     * An array of <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b> objects to copy from.
     * 
     * > [!IMPORTANT]
     * > All elements in the *pSrcDescriptorRangeStarts* parameter must be in a non shader-visible descriptor heap. This is because shader-visible descriptor heaps may be created in **WRITE_COMBINE** memory or GPU local memory, which is prohibitively slow to read from. If your application manages descriptor heaps via copying the descriptors required for a given pass or frame from local "storage" descriptor heaps to the GPU-bound descriptor heap, use shader-opaque heaps for the storage heaps and copy into the GPU-visible heap as required.
     * @param {Pointer<Integer>} pSrcDescriptorRangeSizes Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of source descriptor range sizes to copy from.
     * @param {Integer} DescriptorHeapsType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a>-typed value that specifies the type of descriptor heap to copy with. This is required as different descriptor types may have different sizes.
     * 
     * Both the source and destination descriptor heaps must have the same type, else the debug layer will emit an error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-copydescriptors
     */
    CopyDescriptors(NumDestDescriptorRanges, pDestDescriptorRangeStarts, pDestDescriptorRangeSizes, NumSrcDescriptorRanges, pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizes, DescriptorHeapsType) {
        pDestDescriptorRangeSizesMarshal := pDestDescriptorRangeSizes is VarRef ? "uint*" : "ptr"
        pSrcDescriptorRangeSizesMarshal := pSrcDescriptorRangeSizes is VarRef ? "uint*" : "ptr"

        ComCall(23, this, "uint", NumDestDescriptorRanges, "ptr", pDestDescriptorRangeStarts, pDestDescriptorRangeSizesMarshal, pDestDescriptorRangeSizes, "uint", NumSrcDescriptorRanges, "ptr", pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizesMarshal, pSrcDescriptorRangeSizes, "int", DescriptorHeapsType)
    }

    /**
     * Copies descriptors from a source to a destination.
     * @remarks
     * 
     * Where applicable, prefer this method to [**ID3D12Device::CopyDescriptors**](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptors). It can have a better CPU cache miss rate due to the linear nature of the copy.
     * 
     * 
     * @param {Integer} NumDescriptors Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of descriptors to copy.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptorRangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b> that describes the destination descriptors to start to copy to.
     * 
     * The destination and source descriptors must be in heaps of the same [D3D12_DESCRIPTOR_HEAP_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type).
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} SrcDescriptorRangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b> that describes the source descriptors to start to copy from.
     * 
     * > [!IMPORTANT]
     * > The *SrcDescriptorRangeStart* parameter must be in a non shader-visible descriptor heap. This is because shader-visible descriptor heaps may be created in **WRITE_COMBINE** memory or GPU local memory, which is prohibitively slow to read from. If your application manages descriptor heaps via copying the descriptors required for a given pass or frame from local "storage" descriptor heaps to the GPU-bound descriptor heap, then use shader-opaque heaps for the storage heaps and copy into the GPU-visible heap as required.
     * @param {Integer} DescriptorHeapsType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a>-typed value that specifies the type of descriptor heap to copy with. This is required as different descriptor types may have different sizes.
     * 
     * Both the source and destination descriptor heaps must have the same type, else the debug layer will emit an error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-copydescriptorssimple
     */
    CopyDescriptorsSimple(NumDescriptors, DestDescriptorRangeStart, SrcDescriptorRangeStart, DescriptorHeapsType) {
        ComCall(24, this, "uint", NumDescriptors, "ptr", DestDescriptorRangeStart, "ptr", SrcDescriptorRangeStart, "int", DescriptorHeapsType)
    }

    /**
     * Gets the size and alignment of memory required for a collection of resources on this adapter.
     * @param {Integer} visibleMask Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @param {Integer} numResourceDescs Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The number of resource descriptors in the *pResourceDescs* array.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDescs Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * An array of **D3D12_RESOURCE_DESC** structures that described the resources to get info about.
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} Type: **[D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md)**
     * 
     * A [D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md) structure that provides info about video memory allocated for the specified array of resources.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getresourceallocationinfo
     */
    GetResourceAllocationInfo(visibleMask, numResourceDescs, pResourceDescs) {
        result := ComCall(25, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr")
        return result
    }

    /**
     * Divulges the equivalent custom heap properties that are used for non-custom heap types, based on the adapter's architectural properties.
     * @param {Integer} nodeMask Type: <b>UINT</b>
     * 
     * For single-GPU operation, set this to zero.
     *           If there are multiple GPU nodes, set a bit to identify the node (the  device's physical adapter).
     *           Each bit in the mask corresponds to a single node.
     *           Only 1 bit must be set.
     *           See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {Integer} heapType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type">D3D12_HEAP_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type">D3D12_HEAP_TYPE</a>-typed value that specifies the heap to get properties for.
     *           D3D12_HEAP_TYPE_CUSTOM is not supported as a parameter value.
     * @returns {D3D12_HEAP_PROPERTIES} Type: <b><a href="/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a></b>
     * 
     * Returns a <a href="/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure that provides properties for the specified heap.
     *             The <b>Type</b> member of the returned D3D12_HEAP_PROPERTIES is always D3D12_HEAP_TYPE_CUSTOM.
     *           
     * 
     * When <a href="/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture">D3D12_FEATURE_DATA_ARCHITECTURE</a>::UMA is FALSE, the returned D3D12_HEAP_PROPERTIES members convert as follows:
     *           
     * 
     * <table>
     * <tr>
     * <th>Heap Type</th>
     * <th>How the returned D3D12_HEAP_PROPERTIES members convert</th>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_UPLOAD</td>
     * <td><b>CPUPageProperty</b> = WRITE_COMBINE, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_DEFAULT</td>
     * <td><b>CPUPageProperty</b> = NOT_AVAILABLE, <b>MemoryPoolPreference</b> = L1.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_READBACK</td>
     * <td><b>CPUPageProperty</b> = WRITE_BACK, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * </table>
     *  
     * 
     * When D3D12_FEATURE_DATA_ARCHITECTURE::UMA is TRUE and D3D12_FEATURE_DATA_ARCHITECTURE::CacheCoherentUMA is FALSE, the returned D3D12_HEAP_PROPERTIES members convert as follows:
     *           
     * 
     * <table>
     * <tr>
     * <th>Heap Type</th>
     * <th>How the returned D3D12_HEAP_PROPERTIES members convert</th>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_UPLOAD</td>
     * <td><b>CPUPageProperty</b> = WRITE_COMBINE, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_DEFAULT</td>
     * <td><b>CPUPageProperty</b> = NOT_AVAILABLE, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_READBACK</td>
     * <td><b>CPUPageProperty</b> = WRITE_BACK, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * </table>
     *  
     * 
     * When D3D12_FEATURE_DATA_ARCHITECTURE::UMA is TRUE and D3D12_FEATURE_DATA_ARCHITECTURE::CacheCoherentUMA is TRUE, the returned D3D12_HEAP_PROPERTIES members convert as follows:
     *           
     * 
     * <table>
     * <tr>
     * <th>Heap Type</th>
     * <th>How the returned D3D12_HEAP_PROPERTIES members convert</th>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_UPLOAD</td>
     * <td><b>CPUPageProperty</b> = WRITE_BACK, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_DEFAULT</td>
     * <td><b>CPUPageProperty</b> = NOT_AVAILABLE, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * <tr>
     * <td>D3D12_HEAP_TYPE_READBACK</td>
     * <td><b>CPUPageProperty</b> = WRITE_BACK, <b>MemoryPoolPreference</b> = L0.
     *               </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getcustomheapproperties
     */
    GetCustomHeapProperties(nodeMask, heapType) {
        result := ComCall(26, this, "uint", nodeMask, "int", heapType, "ptr")
        return result
    }

    /**
     * Creates both a resource and an implicit heap, such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: **const [D3D12_HEAP_PROPERTIES](./ns-d3d12-d3d12_heap_properties.md)\***
     * 
     * A pointer to a **D3D12_HEAP_PROPERTIES** structure that provides properties for the resource's heap.
     * @param {Integer} HeapFlags Type: **[D3D12_HEAP_FLAGS](./ne-d3d12-d3d12_heap_flags.md)**
     * 
     * Heap options, as a bitwise-OR'd combination of **D3D12_HEAP_FLAGS** enumeration constants.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialResourceState Type: **[D3D12_RESOURCE_STATES](./ne-d3d12-d3d12_resource_states.md)**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_UPLOAD](./ne-d3d12-d3d12_heap_type.md) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_GENERIC_READ](./ne-d3d12-d3d12_resource_states.md).
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_READBACK](./ne-d3d12-d3d12_heap_type.md) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_COPY_DEST](./ne-d3d12-d3d12_resource_states.md).
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](./ns-d3d12-d3d12_clear_value.md)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](./ne-d3d12-d3d12_resource_flags.md) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {Pointer<Guid>} riidResource Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](./nn-d3d12-id3d12resource.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcommittedresource
     */
    CreateCommittedResource(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, riidResource) {
        result := ComCall(27, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", riidResource, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Creates a heap that can be used with placed resources and reserved resources.
     * @param {Pointer<D3D12_HEAP_DESC>} pDesc Type: **const [D3D12_HEAP_DESC](./ns-d3d12-d3d12_heap_desc.md)\***
     * 
     * A pointer to a constant **D3D12_HEAP_DESC** structure that describes the heap.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the heap interface to return in *ppvHeap*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Heap](./nn-d3d12-id3d12heap.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created heap object.
     * 
     * *ppvHeap* can be `nullptr`, to enable capability testing. When *ppvHeap* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createheap
     */
    CreateHeap(pDesc, riid) {
        result := ComCall(28, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * Creates a resource that is placed in a specific heap. Placed resources are the lightest weight resource objects available, and are the fastest to create and destroy.
     * @param {ID3D12Heap} pHeap Type: [in] **<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>***
     * 
     * A pointer to the **ID3D12Heap** interface that represents the heap in which the resource is placed.
     * @param {Integer} HeapOffset Type: **<a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a>**
     * 
     * The offset, in bytes, to the resource. The *HeapOffset* must be a multiple of the resource's alignment, and *HeapOffset* plus the resource size must be smaller than or equal to the heap size. <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">**GetResourceAllocationInfo**</a> must be used to understand the sizes of texture resources.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: [in] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a>***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialState Type: **<a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a>**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * 
     * When a resource is created together with a **D3D12_HEAP_TYPE_UPLOAD** heap, *InitialState* must be **D3D12_RESOURCE_STATE_GENERIC_READ**. When a resource is created together with a **D3D12_HEAP_TYPE_READBACK** heap, *InitialState* must be **D3D12_RESOURCE_STATE_COPY_DEST**.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: [in, optional] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a>***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the **D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET** or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, your application should choose the value that the clear operation will most commonly be called with.
     * 
     * Clear operations can be called with other values, but those operations will not be as efficient as when the value matches the one passed into resource creation.
     * 
     * *pOptimizedClearValue* must be NULL when used with **D3D12_RESOURCE_DIMENSION_BUFFER**.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The globally unique identifier (**GUID**) for the resource interface. This is an input parameter.
     * 
     * The **REFIID**, or **GUID**, of the interface to the resource can be obtained by using the `__uuidof` macro. For example, `__uuidof(ID3D12Resource)` gets the **GUID** of the interface to a resource. Although **riid** is, most commonly, the GUID for <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">**ID3D12Resource**</a>, it may be any **GUID** for any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: [out, optional] **void****
     * 
     * A pointer to a memory block that receives a pointer to the resource. *ppvResource* can be NULL, to enable capability testing. When *ppvResource* is NULL, no object will be created and S_FALSE will be returned when *pResourceDesc* and other parameters are valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createplacedresource
     */
    CreatePlacedResource(pHeap, HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid) {
        result := ComCall(29, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Creates a resource that is reserved, and not yet mapped to any pages in a heap.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialState Type: **[D3D12_RESOURCE_STATES](./ne-d3d12-d3d12_resource_states.md)**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](./ns-d3d12-d3d12_clear_value.md)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](./ne-d3d12-d3d12_resource_flags.md) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*. See **Remarks**.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](./nn-d3d12-id3d12resource.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createreservedresource
     */
    CreateReservedResource(pDesc, InitialState, pOptimizedClearValue, riid) {
        result := ComCall(30, this, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Creates a shared handle to an heap, resource, or fence object.
     * @param {ID3D12DeviceChild} pObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12devicechild">ID3D12DeviceChild</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12devicechild">ID3D12DeviceChild</a> interface that represents the heap, resource, or fence object to create for sharing.
     *             The following interfaces (derived from <b>ID3D12DeviceChild</b>) are supported:
     *             
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>
     * </li>
     * </ul>
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>structure that contains two separate but related data members: an optional security descriptor, and a <b>Boolean</b>value that determines whether child processes can inherit the returned handle.
     *             
     * 
     * Set this parameter to <b>NULL</b> if you want child processes that the
     *               application might create to not  inherit  the handle returned by
     *               <b>CreateSharedHandle</b>, and if you want the resource that is associated with the returned handle to get a default security
     *               descriptor.
     *             
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a
     *               <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> for the resource.
     *               Set this member to <b>NULL</b> if you want the runtime to assign a default security descriptor to the resource that is associated with the returned handle.
     *               The ACLs in the default security descriptor for the resource come from the primary or impersonation token of the creator.
     *               For more info, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} Access Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Currently the only value this parameter accepts is GENERIC_ALL.
     * @param {PWSTR} Name Type: <b>LPCWSTR</b>
     * 
     * A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name to associate with the shared heap.
     *               The name is limited to MAX_PATH characters.
     *               Name comparison is case-sensitive.
     *             
     * 
     * If <i>Name</i> matches the name of an existing resource, <b>CreateSharedHandle</b> fails with <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NAME_ALREADY_EXISTS</a>.
     *               This occurs because these objects share the same namespace.
     *             
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace.
     *               The remainder of the name can contain any character except the backslash character (\\).
     *               For more information, see
     *               <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     *               Fast user switching is implemented using Terminal Services sessions.
     *               Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     *             
     * 
     * The object can be created in a private namespace.
     *               For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * A pointer to a variable that receives the NT HANDLE value to the resource to share.
     *             You can use this handle in calls to access the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createsharedhandle
     */
    CreateSharedHandle(pObject, pAttributes, Access, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pHandle := HANDLE()
        result := ComCall(31, this, "ptr", pObject, "ptr", pAttributes, "uint", Access, "ptr", Name, "ptr", pHandle, "HRESULT")
        return pHandle
    }

    /**
     * Opens a handle for shared resources, shared heaps, and shared fences, by using HANDLE and REFIID.
     * @param {HANDLE} NTHandle Type: <b>HANDLE</b>
     * 
     * The handle that was output by the call to 
     *             <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createsharedhandle">ID3D12Device::CreateSharedHandle</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for one of the following interfaces:
     *             
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>
     * </li>
     * </ul>
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D12Heap) will get the <b>GUID</b> of the interface to a resource.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to one of the following interfaces:
     *             
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-opensharedhandle
     */
    OpenSharedHandle(NTHandle, riid) {
        NTHandle := NTHandle is Win32Handle ? NumGet(NTHandle, "ptr") : NTHandle

        result := ComCall(32, this, "ptr", NTHandle, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    /**
     * Opens a handle for shared resources, shared heaps, and shared fences, by using Name and Access.
     * @param {PWSTR} Name Type: <b>LPCWSTR</b>
     * 
     * The name that was optionally passed as the <i>Name</i> parameter in the call to 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createsharedhandle">ID3D12Device::CreateSharedHandle</a>.
     * @param {Integer} Access Type: <b>DWORD</b>
     * 
     * The access level that was specified in the <i>Access</i> parameter in the call to 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createsharedhandle">ID3D12Device::CreateSharedHandle</a>.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * Pointer to the shared handle.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-opensharedhandlebyname
     */
    OpenSharedHandleByName(Name, Access) {
        Name := Name is String ? StrPtr(Name) : Name

        pNTHandle := HANDLE()
        result := ComCall(33, this, "ptr", Name, "uint", Access, "ptr", pNTHandle, "HRESULT")
        return pNTHandle
    }

    /**
     * Makes objects resident for the device.
     * @param {Integer} NumObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of objects  in the <i>ppObjects</i> array to make resident for the device.
     * @param {Pointer<ID3D12Pageable>} ppObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>*</b>
     * 
     * A pointer to a memory block that contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a> interface pointers for the objects.
     *           
     * 
     * Even though most D3D12 objects inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>, residency changes are only supported on the following objects:
     * Descriptor Heaps, Heaps, Committed Resources, and Query Heaps
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-makeresident
     */
    MakeResident(NumObjects, ppObjects) {
        result := ComCall(34, this, "uint", NumObjects, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * Enables the page-out of data, which precludes GPU access of that data.
     * @param {Integer} NumObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of objects in the <i>ppObjects</i> array to evict from the device.
     * @param {Pointer<ID3D12Pageable>} ppObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>*</b>
     * 
     * A pointer to a memory block that contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a> interface pointers for the objects.
     *           
     * 
     * Even though most D3D12 objects inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>, residency changes are only supported on the following objects:
     * Descriptor Heaps, Heaps, Committed Resources, and Query Heaps
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-evict
     */
    Evict(NumObjects, ppObjects) {
        result := ComCall(35, this, "uint", NumObjects, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * Creates a fence object.
     * @param {Integer} InitialValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The initial value for the fence.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_fence_flags">D3D12_FENCE_FLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_fence_flags">D3D12_FENCE_FLAGS</a>-typed values that are combined by using a bitwise OR operation. 
     *             The resulting value specifies options for the fence.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the fence interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the fence can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D12Fence) will get the <b>GUID</b> of the interface to a fence.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a> interface that is used to access the fence.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createfence
     */
    CreateFence(InitialValue, Flags, riid) {
        result := ComCall(36, this, "uint", InitialValue, "int", Flags, "ptr", riid, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * Gets the reason that the device was removed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns the reason that the device was removed.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * Gets a resource layout that can be copied. Helps the app fill-in D3D12_PLACED_SUBRESOURCE_FOOTPRINT and D3D12_SUBRESOURCE_FOOTPRINT when suballocating space in upload heaps.
     * @remarks
     * 
     * This routine assists the application in filling out
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> and
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_footprint">D3D12_SUBRESOURCE_FOOTPRINT</a> structures, when suballocating space in upload heaps.
     *           The resulting structures are GPU adapter-agnostic, meaning that the values will not vary from one GPU adapter to the next.
     *           <b>GetCopyableFootprints</b> uses specified details about resource formats, texture layouts, and alignment requirements (from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a> structure)  to fill out the subresource structures.
     *           Applications have access to all these details, so this method, or a variation of it, could be  written as part of the app.
     *         
     * 
     * 
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a>*</b>
     * 
     * A description of the resource, as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a> structure.
     * @param {Integer} FirstSubresource Type: <b>UINT</b>
     * 
     * Index of the first subresource in the resource.
     *             The range of valid values is 0 to D3D12_REQ_SUBRESOURCES.
     * @param {Integer} NumSubresources Type: <b>UINT</b>
     * 
     * The number of subresources in the resource.  The range of valid values is 0 to (D3D12_REQ_SUBRESOURCES - <i>FirstSubresource</i>).
     * @param {Integer} BaseOffset Type: <b>UINT64</b>
     * 
     * The offset, in bytes, to the resource.
     * @param {Pointer<D3D12_PLACED_SUBRESOURCE_FOOTPRINT>} pLayouts Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a>*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> structures, to be filled with the description and placement of each subresource.
     * @param {Pointer<Integer>} pNumRows Type: <b>UINT*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of integer  variables, to be filled with the number of rows for each subresource.
     * @param {Pointer<Integer>} pRowSizeInBytes Type: <b>UINT64*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of integer variables, each entry to be filled with the unpadded size in bytes of a row, of each subresource.
     *           
     * 
     * For example, if a Texture2D resource has a width of 32 and bytes per pixel of 4, 
     * 
     * then <i>pRowSizeInBytes</i> returns 128.
     * 
     * <i>pRowSizeInBytes</i> should not be confused with <b>row pitch</b>, as examining <i>pLayouts</i> and getting the row pitch from that will give you 256 as it is aligned to D3D12_TEXTURE_DATA_PITCH_ALIGNMENT.
     * @param {Pointer<Integer>} pTotalBytes Type: <b>UINT64*</b>
     * 
     * A pointer to an integer variable, to be filled with the total size, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getcopyablefootprints
     */
    GetCopyableFootprints(pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, pLayouts, pNumRows, pRowSizeInBytes, pTotalBytes) {
        pNumRowsMarshal := pNumRows is VarRef ? "uint*" : "ptr"
        pRowSizeInBytesMarshal := pRowSizeInBytes is VarRef ? "uint*" : "ptr"
        pTotalBytesMarshal := pTotalBytes is VarRef ? "uint*" : "ptr"

        ComCall(38, this, "ptr", pResourceDesc, "uint", FirstSubresource, "uint", NumSubresources, "uint", BaseOffset, "ptr", pLayouts, pNumRowsMarshal, pNumRows, pRowSizeInBytesMarshal, pRowSizeInBytes, pTotalBytesMarshal, pTotalBytes)
    }

    /**
     * Creates a query heap. A query heap contains an array of queries.
     * @param {Pointer<D3D12_QUERY_HEAP_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_query_heap_desc">D3D12_QUERY_HEAP_DESC</a>*</b>
     * 
     * Specifies the query heap in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_query_heap_desc">D3D12_QUERY_HEAP_DESC</a> structure.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies a REFIID that uniquely identifies the heap.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Specifies a pointer to the heap, that will be returned on successful completion of the method.
     *             <i>ppvHeap</i> can be NULL, to enable capability testing.
     *             When <i>ppvHeap</i> is NULL, no object will be created and S_FALSE will be returned when <i>pDesc</i> is valid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createqueryheap
     */
    CreateQueryHeap(pDesc, riid) {
        result := ComCall(39, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * A development-time aid for certain types of profiling and experimental prototyping.
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * Specifies a BOOL that turns the stable power state on or off.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-setstablepowerstate
     */
    SetStablePowerState(Enable) {
        result := ComCall(40, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * This method creates a command signature.
     * @param {Pointer<D3D12_COMMAND_SIGNATURE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_signature_desc">D3D12_COMMAND_SIGNATURE_DESC</a>*</b>
     * 
     * Describes the command signature to be created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_signature_desc">D3D12_COMMAND_SIGNATURE_DESC</a> structure.
     * @param {ID3D12RootSignature} pRootSignature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a>*</b>
     * 
     * Specifies the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> that the command signature applies to.
     *           
     * 
     * The root signature is required if any of the commands in the signature will update bindings on the pipeline. If the only command present is a draw or dispatch, the root signature parameter can be set to NULL.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the command signature interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandsignature">ID3D12CommandSignature</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the command signature can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<b>ID3D12CommandSignature</b>) will get the <b>GUID</b> of the interface to a command signature.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Specifies a pointer, that on successful completion of the method will point to the created command signature (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandsignature">ID3D12CommandSignature</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-createcommandsignature
     */
    CreateCommandSignature(pDesc, pRootSignature, riid) {
        result := ComCall(41, this, "ptr", pDesc, "ptr", pRootSignature, "ptr", riid, "ptr*", &ppvCommandSignature := 0, "HRESULT")
        return ppvCommandSignature
    }

    /**
     * Gets info about how a tiled resource is broken into tiles.
     * @remarks
     * 
     * To estimate the total resource size of textures needed when calculating heap sizes and calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a>, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">GetResourceAllocationInfo</a> instead of <b>GetResourceTiling</b>.
     *           <b>GetResourceTiling</b> cannot be used for this.
     *         
     * 
     * For more information on tiled resources, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/volume-tiled-resources">Volume Tiled Resources</a>.
     * 
     * 
     * @param {ID3D12Resource} pTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies a tiled <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>  to get info about.
     * @param {Pointer<Integer>} pNumTilesForEntireResource Type: <b>UINT*</b>
     * 
     * A pointer to a variable that receives the number of tiles needed to store the entire tiled resource.
     * @param {Pointer<D3D12_PACKED_MIP_INFO>} pPackedMipDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_packed_mip_info">D3D12_PACKED_MIP_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_packed_mip_info">D3D12_PACKED_MIP_INFO</a> structure that <b>GetResourceTiling</b> fills with info about how the tiled resource's mipmaps are packed.
     * @param {Pointer<D3D12_TILE_SHAPE>} pStandardTileShapeForNonPackedMips Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_shape">D3D12_TILE_SHAPE</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_shape">D3D12_TILE_SHAPE</a> structure that <b>GetResourceTiling</b> fills with info about the tile shape. This is info about how pixels fit in the tiles, independent of tiled resource's dimensions, not including packed mipmaps. If the entire tiled resource is packed, this parameter is meaningless because the tiled resource has no defined layout for packed mipmaps. In this situation, <b>GetResourceTiling</b> sets the members of D3D12_TILE_SHAPE to zeros.
     * @param {Pointer<Integer>} pNumSubresourceTilings Type: <b>UINT*</b>
     * 
     * A pointer to a variable that contains the number of tiles in the subresource. On input, this is the number of subresources to query tilings for; on output, this is the number that was actually retrieved at <i>pSubresourceTilingsForNonPackedMips</i> (clamped to what's available).
     * @param {Integer} FirstSubresourceTilingToGet Type: <b>UINT</b>
     * 
     * The number of the first subresource tile to get. <b>GetResourceTiling</b> ignores this parameter if the number that <i>pNumSubresourceTilings</i> points to is 0.
     * @param {Pointer<D3D12_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_tiling">D3D12_SUBRESOURCE_TILING</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_tiling">D3D12_SUBRESOURCE_TILING</a> structure that <b>GetResourceTiling</b> fills with info about subresource tiles. If subresource tiles are part of packed mipmaps, <b>GetResourceTiling</b> sets the members of D3D12_SUBRESOURCE_TILING to zeros, except the <i>StartTileIndexInOverallResource</i> member, which <b>GetResourceTiling</b> sets to D3D12_PACKED_TILE (0xffffffff). The D3D12_PACKED_TILE constant indicates that the whole <b>D3D12_SUBRESOURCE_TILING</b> structure is meaningless for this situation, and the info that the <i>pPackedMipDesc</i> parameter points to applies.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getresourcetiling
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        pNumTilesForEntireResourceMarshal := pNumTilesForEntireResource is VarRef ? "uint*" : "ptr"
        pNumSubresourceTilingsMarshal := pNumSubresourceTilings is VarRef ? "uint*" : "ptr"

        ComCall(42, this, "ptr", pTiledResource, pNumTilesForEntireResourceMarshal, pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, pNumSubresourceTilingsMarshal, pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
    }

    /**
     * Gets a locally unique identifier for the current device (adapter).
     * @returns {LUID} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LUID</a></b>
     * 
     * The locally unique identifier for the adapter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device-getadapterluid
     */
    GetAdapterLuid() {
        result := ComCall(43, this, "ptr")
        return result
    }
}
