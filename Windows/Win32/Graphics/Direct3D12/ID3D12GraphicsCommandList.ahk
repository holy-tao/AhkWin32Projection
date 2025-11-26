#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12CommandList.ahk

/**
 * Encapsulates a list of graphics commands for rendering. Includes APIs for instrumenting the command list execution, and for setting and clearing the pipeline state.
 * @remarks
 * 
 * This interface is new to D3D12, encapsulating much of the functionality of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface, and including the new functionality described in <a href="https://docs.microsoft.com/windows/desktop/direct3d12/rendering">Rendering</a>.
 *         
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList extends ID3D12CommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList
     * @type {Guid}
     */
    static IID => Guid("{5b160d0f-ac1b-4185-8ba8-b3ae42a5a455}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close", "Reset", "ClearState", "DrawInstanced", "DrawIndexedInstanced", "Dispatch", "CopyBufferRegion", "CopyTextureRegion", "CopyResource", "CopyTiles", "ResolveSubresource", "IASetPrimitiveTopology", "RSSetViewports", "RSSetScissorRects", "OMSetBlendFactor", "OMSetStencilRef", "SetPipelineState", "ResourceBarrier", "ExecuteBundle", "SetDescriptorHeaps", "SetComputeRootSignature", "SetGraphicsRootSignature", "SetComputeRootDescriptorTable", "SetGraphicsRootDescriptorTable", "SetComputeRoot32BitConstant", "SetGraphicsRoot32BitConstant", "SetComputeRoot32BitConstants", "SetGraphicsRoot32BitConstants", "SetComputeRootConstantBufferView", "SetGraphicsRootConstantBufferView", "SetComputeRootShaderResourceView", "SetGraphicsRootShaderResourceView", "SetComputeRootUnorderedAccessView", "SetGraphicsRootUnorderedAccessView", "IASetIndexBuffer", "IASetVertexBuffers", "SOSetTargets", "OMSetRenderTargets", "ClearDepthStencilView", "ClearRenderTargetView", "ClearUnorderedAccessViewUint", "ClearUnorderedAccessViewFloat", "DiscardResource", "BeginQuery", "EndQuery", "ResolveQueryData", "SetPredication", "SetMarker", "BeginEvent", "EndEvent", "ExecuteIndirect"]

    /**
     * Indicates that recording to the command list has finished.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     *               
     * 
     * <ul>
     * <li><b>E_FAIL</b> if the command list has already been closed, or an invalid API was called during command list recording.
     *               </li>
     * <li><b>E_OUTOFMEMORY</b> if the operating system ran out of memory during recording.
     *               </li>
     * <li><b>E_INVALIDARG</b> if an invalid argument was passed to the command list API during recording.
     *               </li>
     * </ul>
     * See <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Resets a command list back to its initial state as if a new command list was just created.
     * @param {ID3D12CommandAllocator} pAllocator Type: <b>ID3D12CommandAllocator*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandallocator">ID3D12CommandAllocator</a> object that the device creates command lists from.
     * @param {ID3D12PipelineState} pInitialState Type: <b>ID3D12PipelineState*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> object that contains the initial pipeline state for the command list.  This is optional and can be NULL.  If NULL, the runtime sets a dummy initial pipeline state so that drivers don't have to deal with undefined state.  The overhead for this is low, particularly for a command list, for which the overall cost of recording the command list likely dwarfs the cost of one initial state setting.  So there is little cost in  not setting the initial pipeline state parameter if it isn't convenient.  
     * 
     * For bundles on the other hand, it might make more sense to try to set the initial state parameter since bundles are likely smaller overall and can be reused frequently.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     *               
     * 
     * <ul>
     * <li><b>E_FAIL</b> if the command list was not in the "closed" state when the <b>Reset</b> call was made, or the per-device limit would have been exceeded.
     *               </li>
     * <li><b>E_OUTOFMEMORY</b> if the operating system ran out of memory.
     *               </li>
     * <li><b>E_INVALIDARG</b> if the allocator is currently being used with another command list in the "recording" state or if the specified allocator was created with the wrong type.
     *               </li>
     * </ul>
     * See <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-reset
     */
    Reset(pAllocator, pInitialState) {
        result := ComCall(10, this, "ptr", pAllocator, "ptr", pInitialState, "HRESULT")
        return result
    }

    /**
     * Resets the state of a direct command list back to the state it was in when the command list was created.
     * @remarks
     * 
     * It is invalid to call <b>ClearState</b> on a bundle.  If an app calls <b>ClearState</b> on a bundle, the call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> will return <b>E_FAIL</b>.
     *       
     * 
     * When <b>ClearState</b> is called, all currently bound resources are unbound.  The primitive topology is set to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY_UNDEFINED</a>.  Viewports, scissor rectangles, stencil reference value, and the blend factor are set to empty values (all zeros).  Predication is disabled.
     *       
     * 
     * The app-provided pipeline state object becomes bound as the currently set pipeline state object.
     * 
     * 
     * @param {ID3D12PipelineState} pPipelineState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> object that contains the initial pipeline state for the command list.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate
     */
    ClearState(pPipelineState) {
        ComCall(11, this, "ptr", pPipelineState)
    }

    /**
     * Draws non-indexed, instanced primitives.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline.
     *         
     * 
     * Instancing might extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be
     *           to draw the same object with different positions and colors.
     *         
     * 
     * The vertex data for an instanced draw call typically comes from a vertex buffer that is bound to the pipeline.
     *           But, you could also provide the vertex data from a shader that has instanced data identified with a system-value semantic (SV_InstanceID).
     *         
     * 
     * 
     * 
     * @param {Integer} VertexCountPerInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of vertices to draw.
     * @param {Integer} InstanceCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of instances to draw.
     * @param {Integer} StartVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first vertex.
     * @param {Integer} StartInstanceLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value added to each index before reading per-instance data from a vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(12, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Draws indexed, instanced primitives.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline.
     * 
     * Instancing might extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be 
     *       to draw the same object with different positions and colors. Instancing requires multiple vertex buffers: at least one for per-vertex data 
     *       and a second buffer for per-instance data.
     * 
     * 
     * 
     * @param {Integer} IndexCountPerInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of indices read from the index buffer for each instance.
     * @param {Integer} InstanceCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of instances to draw.
     * @param {Integer} StartIndexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The location of the first index read by the GPU from the index buffer.
     * @param {Integer} BaseVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value added to each index before reading a vertex from the vertex buffer.
     * @param {Integer} StartInstanceLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value added to each index before reading per-instance data from a vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(13, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Executes a compute shader on a thread group.
     * @remarks
     * 
     * You call the <b>Dispatch</b> method to execute commands in a compute shader. A compute shader can be run on many threads in parallel, within a thread group. Index a particular thread, within a thread group using a 3D vector
     *           given by (x,y,z).
     *         
     * 
     * 
     * 
     * @param {Integer} ThreadGroupCountX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the x direction. <i>ThreadGroupCountX</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
     * @param {Integer} ThreadGroupCountY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the y direction. <i>ThreadGroupCountY</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
     * @param {Integer} ThreadGroupCountZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the z direction.  <i>ThreadGroupCountZ</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
     *             In feature level 10 the value for <i>ThreadGroupCountZ</i> must be 1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-dispatch
     */
    Dispatch(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(14, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }

    /**
     * Copies a region of a buffer from one resource to another.
     * @remarks
     * 
     * Consider using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource">CopyResource</a> method when copying an entire resource, and use this method for copying regions of a resource.
     *         
     * 
     * <b>CopyBufferRegion</b> may be used to initialize resources which alias the same heap memory. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * 
     * 
     * @param {ID3D12Resource} pDstBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies the destination <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>.
     * @param {Integer} DstOffset Type: <b>UINT64</b>
     * 
     * Specifies a UINT64 offset (in bytes) into the destination resource.
     * @param {ID3D12Resource} pSrcBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies the source  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>.
     * @param {Integer} SrcOffset Type: <b>UINT64</b>
     * 
     * Specifies a UINT64 offset (in bytes) into the source resource, to start the copy from.
     * @param {Integer} NumBytes Type: <b>UINT64</b>
     * 
     * Specifies the number of bytes to copy.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion
     */
    CopyBufferRegion(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, NumBytes) {
        ComCall(15, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", NumBytes)
    }

    /**
     * This method uses the GPU to copy texture data between two locations. Both the source and the destination may reference texture data located within either a buffer resource or a texture resource.
     * @remarks
     * 
     * The source box must be within the size of the source resource. The destination offsets, (x, y, and z), allow the source box to be offset when writing into the destination resource; however, the dimensions of the source box and the offsets must be within the size of the resource. If you try and copy outside the destination resource or specify a source box that is larger than the source resource, the behavior of <b>CopyTextureRegion</b> is undefined. If you created a device that supports the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a>, the debug output reports an error on this invalid <b>CopyTextureRegion</b> call. Invalid parameters to <b>CopyTextureRegion</b> cause undefined behavior and might result in incorrect rendering, clipping, no copy, or even the removal of the rendering device.
     *         
     * 
     * If the resources are buffers, all coordinates are in bytes; if the resources are textures, all coordinates are in texels. 
     * 
     * <b>CopyTextureRegion</b> performs the copy on the GPU (similar to a <c>memcpy</c> by the CPU). As a consequence, the source and destination resources:
     *         
     * 
     * <ul>
     * <li>Must be different subresources (although they can be from the same resource).</li>
     * <li>Must have compatible <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>s (identical or from the same type group). For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. <b>CopyTextureRegion</b> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.</li>
     * </ul>
     * <b>CopyTextureRegion</b> only supports copy; it does not support any stretch, color key, or blend. <b>CopyTextureRegion</b> can reinterpret the resource data between a few format types.
     * 
     * Note that for a depth-stencil buffer, the depth and stencil planes are <a href="https://docs.microsoft.com/windows/win32/direct3d12/subresources#plane-slice">separate subresources</a> within the buffer.
     * 
     * To copy an entire resource, rather than just a region of a subresource, we recommend to use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource">CopyResource</a> instead.
     * 
     * <div class="alert"><b>Note</b>  If you use <b>CopyTextureRegion</b> with a depth-stencil buffer or a multisampled resource, you must copy the entire subresource rectangle. In this situation, you must pass 0 to the <i>DstX</i>, <i>DstY</i>, and <i>DstZ</i> parameters and <b>NULL</b> to the <i>pSrcBox</i> parameter. In addition, source and destination resources, which are represented by the <i>pSrcResource</i> and <i>pDstResource</i> parameters, should have identical sample count values.
     *         </div>
     * <div> </div>
     * <b>CopyTextureRegion</b> may be used to initialize resources which alias the same heap memory. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * <h3><a id="Example"></a><a id="example"></a><a id="EXAMPLE"></a>Example</h3>
     * The following code snippet copies the box (located at (120,100),(200,220)) from a source texture into the region (10,20),(90,140) in a destination texture.
     * 
     * 
     * ```
     * D3D12_BOX sourceRegion;
     * sourceRegion.left = 120;
     * sourceRegion.top = 100;
     * sourceRegion.right = 200;
     * sourceRegion.bottom = 220;
     * sourceRegion.front = 0;
     * sourceRegion.back = 1;
     * 
     * pCmdList -> CopyTextureRegion(pDestTexture, 10, 20, 0, pSourceTexture, &sourceRegion);
     * 
     * ```
     * 
     * 
     * Notice, that for a 2D texture, front and back are set to 0 and 1 respectively.
     * 
     * 
     * 
     * @param {Pointer<D3D12_TEXTURE_COPY_LOCATION>} pDst Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a>*</b>
     * 
     * Specifies the destination <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a>. The subresource referred to must be in the D3D12_RESOURCE_STATE_COPY_DEST state.
     * @param {Integer} DstX Type: <b>UINT</b>
     * 
     * The x-coordinate of the upper left corner of the destination region.
     * @param {Integer} DstY Type: <b>UINT</b>
     * 
     * The y-coordinate of the upper left corner of the destination region. For a 1D subresource, this must be zero.
     * @param {Integer} DstZ Type: <b>UINT</b>
     * 
     * The z-coordinate of the upper left corner of the destination region. For a 1D or 2D subresource, this must be zero.
     * @param {Pointer<D3D12_TEXTURE_COPY_LOCATION>} pSrc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a>*</b>
     * 
     * Specifies the source <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a>.
     *           The subresource referred to must be in the D3D12_RESOURCE_STATE_COPY_SOURCE state.
     * @param {Pointer<D3D12_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_box">D3D12_BOX</a>*</b>
     * 
     * Specifies an optional  D3D12_BOX that sets the size of the source texture to copy.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion
     */
    CopyTextureRegion(pDst, DstX, DstY, DstZ, pSrc, pSrcBox) {
        ComCall(16, this, "ptr", pDst, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrc, "ptr", pSrcBox)
    }

    /**
     * Copies the entire contents of the source resource to the destination resource.
     * @remarks
     * 
     * <b>CopyResource</b> operations are performed on the GPU and do not incur a significant CPU workload linearly dependent on the size of the data to copy.
     *         
     * 
     * <b>CopyResource</b> may be used to initialize resources which alias the same heap memory. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer will issue an error if the source subresource is not in the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_COPY_SOURCE</a> state.
     *           
     * 
     * The debug layer will issue an error if the destination subresource is not in the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_COPY_DEST </a>state.
     *           
     * 
     * This method has a few restrictions designed for improving performance. For instance, the source and destination resources:
     * 
     * <ul>
     * <li>Must be different resources.</li>
     * <li>Must be the same type.</li>
     * <li>Must have identical dimensions (including width, height, depth, and size as appropriate).</li>
     * <li>Must have compatible <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI formats</a>, which means the formats must be identical or at least from the same type group. For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. <b>CopyResource</b> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     *           </li>
     * <li>Can't be currently mapped.</li>
     * </ul>
     * <b>CopyResource</b> only supports copy; it doesn't support any stretch, color key, or blend. <b>CopyResource</b> can reinterpret the resource data between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     *         
     * 
     * You can use a   <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">depth-stencil</a> resource as either a source or a destination. Resources created with multi-sampling capability (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a>) can be used as source and destination only if both source and destination have identical multi-sampled count and quality. If source and destination differ in multi-sampled count and quality or if one is multi-sampled and the other is not multi-sampled, the call to <b>CopyResource</b> fails. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resolvesubresource">ResolveSubresource</a> to resolve a multi-sampled resource to a resource that is not multi-sampled.
     *         
     * 
     * The method is an asynchronous call, which may be added to the command-buffer queue. This attempts to remove pipeline stalls that may occur when copying data. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">performance considerations</a>.
     *         
     * 
     * Consider using <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion">CopyBufferRegion</a> if you only need to copy a portion of the data in a resource.
     *         
     * 
     * 
     * 
     * @param {ID3D12Resource} pDstResource Type: <b>ID3D12Resource*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>interface that represents the destination resource.
     * @param {ID3D12Resource} pSrcResource Type: <b>ID3D12Resource*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>interface that represents the source resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(17, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * Copies tiles from buffer to tiled resource or vice versa.
     * @remarks
     * 
     * <b>CopyTiles</b> drops write operations to 
     * 		  unmapped areas and handles read operations from unmapped areas 
     * 		  (except on Tier_1 tiled resources, 
     * 		  where reading and writing unmapped areas is invalid - refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tiled_resources_tier">D3D12_TILED_RESOURCES_TIER</a>).
     *       
     * 
     * If a copy operation involves writing to the same memory location multiple times because multiple locations in the 
     * 		destination resource are mapped to the same tile memory, the resulting write operations to multi-mapped tiles are 
     * 		non-deterministic and non-repeatable; that is, accesses to the tile memory happen in whatever order the hardware 
     * 		happens to execute the copy operation. 
     * 
     * The tiles involved in the copy operation can't include tiles that contain packed mipmaps or results of the copy 
     * 		  operation are undefined. To transfer data to and from mipmaps that the hardware packs into the one-or-more tiles that constitute the packed mips, you must 
     * 		  use the standard (that is, non-tile specific) copy APIs 
     * 		  like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>.
     * 
     * <b>CopyTiles</b> does copy data in a slightly different pattern than the standard copy methods.
     * 
     * The memory layout of the tiles in the non-tiled buffer resource side of the copy operation is linear in memory within 64 KB tiles, which the hardware and driver swizzle and de-swizzle per tile as appropriate when they transfer to and from a tiled resource. For multisample antialiasing (MSAA) surfaces, the hardware and driver traverse each pixel's samples in sample-index order before they move to the next pixel. For tiles that are partially filled on the right side (for a surface that has a width not a multiple of tile width in pixels), the pitch and stride to move down a row is the full size in bytes of the number pixels that would fit across the tile if the tile was full. So, there can be a gap between each row of pixels in memory. Mipmaps that are smaller than a tile are not packed together in the linear layout, which might seem to be a waste of memory space, but as mentioned you can't use <b>CopyTiles</b> to copy to mipmaps that the hardware packs together. You can just use generic copy APIs, like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>, to copy small mipmaps individually.
     * 
     * 
     * @param {ID3D12Resource} pTiledResource Type: <b>ID3D12Resource*</b>
     * 
     * A pointer to a tiled resource.
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate">D3D12_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * A pointer to a
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate">D3D12_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the tiled resource.
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pTileRegionSize Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_region_size">D3D12_TILE_REGION_SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_region_size">D3D12_TILE_REGION_SIZE</a> structure that describes the size of the tiled region.
     * @param {ID3D12Resource} pBuffer Type: <b>ID3D12Resource*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> that represents a default, dynamic, or staging buffer.
     * @param {Integer} BufferStartOffsetInBytes Type: <b>UINT64</b>
     * 
     * The offset in bytes into the buffer at <i>pBuffer</i> to start the operation.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tile_copy_flags">D3D12_TILE_COPY_FLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tile_copy_flags">D3D12_TILE_COPY_FLAGS</a>-typed values that are combined by using a bitwise OR operation and that identifies how to copy tiles.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(18, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "int", Flags)
    }

    /**
     * Copy a multi-sampled resource into a non-multi-sampled resource.
     * @remarks
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer will issue an error if the subresources referenced by the source view is not in the  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RESOLVE_SOURCE</a> state.
     * 
     * The debug layer will issue an error if the destination buffer is not in the  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RESOLVE_DEST</a>state.
     * 
     * The source and destination resources must be the same resource type and have the same dimensions. In addition, they must have compatible formats. There are three scenarios for this:
     * 
     * <table>
     * <tr>
     * <th>Scenario</th>
     * <th>Requirements</th>
     * </tr>
     * <tr>
     * <td>Source and destination are prestructured and typed</td>
     * <td>Both the source and destination must have identical formats and that format must be specified in the Format parameter.</td>
     * </tr>
     * <tr>
     * <td>One resource is prestructured and typed and the other is prestructured and typeless</td>
     * <td>The typed resource must have a format that is compatible with the typeless resource (i.e. the typed resource is DXGI_FORMAT_R32_FLOAT and the typeless resource is DXGI_FORMAT_R32_TYPELESS). The format of the typed resource must be specified in the Format parameter.</td>
     * </tr>
     * <tr>
     * <td>Source and destination are prestructured and typeless</td>
     * <td>Both the source and desintation must have the same typeless format (i.e. both must have DXGI_FORMAT_R32_TYPELESS), and the Format parameter must specify a format that is compatible with the source and destination (i.e. if both are DXGI_FORMAT_R32_TYPELESS then DXGI_FORMAT_R32_FLOAT could be specified in the Format parameter).
     *               For example, given the DXGI_FORMAT_R16G16B16A16_TYPELESS format:
     *               
     * 
     * <ul>
     * <li>The source (or dest) format could be DXGI_FORMAT_R16G16B16A16_UNORM</li>
     * <li>The dest (or source) format could be DXGI_FORMAT_R16G16B16A16_FLOAT</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D12Resource} pDstResource Type: [in] <b>ID3D12Resource*</b>
     * 
     * Destination resource. Must be a created on a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type">D3D12_HEAP_TYPE_DEFAULT</a> heap and be single-sampled. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>.
     * @param {Integer} DstSubresource Type: [in] <b>UINT</b>
     * 
     * A zero-based index, that identifies the destination subresource. Use <a href="https://docs.microsoft.com/windows/win32/direct3d12/d3d12calcsubresource">D3D12CalcSubresource</a> to calculate the subresource index if the parent resource is complex.
     * @param {ID3D12Resource} pSrcResource Type: [in] <b>ID3D12Resource*</b>
     * 
     * Source resource. Must be multisampled.
     * @param {Integer} SrcSubresource Type: [in] <b>UINT</b>
     * 
     * The source subresource of the source resource.
     * @param {Integer} Format Type: [in] <b>DXGI_FORMAT</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> that indicates how the multisampled resource will be resolved to a single-sampled resource. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(19, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * Bind information about the primitive type, and data order that describes input data for the input assembler stage.
     * @param {Integer} PrimitiveTopology Type: <b>D3D12_PRIMITIVE_TOPOLOGY</b>
     * 
     * The type of primitive and ordering of the primitive data (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-iasetprimitivetopology
     */
    IASetPrimitiveTopology(PrimitiveTopology) {
        ComCall(20, this, "int", PrimitiveTopology)
    }

    /**
     * Bind an array of viewports to the rasterizer stage of the pipeline.
     * @remarks
     * 
     * All viewports must be set atomically as one operation. Any viewports not defined by the call are disabled.
     *         
     * 
     * Which viewport to use is determined by the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">SV_ViewportArrayIndex</a> semantic output by a geometry shader; if a geometry shader does not specify the semantic, Direct3D will use the first viewport in the array.
     *         
     * 
     * <div class="alert"><b>Note</b>  Even though you specify float values to the members of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_viewport">D3D12_VIEWPORT</a> structure for the <i>pViewports</i> array in a call to  <b>RSSetViewports</b> for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9_x, <b>RSSetViewports</b> uses DWORDs internally. Because of this behavior, when you use a negative top left corner for the viewport, the call to  <b>RSSetViewports</b> for feature levels 9_x fails. This failure occurs because <b>RSSetViewports</b> for 9_x casts the floating point values into unsigned integers without validation, which results in integer overflow.
     *       </div>
     * <div> </div>
     * 
     * 
     * @param {Integer} NumViewports Type: <b>UINT</b>
     * 
     * Number of viewports to bind.
     *             The range of valid values is (0, D3D12_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE).
     * @param {Pointer<D3D12_VIEWPORT>} pViewports Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_viewport">D3D12_VIEWPORT</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_viewport">D3D12_VIEWPORT</a> structures to bind to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(21, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * Binds an array of scissor rectangles to the rasterizer stage.
     * @remarks
     * 
     * All scissor rectangles must be set atomically as one operation. Any scissor rectangles not defined by the call are disabled.
     *         
     * 
     * Which scissor rectangle to use is determined by the <c>SV_ViewportArrayIndex</code> semantic output by a geometry shader (see shader semantic syntax). If a geometry shader does not make use of the <code>SV_ViewportArrayIndex</c> semantic then Direct3D will use the first scissor rectangle in the array.
     *         
     * 
     * Each scissor rectangle in the array corresponds to a viewport in an array of viewports (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-rssetviewports">RSSetViewports</a>).
     *         
     * 
     * 
     * 
     * @param {Integer} NumRects Type: <b>UINT</b>
     * 
     * The number of scissor rectangles to bind.
     * @param {Pointer<RECT>} pRects Type: <b>const D3D12_RECT*</b>
     * 
     * An array of scissor rectangles.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(22, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Sets the blend factor that modulate values for a pixel shader, render target, or both.
     * @remarks
     * 
     * If you created the blend-state object with [D3D12_BLEND_BLEND_FACTOR](./ne-d3d12-d3d12_blend.md) or **D3D12_BLEND_INV_BLEND_FACTOR**, then the blending stage uses the non-NULL array of blend factors. Otherwise,the blending stage doesn't use the non-NULL array of blend factors; the runtime stores the blend factors.
     * 
     * If you pass NULL, then the runtime uses or stores a blend factor equal to `{ 1, 1, 1, 1 }`.
     * 
     * 
     * @param {Pointer<Float>} BlendFactor Type: <b>const FLOAT[4]</b>
     * 
     * Array of blend factors, one for each RGBA component.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-omsetblendfactor
     */
    OMSetBlendFactor(BlendFactor) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"

        ComCall(23, this, BlendFactorMarshal, BlendFactor)
    }

    /**
     * Sets the reference value for depth stencil tests.
     * @param {Integer} StencilRef Type: <b>UINT</b>
     * 
     * Reference value to perform against when doing a depth-stencil test.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-omsetstencilref
     */
    OMSetStencilRef(StencilRef) {
        ComCall(24, this, "uint", StencilRef)
    }

    /**
     * Sets all shaders and programs most of the fixed-function state of the graphics processing unit (GPU) pipeline.
     * @param {ID3D12PipelineState} pPipelineState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> containing the pipeline state data.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setpipelinestate
     */
    SetPipelineState(pPipelineState) {
        ComCall(25, this, "ptr", pPipelineState)
    }

    /**
     * Notifies the driver that it needs to synchronize multiple accesses to resources.
     * @remarks
     * 
     * There are three types of barrier descriptions:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_transition_barrier">D3D12_RESOURCE_TRANSITION_BARRIER</a> -  Transition barriers  indicate that a set of subresources transition between different usages.  The caller must specify the <i>before</i> and <i>after</i> usages of the subresources.  The D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES flag is used to transition all subresources in a resource at the same time.
     *           </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_aliasing_barrier">D3D12_RESOURCE_ALIASING_BARRIER</a> - Aliasing barriers indicate a transition between usages of two different resources which have mappings into the same heap.  The application can specify both the before and the after resource.  Note that one or both resources can be NULL (indicating that any tiled resource could cause aliasing).
     *           </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_uav_barrier">D3D12_RESOURCE_UAV_BARRIER</a> - Unordered access view barriers indicate all UAV accesses (read or writes) to a particular resource must complete before any future UAV accesses (read or write) can begin.  The specified resource may be NULL.  It is not necessary to insert a UAV barrier between two draw or dispatch calls which only read a UAV.  Additionally, it is not necessary to insert a UAV barrier between two draw or dispatch calls which write to the same UAV if the application knows that it is safe to execute the UAV accesses in any order.  The resource can be NULL (indicating that any UAV access could require the barrier).
     *           </li>
     * </ul>
     * When <b>ID3D12GraphicsCommandList::ResourceBarrier</b> is passed an array of resource barrier descriptions, the API behaves as if it was called N times (1 for each array element), in the specified order.
     *       Transitions should be batched together into a single API call when possible, as a performance optimization.
     * 
     * For descriptions of the usage states a subresource can be in, see the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration and the <a href="https://docs.microsoft.com/windows/win32/direct3d12/using-resource-barriers-to-synchronize-resource-states-in-direct3d-12">Using Resource Barriers to Synchronize Resource States in Direct3D 12</a> section. 
     * 
     * All subresources in a resource must be in the RENDER_TARGET state, or DEPTH_WRITE state, for render targets/depth-stencil resources respectively, when  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource">ID3D12GraphicsCommandList::DiscardResource</a> is called.
     *         
     * 
     * When a back buffer is presented, it must be in the D3D12_RESOURCE_STATE_PRESENT state.  If <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> is called on a resource which is not in the PRESENT state, a debug layer warning will be emitted.
     *       
     * 
     * The resource usage bits are group into two categories, read-only and read/write.
     * 
     * The following usage bits are read-only:
     *         
     * 
     * <ul>
     * <li>D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER</li>
     * <li>D3D12_RESOURCE_STATE_INDEX_BUFFER</li>
     * <li>D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</li>
     * <li>D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE</li>
     * <li>D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT</li>
     * <li>D3D12_RESOURCE_STATE_COPY_SOURCE</li>
     * <li>D3D12_RESOURCE_STATE_DEPTH_READ</li>
     * </ul>
     * The following usage bits are read/write:
     * 
     * <ul>
     * <li>D3D12_RESOURCE_STATE_UNORDERED_ACCESS</li>
     * <li>D3D12_RESOURCE_STATE_DEPTH_WRITE</li>
     * </ul>
     * The following usage bits are write-only:
     * 
     * <ul>
     * <li>D3D12_RESOURCE_STATE_COPY_DEST</li>
     * <li>D3D12_RESOURCE_STATE_RENDER_TARGET</li>
     * <li>D3D12_RESOURCE_STATE_STREAM_OUT</li>
     * </ul>
     * At most one write bit can be set.
     *           If any write bit is set, then no read bit may be set.
     *           If no write bit is set, then any number of read bits may be set.  
     * 
     * At any given time, a subresource is in exactly one  state (determined by a set of flags).  The application must ensure that the states are matched when making a sequence of <b>ResourceBarrier</b> calls. In other words, the before and after states in consecutive calls to <b>ResourceBarrier</b> must agree.
     *         
     * 
     * To transition all subresources within a resource, the application can set the subresource index to D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES, which implies that all subresources are changed.
     * 
     * For improved performance, applications should use split barriers (refer to
     *         <a href="https://docs.microsoft.com/windows/win32/direct3d12/user-mode-heap-synchronization">Multi-engine synchronization</a>). Your application should also batch multiple transitions into a single call whenever possible.
     *       
     * 
     * <h3><a id="Runtime_validation"></a><a id="runtime_validation"></a><a id="RUNTIME_VALIDATION"></a>Runtime validation</h3>
     * The runtime will validate that the barrier type values are valid members of the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_barrier_type">D3D12_RESOURCE_BARRIER_TYPE</a> enumeration.
     *           
     * 
     * In addition, the runtime checks the following:
     *           
     * 
     * <ul>
     * <li>The resource pointer is non-NULL.</li>
     * <li>The subresource index is valid</li>
     * <li>The before and after states are supported by the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_binding_tier">D3D12_RESOURCE_BINDING_TIER</a> and <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAGS</a> flags of the resource.
     *             </li>
     * <li>Reserved bits in the state masks are not set.</li>
     * <li>The before and after states are different.</li>
     * <li>The set of bits in the before and after states are valid.</li>
     * <li>If the D3D12_RESOURCE_STATE_RESOLVE_SOURCE bit is set, then the resource sample count must be greater than 1.</li>
     * <li>If the D3D12_RESOURCE_STATE_RESOLVE_DEST bit is set, then the resource sample count must be equal to 1.</li>
     * </ul>
     * For aliasing barriers the runtime will validate that, if either resource pointer is non-NULL, it refers to a tiled resource.
     * 
     * For UAV barriers the runtime will validate that, if the resource is non-NULL, the resource has the D3D12_RESOURCE_STATE_UNORDERED_ACCESS bind flag set.
     *           
     * 
     * Validation failure causes <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">ID3D12GraphicsCommandList::Close</a> to return E_INVALIDARG.
     *           
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer normally issues errors where runtime validation fails:
     * 
     * <ul>
     * <li>If a  subresource transition in a command list is inconsistent with previous transitions in the same command list. </li>
     * <li>If a resource is used without first calling <b>ResourceBarrier</b> to put the resource into the correct state.  </li>
     * <li>If a resource is illegally bound for read and write at the same time.</li>
     * <li>If the <i>before</i> states passed to the <b>ResourceBarrier</b> do not match the <i>after</i> states of previous calls to <b>ResourceBarrier</b>, including the aliasing case.
     *             </li>
     * </ul>
     * Whereas the debug layer attempts to validate the runtime rules, it operates conservatively so that debug layer errors are real errors, and in some cases real errors may not produce debug layer errors. 
     * 
     * The debug layer will issue warnings in the following cases:
     * 
     * <ul>
     * <li>All of the cases where the D3D11 debug layer would issues warnings for <a href="https://docs.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-tiledresourcebarrier">ID3D11DeviceContext2::TiledResourceBarrier</a>.
     *             </li>
     * <li>If a depth buffer is used in a non-read-only mode while the resource has the D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE usage bit set.</li>
     * </ul>
     * 
     * 
     * @param {Integer} NumBarriers Type: <b>UINT</b>
     * 
     * The number of submitted barrier descriptions.
     * @param {Pointer<D3D12_RESOURCE_BARRIER>} pBarriers Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a>*</b>
     * 
     * Pointer to an array of barrier descriptions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-resourcebarrier
     */
    ResourceBarrier(NumBarriers, pBarriers) {
        ComCall(26, this, "uint", NumBarriers, "ptr", pBarriers)
    }

    /**
     * Executes a bundle.
     * @remarks
     * 
     * Bundles inherit all state from the parent command list on which <b>ExecuteBundle</b> is called, except the pipeline state object and primitive topology.
     *         All of the state that is set in a bundle will affect the state of the parent command list.
     *         Note that <b>ExecuteBundle</b> is not a predicated operation.
     *       
     * 
     * <h3><a id="Runtime_validation"></a><a id="runtime_validation"></a><a id="RUNTIME_VALIDATION"></a>Runtime validation</h3>
     * The runtime will validate that the "callee" is a bundle and that the "caller" is a direct command list.  The runtime will also validate that the bundle has been closed.  If the contract is violated, the runtime will silently drop the call.
     *             Validation failure will result in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> returning E_INVALIDARG.
     *           
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer will issue a warning in the same cases where the runtime will fail.
     *             The debug layer will issue a warning if a predicate is set when <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists">ExecuteCommandList</a> is called.
     *             Also, the debug layer will issue an error if it detects that any resource reference by the command list has been destroyed.
     *           
     * 
     * The debug layer will also validate that the command allocator associated with the bundle has not been reset since <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> was called on the command list.  This validation occurs at <b>ExecuteBundle</b> time, and when the parent command list is executed on a command queue.
     *           
     * 
     * 
     * 
     * @param {ID3D12GraphicsCommandList} pCommandList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12graphicscommandlist">ID3D12GraphicsCommandList</a>*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12graphicscommandlist">ID3D12GraphicsCommandList</a> that determines the bundle to be executed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-executebundle
     */
    ExecuteBundle(pCommandList) {
        ComCall(27, this, "ptr", pCommandList)
    }

    /**
     * Changes the currently bound descriptor heaps that are associated with a command list.
     * @remarks
     * 
     * <b>SetDescriptorHeaps</b> can be called on a bundle, but the bundle descriptor heaps must match the calling command list descriptor heap. For more information on bundle restrictions, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/recording-command-lists-and-bundles">Creating and Recording Command Lists and Bundles</a>.
     * 
     * All previously set heaps are unset by the call. At most one heap of each shader-visible type can be set in the call.
     * 
     * Changing descriptor heaps can incur a pipeline flush on some hardware. Because of this, it is recommended to use a single shader-visible heap of each type, and set it once per frame, rather than regularly changing the bound descriptor heaps. Instead, use [**ID3D12Device::CopyDescriptors**](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptors) and [**ID3D12Device::CopyDescriptorsSimple**](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple) to copy the required descriptors from shader-opaque heaps to the single shader-visible heap as required during rendering.
     * 
     * 
     * @param {Integer} NumDescriptorHeaps Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of descriptor heaps to bind.
     * @param {Pointer<ID3D12DescriptorHeap>} ppDescriptorHeaps Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12descriptorheap">ID3D12DescriptorHeap</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12descriptorheap">ID3D12DescriptorHeap</a> objects for the heaps to set on the command list.
     * 
     * You can only bind descriptor heaps of type [**D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps) and [**D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps).
     * 
     * Only one descriptor heap of each type can be set at one time, which means a maximum of 2 heaps (one sampler, one CBV/SRV/UAV) can be set at one time.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps
     */
    SetDescriptorHeaps(NumDescriptorHeaps, ppDescriptorHeaps) {
        ComCall(28, this, "uint", NumDescriptorHeaps, "ptr*", ppDescriptorHeaps)
    }

    /**
     * Sets the layout of the compute root signature.
     * @param {ID3D12RootSignature} pRootSignature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootsignature
     */
    SetComputeRootSignature(pRootSignature) {
        ComCall(29, this, "ptr", pRootSignature)
    }

    /**
     * Sets the layout of the graphics root signature.
     * @param {ID3D12RootSignature} pRootSignature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootsignature
     */
    SetGraphicsRootSignature(pRootSignature) {
        ComCall(30, this, "ptr", pRootSignature)
    }

    /**
     * Sets a descriptor table into the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b>UINT</b>
     * 
     * The slot number for binding.
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle">D3D12_GPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A GPU_descriptor_handle object for the base descriptor to set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootdescriptortable
     */
    SetComputeRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(31, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
    }

    /**
     * Sets a descriptor table into the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle">D3D12_GPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A GPU_descriptor_handle object for the base descriptor to set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootdescriptortable
     */
    SetGraphicsRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(32, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
    }

    /**
     * Sets a constant in the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b>UINT</b>
     * 
     * The slot number for binding.
     * @param {Integer} SrcData Type: <b>UINT</b>
     * 
     * The source data for the constant to set.
     * @param {Integer} DestOffsetIn32BitValues Type: <b>UINT</b>
     * 
     * The offset, in 32-bit values, to set the constant in the root signature.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputeroot32bitconstant
     */
    SetComputeRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(33, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * Sets a constant in the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} SrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The source data for the constant to set.
     * @param {Integer} DestOffsetIn32BitValues Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset, in 32-bit values, to set the constant in the root signature.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsroot32bitconstant
     */
    SetGraphicsRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(34, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * Sets a group of constants in the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} Num32BitValuesToSet Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of constants to set in the root signature.
     * @param {Pointer<Void>} pSrcData Type: <b>const void*</b>
     * 
     * The source data for the group of constants to set.
     * @param {Integer} DestOffsetIn32BitValues Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset, in 32-bit values, to set the first constant of the group in the root signature.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputeroot32bitconstants
     */
    SetComputeRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(35, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, pSrcDataMarshal, pSrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * Sets a group of constants in the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} Num32BitValuesToSet Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of constants to set in the root signature.
     * @param {Pointer<Void>} pSrcData Type: <b>const void*</b>
     * 
     * The source data for the group of constants to set.
     * @param {Integer} DestOffsetIn32BitValues Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset, in 32-bit values, to set the first constant of the group in the root signature.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsroot32bitconstants
     */
    SetGraphicsRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(36, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, pSrcDataMarshal, pSrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * Sets a CPU descriptor handle for the constant buffer in the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b>UINT</b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * Specifies the D3D12_GPU_VIRTUAL_ADDRESS of the constant buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootconstantbufferview
     */
    SetComputeRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(37, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets a CPU descriptor handle for the constant buffer in the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * The GPU virtual address of the constant buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootconstantbufferview
     */
    SetGraphicsRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(38, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets a CPU descriptor handle for the shader resource in the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b>UINT</b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * The GPU virtual address of the buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootshaderresourceview
     */
    SetComputeRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(39, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets a CPU descriptor handle for the shader resource in the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * The GPU virtual address of the Buffer.
     *             Textures are not supported. D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootshaderresourceview
     */
    SetGraphicsRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(40, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets a CPU descriptor handle for the unordered-access-view resource in the compute root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * The GPU virtual address of the buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootunorderedaccessview
     */
    SetComputeRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(41, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets a CPU descriptor handle for the unordered-access-view resource in the graphics root signature.
     * @param {Integer} RootParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The slot number for binding.
     * @param {Integer} BufferLocation Type: <b>D3D12_GPU_VIRTUAL_ADDRESS</b>
     * 
     * The GPU virtual address of the buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootunorderedaccessview
     */
    SetGraphicsRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(42, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * Sets the view for the index buffer.
     * @remarks
     * 
     * Only one index buffer can be bound to the graphics pipeline at any one time.
     * 
     * 
     * 
     * @param {Pointer<D3D12_INDEX_BUFFER_VIEW>} pView Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_index_buffer_view">D3D12_INDEX_BUFFER_VIEW</a>*</b>
     * 
     * The view specifies the index buffer's address, size, and <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_index_buffer_view">D3D12_INDEX_BUFFER_VIEW</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-iasetindexbuffer
     */
    IASetIndexBuffer(pView) {
        ComCall(43, this, "ptr", pView)
    }

    /**
     * Sets a CPU descriptor handle for the vertex buffers.
     * @param {Integer} StartSlot Type: <b>UINT</b>
     * 
     * Index into the device's zero-based array to begin setting vertex buffers.
     * @param {Integer} NumViews Type: <b>UINT</b>
     * 
     * The number of views in the <i>pViews</i> array.
     * @param {Pointer<D3D12_VERTEX_BUFFER_VIEW>} pViews Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_vertex_buffer_view">D3D12_VERTEX_BUFFER_VIEW</a>*</b>
     * 
     * Specifies the vertex buffer views in an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_vertex_buffer_view">D3D12_VERTEX_BUFFER_VIEW</a> structures.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumViews, pViews) {
        ComCall(44, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
    }

    /**
     * Sets the stream output buffer views.
     * @param {Integer} StartSlot Type: <b>UINT</b>
     * 
     * Index into the device's zero-based array to begin setting stream output buffers.
     * @param {Integer} NumViews Type: <b>UINT</b>
     * 
     * The number of entries in the <i>pViews</i> array.
     * @param {Pointer<D3D12_STREAM_OUTPUT_BUFFER_VIEW>} pViews Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_stream_output_buffer_view">D3D12_STREAM_OUTPUT_BUFFER_VIEW</a>*</b>
     * 
     * Specifies an array of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_stream_output_buffer_view">D3D12_STREAM_OUTPUT_BUFFER_VIEW</a> structures.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-sosettargets
     */
    SOSetTargets(StartSlot, NumViews, pViews) {
        ComCall(45, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
    }

    /**
     * Sets CPU descriptor handles for the render targets and depth stencil.
     * @param {Integer} NumRenderTargetDescriptors Type: <b>UINT</b>
     * 
     * The number of entries in the <i>pRenderTargetDescriptors</i> array (ranges between 0 and <b>D3D12_SIMULTANEOUS_RENDER_TARGET_COUNT</b>). If this parameter is nonzero, the number of entries in the array to which pRenderTargetDescriptors points must equal the number in this parameter.
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pRenderTargetDescriptors Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>*</b>
     * 
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a> structures that describe the CPU descriptor handles that represents the start of the heap of render target descriptors. If this parameter is NULL and NumRenderTargetDescriptors is 0, no render targets are bound.
     * @param {BOOL} RTsSingleHandleToDescriptorRange Type: <b>BOOL</b>
     * 
     * <b>True</b> means the handle passed in is the pointer to a contiguous range of <i>NumRenderTargetDescriptors</i>  descriptors.  This case is useful if the set of descriptors to bind already happens to be contiguous in memory (so all that’s needed is a handle to the first one).  For example, if  <i>NumRenderTargetDescriptors</i> is 3 then the memory layout is taken as follows:
     * 
     * <img alt="Memory layout with parameter set to true" src="./images/oms_true.png"/>
     * In this case the driver dereferences the handle and then increments the memory being pointed to.
     * 
     * <b>False</b> means that the handle is the first of an array of <i>NumRenderTargetDescriptors</i> handles.  The false case allows an application to bind a set of descriptors from different locations at once. Again assuming that <i>NumRenderTargetDescriptors</i> is 3, the memory layout is taken as follows:
     * 
     * <img alt="Memory layout with parameter set to false" src="./images/oms_false.png"/>
     * In this case the driver dereferences three handles that are expected to be adjacent to each other in memory.
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDepthStencilDescriptor Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a> structure that describes the CPU descriptor handle that represents the start of the heap that holds the depth stencil descriptor. If this parameter is NULL, no depth stencil descriptor is bound.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-omsetrendertargets
     */
    OMSetRenderTargets(NumRenderTargetDescriptors, pRenderTargetDescriptors, RTsSingleHandleToDescriptorRange, pDepthStencilDescriptor) {
        ComCall(46, this, "uint", NumRenderTargetDescriptors, "ptr", pRenderTargetDescriptors, "int", RTsSingleHandleToDescriptorRange, "ptr", pDepthStencilDescriptor)
    }

    /**
     * Clears the depth-stencil resource.
     * @remarks
     * 
     * <b>ClearDepthStencilView</b> may be used to initialize resources which alias the same heap memory. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * <h3><a id="Runtime_validation"></a><a id="runtime_validation"></a><a id="RUNTIME_VALIDATION"></a>Runtime validation</h3>
     * For floating-point inputs, the runtime will set denormalized values to 0 (while preserving NANs).
     *           
     * 
     * Validation failure will result in the call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> returning <b>E_INVALIDARG</b>.
     *           
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer will issue errors if the input colors are denormalized.
     *           
     * 
     * The debug layer will issue an error if the subresources referenced by the view are not in the appropriate state.
     *             For <b>ClearDepthStencilView</b>, the state must be in the state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_DEPTH_WRITE</a>.
     *           
     * 
     * 
     * 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Describes the CPU descriptor handle that represents the start of the heap for the depth stencil to be cleared.
     * @param {Integer} ClearFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_clear_flags">D3D12_CLEAR_FLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_clear_flags">D3D12_CLEAR_FLAGS</a> values that are combined by using a bitwise OR operation. The resulting value identifies the type of data to clear (depth buffer, stencil buffer, or both).
     * @param {Float} Depth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * A value to clear the depth buffer with. This value will be clamped between 0 and 1.
     * @param {Integer} Stencil Type: <b>UINT8</b>
     * 
     * A value to clear the stencil buffer with.
     * @param {Integer} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rectangles in the array that the <i>pRects</i> parameter specifies.
     * @param {Pointer<RECT>} pRects Type: <b>const <b>D3D12_RECT</b>*</b>
     * 
     * An array of <b>D3D12_RECT</b> structures for the rectangles in the resource view to clear. If <b>NULL</b>, <b>ClearDepthStencilView</b> clears the entire resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview
     */
    ClearDepthStencilView(DepthStencilView, ClearFlags, Depth, Stencil, NumRects, pRects) {
        ComCall(47, this, "ptr", DepthStencilView, "int", ClearFlags, "float", Depth, "char", Stencil, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Sets all the elements in a render target to one value.
     * @remarks
     * 
     * <b>ClearRenderTargetView</b> may be used to initialize resources which alias the same heap memory. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * <h3><a id="Runtime_validation"></a><a id="runtime_validation"></a><a id="RUNTIME_VALIDATION"></a>Runtime validation</h3>
     * For floating-point inputs, the runtime will set denormalized values to 0 (while preserving NANs).  
     * 
     * Validation failure will result in the call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> returning <b>E_INVALIDARG</b>.
     *           
     * 
     * <h3><a id="Debug_layer"></a><a id="debug_layer"></a><a id="DEBUG_LAYER"></a>Debug layer</h3>
     * The debug layer will issue errors if the input colors are denormalized.
     * 
     * The debug layer will issue an error if the subresources referenced by the view are not in the appropriate state.
     *             For <b>ClearRenderTargetView</b>, the state must be <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RENDER_TARGET</a>.
     *           
     * 
     * 
     * 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} RenderTargetView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Specifies a D3D12_CPU_DESCRIPTOR_HANDLE structure that describes the CPU descriptor handle that represents the start of the heap for the render target to be cleared.
     * @param {Pointer<Float>} ColorRGBA Type: <b>const FLOAT[4]</b>
     * 
     * A 4-component array that represents the color to fill the render target with.
     * @param {Integer} NumRects Type: <b>UINT</b>
     * 
     * The number of rectangles in the array that the <i>pRects</i> parameter specifies.
     * @param {Pointer<RECT>} pRects Type: <b>const D3D12_RECT*</b>
     * 
     * An array of <b>D3D12_RECT</b> structures for the rectangles in the resource view to clear. If <b>NULL</b>, <b>ClearRenderTargetView</b> clears the entire resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-clearrendertargetview
     */
    ClearRenderTargetView(RenderTargetView, ColorRGBA, NumRects, pRects) {
        ColorRGBAMarshal := ColorRGBA is VarRef ? "float*" : "ptr"

        ComCall(48, this, "ptr", RenderTargetView, ColorRGBAMarshal, ColorRGBA, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Sets all the elements in a unordered-access view (UAV) to the specified integer values.
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap Type: [in] **[D3D12_GPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_gpu_descriptor_handle.md)**
     * 
     * A [D3D12_GPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_gpu_descriptor_handle.md) that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must be in a shader-visible descriptor heap, which must be set on the command list via [SetDescriptorHeaps](nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps.md).
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle Type: [in] **[D3D12_CPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_cpu_descriptor_handle.md)**
     * 
     * A [D3D12_CPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_cpu_descriptor_handle.md) in a non-shader visible descriptor heap that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared.
     *           
     * > [!IMPORTANT]
     * > This descriptor must not be in a shader-visible descriptor heap. This is to allow drivers thath implement the clear as fixed-function hardware (rather than via a dispatch) to efficiently read from the descriptor, as shader-visible heaps may be created in **WRITE_BACK** memory (similar to **D3D12_HEAP_TYPE_UPLOAD** heap types), and CPU reads from this type of memory are prohibitively slow.
     * @param {ID3D12Resource} pResource Type: [in] **[ID3D12Resource](./nn-d3d12-id3d12resource.md)\***
     * 
     * A pointer to the [ID3D12Resource](./nn-d3d12-id3d12resource.md) interface that represents the unordered-access-view (UAV) resource to clear.
     * @param {Pointer<Integer>} Values Type: [in] **const UINT[4]**
     * 
     * A 4-component array that containing the values to fill the unordered-access-view resource with.
     * @param {Integer} NumRects Type: [in] **UINT**
     * 
     * The number of rectangles in the array that the *pRects* parameter specifies.
     * @param {Pointer<RECT>} pRects Type: [in] **const [D3D12_RECT](/windows/win32/direct3d12/d3d12-rect)\***
     * 
     * An array of **D3D12_RECT** structures for the rectangles in the resource view to clear. If **NULL**, **ClearUnorderedAccessViewUint** clears the entire resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewuint
     */
    ClearUnorderedAccessViewUint(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ValuesMarshal := Values is VarRef ? "uint*" : "ptr"

        ComCall(49, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, ValuesMarshal, Values, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Sets all the elements in a unordered access view to the specified float values.
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap Type: [in] **[D3D12_GPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_gpu_descriptor_handle.md)**
     * 
     * A [D3D12_GPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_gpu_descriptor_handle.md) that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must be in a shader-visible descriptor heap, which must be set on the command list via [SetDescriptorHeaps](nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps.md).
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle Type: [in] **[D3D12_CPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_cpu_descriptor_handle.md)**
     * 
     * A [D3D12_CPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_cpu_descriptor_handle.md) in a non-shader visible descriptor heap that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared.
     *           
     * > [!IMPORTANT]
     * > This descriptor must not be in a shader-visible descriptor heap. This is to allow drivers thath implement the clear as fixed-function hardware (rather than via a dispatch) to efficiently read from the descriptor, as shader-visible heaps may be created in **WRITE_BACK** memory (similar to **D3D12_HEAP_TYPE_UPLOAD** heap types), and CPU reads from this type of memory are prohibitively slow.
     * @param {ID3D12Resource} pResource Type: [in] **[ID3D12Resource](./nn-d3d12-id3d12resource.md)\***
     * 
     * A pointer to the [ID3D12Resource](./nn-d3d12-id3d12resource.md) interface that represents the unordered-access-view (UAV) resource to clear.
     * @param {Pointer<Float>} Values Type: [in] **const FLOAT[4]**
     * 
     * A 4-component array that containing the values to fill the unordered-access-view resource with.
     * @param {Integer} NumRects Type: [in] **UINT**
     * 
     * The number of rectangles in the array that the *pRects* parameter specifies.
     * @param {Pointer<RECT>} pRects Type: [in] **const [D3D12_RECT](/windows/win32/direct3d12/d3d12-rect)\***
     * 
     * An array of **D3D12_RECT** structures for the rectangles in the resource view to clear. If **NULL**, **ClearUnorderedAccessViewFloat** clears the entire resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewfloat
     */
    ClearUnorderedAccessViewFloat(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ValuesMarshal := Values is VarRef ? "float*" : "ptr"

        ComCall(50, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, ValuesMarshal, Values, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Discards a resource.
     * @remarks
     * 
     * The semantics of <b>DiscardResource</b> change based on the command list type.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE_DIRECT</a>, the following two rules apply:
     * 
     * <ul>
     * <li>When a resource has the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET</a> flag, <b>DiscardResource</b> must be called when the discarded subresource regions are in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RENDER_TARGET</a> resource barrier state.</li>
     * <li>When a resource has the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG _ALLOW_DEPTH_STENCIL</a> flag, <b>DiscardResource</b> must be called when the discarded subresource regions are in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_DEPTH_WRITE</a>.
     * </li>
     * </ul>
     * For <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE_COMPUTE</a>, the following rule applies:
     * 
     * <ul>
     * <li>The resource must have the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS</a> flag, and <b>DiscardResource</b> must be called when the discarded subresource regions are in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_UNORDERED_ACCESS</a> resource barrier state.</li>
     * </ul>
     * <b>DiscardResource</b> is not supported on command lists with either <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE_BUNDLE</a> nor <b>D3D12_COMMAND_LIST_TYPE_COPY</b>.
     * 
     * 
     * @param {ID3D12Resource} pResource Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> interface for the resource to discard.
     * @param {Pointer<D3D12_DISCARD_REGION>} pRegion Type: [in, optional] <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_discard_region">D3D12_DISCARD_REGION</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_discard_region">D3D12_DISCARD_REGION</a> structure that describes details for the discard-resource operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource
     */
    DiscardResource(pResource, pRegion) {
        ComCall(51, this, "ptr", pResource, "ptr", pRegion)
    }

    /**
     * Starts a query running.
     * @remarks
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/queries">Queries</a> for more information about D3D12 queries.
     *           
     * 
     * 
     * 
     * @param {ID3D12QueryHeap} pQueryHeap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a>*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a> containing the query.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a></b>
     * 
     * Specifies one member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a>.
     * @param {Integer} Index Type: <b>UINT</b>
     * 
     * Specifies the index of the query within the query heap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-beginquery
     */
    BeginQuery(pQueryHeap, Type, Index) {
        ComCall(52, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * Ends a running query.
     * @remarks
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/queries">Queries</a> for more information about D3D12 queries.
     *         
     * 
     * 
     * 
     * @param {ID3D12QueryHeap} pQueryHeap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a>*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a> containing the query.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a></b>
     * 
     * Specifies one member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a>.
     * @param {Integer} Index Type: <b>UINT</b>
     * 
     * Specifies the index of the query in the query heap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-endquery
     */
    EndQuery(pQueryHeap, Type, Index) {
        ComCall(53, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * Extracts data from a query. ResolveQueryData works with all heap types (default, upload, and readback).  ResolveQueryData works with all heap types (default, upload, and readback). .
     * @remarks
     * 
     * <b>ResolveQueryData</b> performs a batched operation that writes query data into a destination buffer.  Query data is written contiguously to the destination buffer, and the parameter.
     *         
     * <b>ResolveQueryData</b> turns application-opaque query data in an application-opaque query heap into adapter-agnostic values usable by your application. Resolving queries within a heap that have not been completed (so have had [**ID3D12GraphicsCommandList::BeginQuery**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-beginquery) called for them, but not [**ID3D12GraphicsCommandList::EndQuery**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-endquery)), or that have been uninitialized, results in undefined behaviour and might cause device hangs or removal. The debug layer will emit an error if it detects an application has resolved incomplete or uninitialized queries.
     * 
     * > [!NOTE]
     * > Resolving incomplete or uninitialized queries is undefined behaviour because the driver might internally store GPUVAs or other data within unresolved queries. And so attempting to resolve these queries on uninitialized data could cause a page fault or device hang. Older versions of the debug layer didn't validate this behavior.
     * 
     * Binary occlusion queries write 64-bits per query. The least significant bit is either 0 (the object was entirely occluded) or 1 (at least 1 sample of the object would have been drawn). The rest of the bits are 0. Occlusion queries write 64-bits per query. The value is the number of samples that passed testing. Timestamp queries write 64-bits per query, which is a tick value that must be compared to the respective command queue frequency (see [Timing](/windows/win32/direct3d12/timing)).
     * 
     * Pipeline statistics queries write a [**D3D12_QUERY_DATA_PIPELINE_STATISTICS**](/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_pipeline_statistics) structure per query. All stream-out statistics queries write a [**D3D12_QUERY_DATA_SO_STATISTICS**](/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_so_statistics) structure per query.
     * 
     * The core runtime will validate the following.
     * 
     * <ul>
     * <li><i>StartIndex</i> and <i>NumQueries</i> are within range.
     *           </li>
     * <li><i>AlignedDestinationBufferOffset</i> is a multiple of 8 bytes.
     *           </li>
     * <li><i>DestinationBuffer</i> is a buffer.
     *           </li>
     * <li>The written data will not overflow the output buffer.
     *           </li>
     * <li>The query type must be supported by the command list type.
     *           </li>
     * <li>The query type must be supported by the query heap.
     *           </li>
     * </ul>
     * 
     * The debug layer will issue a warning if the destination buffer is not in the D3D12_RESOURCE_STATE_COPY_DEST state,
     * or if any queries being resolved have not had [**ID3D12GraphicsCommandList::EndQuery**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-endquery) called on them.
     * 
     * 
     * 
     * @param {ID3D12QueryHeap} pQueryHeap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a>*</b>
     * 
     * Specifies the  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12queryheap">ID3D12QueryHeap</a> containing the queries to resolve.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a></b>
     * 
     * Specifies the type of query, one member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_query_type">D3D12_QUERY_TYPE</a>.
     * @param {Integer} StartIndex Type: <b>UINT</b>
     * 
     * Specifies an index of the first query to resolve.
     * @param {Integer} NumQueries Type: <b>UINT</b>
     * 
     * Specifies the number of queries to resolve.
     * @param {ID3D12Resource} pDestinationBuffer Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> destination buffer, which must be in the state
     *             <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_COPY_DEST</a>.
     * @param {Integer} AlignedDestinationBufferOffset Type: <b>UINT64</b>
     * 
     * Specifies an alignment offset into the destination buffer.
     *             Must be a multiple of 8 bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-resolvequerydata
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pDestinationBuffer, AlignedDestinationBufferOffset) {
        ComCall(54, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, "ptr", pDestinationBuffer, "uint", AlignedDestinationBufferOffset)
    }

    /**
     * Sets a rendering predicate.
     * @remarks
     * 
     * Use this method to denote that subsequent rendering and resource manipulation commands are not actually performed if the resulting predicate data of the predicate is equal to the operation specified.
     *         
     * 
     * Unlike Direct3D 11, in Direct3D 12 predication state is not inherited by direct command lists, and predication is always respected (there are no predication hints).
     *         All direct command lists begin with predication disabled.
     *           Bundles do inherit predication state.
     *         It is legal for the same predicate to be bound multiple times.
     *       
     * 
     * Illegal API calls will result in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close">Close</a> returning an error,
     *             or <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists">ID3D12CommandQueue::ExecuteCommandLists</a> dropping the command list and removing the device.
     *           
     * 
     * The debug layer will issue errors whenever the runtime validation fails.
     *           
     * 
     * Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/predication">Predication</a> for more information.
     *         
     * 
     * 
     * 
     * @param {ID3D12Resource} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * The buffer, as an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>, which must be in the [**D3D12_RESOURCE_STATE_PREDICATION**](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states) or [**D3D21_RESOURCE_STATE_INDIRECT_ARGUMENT**](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states) state (both values are identical, and provided as aliases for clarity), or **NULL** to disable predication.
     * @param {Integer} AlignedBufferOffset Type: <b>UINT64</b>
     * 
     * The aligned buffer offset, as a UINT64.
     * @param {Integer} Operation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_predication_op">D3D12_PREDICATION_OP</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_predication_op">D3D12_PREDICATION_OP</a>, such as D3D12_PREDICATION_OP_EQUAL_ZERO or D3D12_PREDICATION_OP_NOT_EQUAL_ZERO.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setpredication
     */
    SetPredication(pBuffer, AlignedBufferOffset, Operation) {
        ComCall(55, this, "ptr", pBuffer, "uint", AlignedBufferOffset, "int", Operation)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command list.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To insert instrumentation markers at the current location within a D3D12 command list, use the <b>PIXSetMarker</b> function.  This is provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @param {Integer} Metadata Type: <b>UINT</b>
     * 
     * Internal.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Internal.
     * @param {Integer} Size Type: <b>UINT</b>
     * 
     * Internal.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-setmarker
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(56, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command list.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To mark the start of an instrumentation region at the current location within a D3D12 command list, use the <b>PIXBeginEvent</b> function or <b>PIXScopedEvent</b> macro.  These are provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @param {Integer} Metadata Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Internal.
     * @param {Pointer} pData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">void</a>*</b>
     * 
     * Internal.
     * @param {Integer} Size Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Internal.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-beginevent
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(57, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command list.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To mark the end of an instrumentation region at the current location within a D3D12 command list, use the <b>PIXEndEvent</b> function or <b>PIXScopedEvent</b> macro.  These are provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-endevent
     */
    EndEvent() {
        ComCall(58, this)
    }

    /**
     * Apps perform indirect draws/dispatches using the ExecuteIndirect method.
     * @remarks
     * 
     * The semantics of this API are defined with the following pseudo-code:
     * 
     * Non-NULL pCountBuffer:
     * 
     * <pre class="syntax" xml:space="preserve"><code>// Read draw count out of count buffer
     * UINT CommandCount = pCountBuffer-&gt;ReadUINT32(CountBufferOffset);
     * 
     * CommandCount = min(CommandCount, MaxCommandCount)
     * 
     * // Get pointer to first Commanding argument
     * BYTE* Arguments = pArgumentBuffer-&gt;GetBase() + ArgumentBufferOffset;
     * 
     * for(UINT CommandIndex = 0; CommandIndex &lt; CommandCount; CommandIndex++)
     * {
     *   // Interpret the data contained in *Arguments
     *   // according to the command signature
     *   pCommandSignature-&gt;Interpret(Arguments);
     * 
     *   Arguments += pCommandSignature -&gt;GetByteStride();
     * }
     * </code></pre>
     * NULL pCountBuffer:
     * 
     * <pre class="syntax" xml:space="preserve"><code>// Get pointer to first Commanding argument
     * BYTE* Arguments = pArgumentBuffer-&gt;GetBase() + ArgumentBufferOffset;
     * 
     * for(UINT CommandIndex = 0; CommandIndex &lt; MaxCommandCount; CommandIndex++)
     * {
     *   // Interpret the data contained in *Arguments
     *   // according to the command signature
     *   pCommandSignature-&gt;Interpret(Arguments);
     * 
     *   Arguments += pCommandSignature -&gt;GetByteStride();
     * }
     * </code></pre>
     * The debug layer will issue an error if either the count buffer or the argument buffer are not in the D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT state. The core runtime will validate:
     * 
     * <ul>
     * <li><i>CountBufferOffset</i> and <i>ArgumentBufferOffset</i> are 4-byte aligned
     *             </li>
     * <li><i>pCountBuffer</i> and <i>pArgumentBuffer</i> are buffer resources (any heap type)
     *             </li>
     * <li>The offset implied by <i>MaxCommandCount</i>, <i>ArgumentBufferOffset</i>, and the drawing program stride do not exceed the bounds of <i>pArgumentBuffer</i> (similarly for count buffer)
     *             </li>
     * <li>The command list is a direct command list or a compute command list (not a copy or JPEG decode command list)</li>
     * <li>The root signature of the command list matches the root signature of the command signature</li>
     * </ul>
     * The functionality of two APIs from earlier versions of Direct3D, <c>DrawInstancedIndirect</code> and <code>DrawIndexedInstancedIndirect</c>, are encompassed by  <b>ExecuteIndirect</b>.
     *           
     * 
     * <h3><a id="Bundles"></a><a id="bundles"></a><a id="BUNDLES"></a>Bundles</h3>
     * <b>ID3D12GraphicsCommandList::ExecuteIndirect</b> is allowed inside of bundle command lists only if all of the following are true:
     *               
     * 
     * <ul>
     * <li>CountBuffer is NULL (CPU-specified count only).</li>
     * <li>The command signature contains exactly one operation.  This implies that the command signature does not contain root arguments changes, nor contain VB/IB binding changes.</li>
     * </ul>
     * <h3><a id="Obtaining_buffer_virtual_addresses"></a><a id="obtaining_buffer_virtual_addresses"></a><a id="OBTAINING_BUFFER_VIRTUAL_ADDRESSES"></a>Obtaining buffer virtual addresses</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-getgpuvirtualaddress">ID3D12Resource::GetGPUVirtualAddress</a> method enables an app to retrieve the GPU virtual address of a buffer.
     *               
     * 
     * Apps are free to apply byte offsets to virtual addresses before placing them in an indirect argument buffer.  Note that all of the D3D12 alignment requirements for VB/IB/CB still apply to the resulting GPU virtual address. 
     * 
     * 
     * 
     * @param {ID3D12CommandSignature} pCommandSignature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandsignature">ID3D12CommandSignature</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandsignature">ID3D12CommandSignature</a>. The data referenced by <i>pArgumentBuffer</i> will be interpreted depending on the contents of the command signature. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/indirect-drawing">Indirect Drawing</a> for the APIs that are used to create a command signature.
     * @param {Integer} MaxCommandCount Type: <b>UINT</b>
     * 
     * There are two ways that command counts can be specified:
     * 
     * <ul>
     * <li>If <i>pCountBuffer</i> is not NULL, then <i>MaxCommandCount</i> specifies the maximum number of operations which will be performed.  The actual number of operations to be performed are defined by the minimum of this value, and a 32-bit unsigned integer contained in <i>pCountBuffer</i> (at the byte offset specified by <i>CountBufferOffset</i>).
     *               </li>
     * <li>If <i>pCountBuffer</i> is NULL, the <i>MaxCommandCount</i> specifies the exact number of operations which will be performed.
     *               </li>
     * </ul>
     * @param {ID3D12Resource} pArgumentBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies one or more <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> objects, containing the command arguments.
     * @param {Integer} ArgumentBufferOffset Type: <b>UINT64</b>
     * 
     * Specifies an offset into <i>pArgumentBuffer</i> to identify the first command argument.
     * @param {ID3D12Resource} pCountBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * Specifies a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>.
     * @param {Integer} CountBufferOffset Type: <b>UINT64</b>
     * 
     * Specifies a UINT64 that is the offset into <i>pCountBuffer</i>, identifying the argument count.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist-executeindirect
     */
    ExecuteIndirect(pCommandSignature, MaxCommandCount, pArgumentBuffer, ArgumentBufferOffset, pCountBuffer, CountBufferOffset) {
        ComCall(59, this, "ptr", pCommandSignature, "uint", MaxCommandCount, "ptr", pArgumentBuffer, "uint", ArgumentBufferOffset, "ptr", pCountBuffer, "uint", CountBufferOffset)
    }
}
