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
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CommandAllocator>} pAllocator 
     * @param {Pointer<ID3D12PipelineState>} pInitialState 
     * @returns {HRESULT} 
     */
    Reset(pAllocator, pInitialState) {
        result := ComCall(10, this, "ptr", pAllocator, "ptr", pInitialState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12PipelineState>} pPipelineState 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearState(pPipelineState) {
        ComCall(11, this, "ptr", pPipelineState)
        return result
    }

    /**
     * 
     * @param {Integer} VertexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(12, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
        return result
    }

    /**
     * 
     * @param {Integer} IndexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(13, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
        return result
    }

    /**
     * 
     * @param {Integer} ThreadGroupCountX 
     * @param {Integer} ThreadGroupCountY 
     * @param {Integer} ThreadGroupCountZ 
     * @returns {String} Nothing - always returns an empty string
     */
    Dispatch(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(14, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstBuffer 
     * @param {Integer} DstOffset 
     * @param {Pointer<ID3D12Resource>} pSrcBuffer 
     * @param {Integer} SrcOffset 
     * @param {Integer} NumBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyBufferRegion(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, NumBytes) {
        ComCall(15, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", NumBytes)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_TEXTURE_COPY_LOCATION>} pDst 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {Pointer<D3D12_TEXTURE_COPY_LOCATION>} pSrc 
     * @param {Pointer<D3D12_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyTextureRegion(pDst, DstX, DstY, DstZ, pSrc, pSrcBox) {
        ComCall(16, this, "ptr", pDst, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrc, "ptr", pSrcBox)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstResource 
     * @param {Pointer<ID3D12Resource>} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(17, this, "ptr", pDstResource, "ptr", pSrcResource)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pTiledResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {Pointer<ID3D12Resource>} pBuffer 
     * @param {Integer} BufferStartOffsetInBytes 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(18, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "int", Flags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<ID3D12Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(19, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
        return result
    }

    /**
     * 
     * @param {Integer} PrimitiveTopology 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetPrimitiveTopology(PrimitiveTopology) {
        ComCall(20, this, "int", PrimitiveTopology)
        return result
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D12_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(21, this, "uint", NumViewports, "ptr", pViewports)
        return result
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(22, this, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {Pointer<Single>} BlendFactor 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetBlendFactor(BlendFactor) {
        ComCall(23, this, "float*", BlendFactor)
        return result
    }

    /**
     * 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetStencilRef(StencilRef) {
        ComCall(24, this, "uint", StencilRef)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12PipelineState>} pPipelineState 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPipelineState(pPipelineState) {
        ComCall(25, this, "ptr", pPipelineState)
        return result
    }

    /**
     * 
     * @param {Integer} NumBarriers 
     * @param {Pointer<D3D12_RESOURCE_BARRIER>} pBarriers 
     * @returns {String} Nothing - always returns an empty string
     */
    ResourceBarrier(NumBarriers, pBarriers) {
        ComCall(26, this, "uint", NumBarriers, "ptr", pBarriers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12GraphicsCommandList>} pCommandList 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteBundle(pCommandList) {
        ComCall(27, this, "ptr", pCommandList)
        return result
    }

    /**
     * 
     * @param {Integer} NumDescriptorHeaps 
     * @param {Pointer<ID3D12DescriptorHeap>} ppDescriptorHeaps 
     * @returns {String} Nothing - always returns an empty string
     */
    SetDescriptorHeaps(NumDescriptorHeaps, ppDescriptorHeaps) {
        ComCall(28, this, "uint", NumDescriptorHeaps, "ptr", ppDescriptorHeaps)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12RootSignature>} pRootSignature 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRootSignature(pRootSignature) {
        ComCall(29, this, "ptr", pRootSignature)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12RootSignature>} pRootSignature 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRootSignature(pRootSignature) {
        ComCall(30, this, "ptr", pRootSignature)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(31, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(32, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} SrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(33, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} SrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(34, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} Num32BitValuesToSet 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        ComCall(35, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, "ptr", pSrcData, "uint", DestOffsetIn32BitValues)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} Num32BitValuesToSet 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        ComCall(36, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, "ptr", pSrcData, "uint", DestOffsetIn32BitValues)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(37, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(38, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(39, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(40, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetComputeRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(41, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGraphicsRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(42, this, "uint", RootParameterIndex, "uint", BufferLocation)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_INDEX_BUFFER_VIEW>} pView 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetIndexBuffer(pView) {
        ComCall(43, this, "ptr", pView)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<D3D12_VERTEX_BUFFER_VIEW>} pViews 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetVertexBuffers(StartSlot, NumViews, pViews) {
        ComCall(44, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<D3D12_STREAM_OUTPUT_BUFFER_VIEW>} pViews 
     * @returns {String} Nothing - always returns an empty string
     */
    SOSetTargets(StartSlot, NumViews, pViews) {
        ComCall(45, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
        return result
    }

    /**
     * 
     * @param {Integer} NumRenderTargetDescriptors 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pRenderTargetDescriptors 
     * @param {BOOL} RTsSingleHandleToDescriptorRange 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDepthStencilDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetRenderTargets(NumRenderTargetDescriptors, pRenderTargetDescriptors, RTsSingleHandleToDescriptorRange, pDepthStencilDescriptor) {
        ComCall(46, this, "uint", NumRenderTargetDescriptors, "ptr", pRenderTargetDescriptors, "int", RTsSingleHandleToDescriptorRange, "ptr", pDepthStencilDescriptor)
        return result
    }

    /**
     * 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DepthStencilView 
     * @param {Integer} ClearFlags 
     * @param {Float} Depth 
     * @param {Integer} Stencil 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearDepthStencilView(DepthStencilView, ClearFlags, Depth, Stencil, NumRects, pRects) {
        ComCall(47, this, "ptr", DepthStencilView, "int", ClearFlags, "float", Depth, "char", Stencil, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} RenderTargetView 
     * @param {Pointer<Single>} ColorRGBA 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearRenderTargetView(RenderTargetView, ColorRGBA, NumRects, pRects) {
        ComCall(48, this, "ptr", RenderTargetView, "float*", ColorRGBA, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<UInt32>} Values 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearUnorderedAccessViewUint(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ComCall(49, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, "uint*", Values, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<Single>} Values 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearUnorderedAccessViewFloat(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ComCall(50, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, "float*", Values, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_DISCARD_REGION>} pRegion 
     * @returns {String} Nothing - always returns an empty string
     */
    DiscardResource(pResource, pRegion) {
        ComCall(51, this, "ptr", pResource, "ptr", pRegion)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginQuery(pQueryHeap, Type, Index) {
        ComCall(52, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    EndQuery(pQueryHeap, Type, Index) {
        ComCall(53, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} StartIndex 
     * @param {Integer} NumQueries 
     * @param {Pointer<ID3D12Resource>} pDestinationBuffer 
     * @param {Integer} AlignedDestinationBufferOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pDestinationBuffer, AlignedDestinationBufferOffset) {
        ComCall(54, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, "ptr", pDestinationBuffer, "uint", AlignedDestinationBufferOffset)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pBuffer 
     * @param {Integer} AlignedBufferOffset 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPredication(pBuffer, AlignedBufferOffset, Operation) {
        ComCall(55, this, "ptr", pBuffer, "uint", AlignedBufferOffset, "int", Operation)
        return result
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(56, this, "uint", Metadata, "ptr", pData, "uint", Size)
        return result
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(57, this, "uint", Metadata, "ptr", pData, "uint", Size)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndEvent() {
        ComCall(58, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CommandSignature>} pCommandSignature 
     * @param {Integer} MaxCommandCount 
     * @param {Pointer<ID3D12Resource>} pArgumentBuffer 
     * @param {Integer} ArgumentBufferOffset 
     * @param {Pointer<ID3D12Resource>} pCountBuffer 
     * @param {Integer} CountBufferOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteIndirect(pCommandSignature, MaxCommandCount, pArgumentBuffer, ArgumentBufferOffset, pCountBuffer, CountBufferOffset) {
        ComCall(59, this, "ptr", pCommandSignature, "uint", MaxCommandCount, "ptr", pArgumentBuffer, "uint", ArgumentBufferOffset, "ptr", pCountBuffer, "uint", CountBufferOffset)
        return result
    }
}
