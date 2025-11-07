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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12CommandAllocator} pAllocator 
     * @param {ID3D12PipelineState} pInitialState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-reset
     */
    Reset(pAllocator, pInitialState) {
        result := ComCall(10, this, "ptr", pAllocator, "ptr", pInitialState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12PipelineState} pPipelineState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate
     */
    ClearState(pPipelineState) {
        ComCall(11, this, "ptr", pPipelineState)
    }

    /**
     * 
     * @param {Integer} VertexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(12, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} IndexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(13, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} ThreadGroupCountX 
     * @param {Integer} ThreadGroupCountY 
     * @param {Integer} ThreadGroupCountZ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-dispatch
     */
    Dispatch(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(14, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }

    /**
     * 
     * @param {ID3D12Resource} pDstBuffer 
     * @param {Integer} DstOffset 
     * @param {ID3D12Resource} pSrcBuffer 
     * @param {Integer} SrcOffset 
     * @param {Integer} NumBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion
     */
    CopyBufferRegion(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, NumBytes) {
        ComCall(15, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", NumBytes)
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion
     */
    CopyTextureRegion(pDst, DstX, DstY, DstZ, pSrc, pSrcBox) {
        ComCall(16, this, "ptr", pDst, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrc, "ptr", pSrcBox)
    }

    /**
     * 
     * @param {ID3D12Resource} pDstResource 
     * @param {ID3D12Resource} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(17, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * 
     * @param {ID3D12Resource} pTiledResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {ID3D12Resource} pBuffer 
     * @param {Integer} BufferStartOffsetInBytes 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(18, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "int", Flags)
    }

    /**
     * 
     * @param {ID3D12Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {ID3D12Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(19, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * 
     * @param {Integer} PrimitiveTopology 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetprimitivetopology
     */
    IASetPrimitiveTopology(PrimitiveTopology) {
        ComCall(20, this, "int", PrimitiveTopology)
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D12_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(21, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(22, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {Pointer<Float>} BlendFactor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetblendfactor
     */
    OMSetBlendFactor(BlendFactor) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"

        ComCall(23, this, BlendFactorMarshal, BlendFactor)
    }

    /**
     * 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetstencilref
     */
    OMSetStencilRef(StencilRef) {
        ComCall(24, this, "uint", StencilRef)
    }

    /**
     * 
     * @param {ID3D12PipelineState} pPipelineState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setpipelinestate
     */
    SetPipelineState(pPipelineState) {
        ComCall(25, this, "ptr", pPipelineState)
    }

    /**
     * 
     * @param {Integer} NumBarriers 
     * @param {Pointer<D3D12_RESOURCE_BARRIER>} pBarriers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resourcebarrier
     */
    ResourceBarrier(NumBarriers, pBarriers) {
        ComCall(26, this, "uint", NumBarriers, "ptr", pBarriers)
    }

    /**
     * 
     * @param {ID3D12GraphicsCommandList} pCommandList 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-executebundle
     */
    ExecuteBundle(pCommandList) {
        ComCall(27, this, "ptr", pCommandList)
    }

    /**
     * 
     * @param {Integer} NumDescriptorHeaps 
     * @param {Pointer<ID3D12DescriptorHeap>} ppDescriptorHeaps 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps
     */
    SetDescriptorHeaps(NumDescriptorHeaps, ppDescriptorHeaps) {
        ComCall(28, this, "uint", NumDescriptorHeaps, "ptr*", ppDescriptorHeaps)
    }

    /**
     * 
     * @param {ID3D12RootSignature} pRootSignature 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootsignature
     */
    SetComputeRootSignature(pRootSignature) {
        ComCall(29, this, "ptr", pRootSignature)
    }

    /**
     * 
     * @param {ID3D12RootSignature} pRootSignature 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootsignature
     */
    SetGraphicsRootSignature(pRootSignature) {
        ComCall(30, this, "ptr", pRootSignature)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootdescriptortable
     */
    SetComputeRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(31, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} BaseDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootdescriptortable
     */
    SetGraphicsRootDescriptorTable(RootParameterIndex, BaseDescriptor) {
        ComCall(32, this, "uint", RootParameterIndex, "ptr", BaseDescriptor)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} SrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputeroot32bitconstant
     */
    SetComputeRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(33, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} SrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsroot32bitconstant
     */
    SetGraphicsRoot32BitConstant(RootParameterIndex, SrcData, DestOffsetIn32BitValues) {
        ComCall(34, this, "uint", RootParameterIndex, "uint", SrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} Num32BitValuesToSet 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputeroot32bitconstants
     */
    SetComputeRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(35, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, pSrcDataMarshal, pSrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} Num32BitValuesToSet 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} DestOffsetIn32BitValues 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsroot32bitconstants
     */
    SetGraphicsRoot32BitConstants(RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(36, this, "uint", RootParameterIndex, "uint", Num32BitValuesToSet, pSrcDataMarshal, pSrcData, "uint", DestOffsetIn32BitValues)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootconstantbufferview
     */
    SetComputeRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(37, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootconstantbufferview
     */
    SetGraphicsRootConstantBufferView(RootParameterIndex, BufferLocation) {
        ComCall(38, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootshaderresourceview
     */
    SetComputeRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(39, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootshaderresourceview
     */
    SetGraphicsRootShaderResourceView(RootParameterIndex, BufferLocation) {
        ComCall(40, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootunorderedaccessview
     */
    SetComputeRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(41, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Integer} RootParameterIndex 
     * @param {Integer} BufferLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootunorderedaccessview
     */
    SetGraphicsRootUnorderedAccessView(RootParameterIndex, BufferLocation) {
        ComCall(42, this, "uint", RootParameterIndex, "uint", BufferLocation)
    }

    /**
     * 
     * @param {Pointer<D3D12_INDEX_BUFFER_VIEW>} pView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetindexbuffer
     */
    IASetIndexBuffer(pView) {
        ComCall(43, this, "ptr", pView)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<D3D12_VERTEX_BUFFER_VIEW>} pViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumViews, pViews) {
        ComCall(44, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<D3D12_STREAM_OUTPUT_BUFFER_VIEW>} pViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-sosettargets
     */
    SOSetTargets(StartSlot, NumViews, pViews) {
        ComCall(45, this, "uint", StartSlot, "uint", NumViews, "ptr", pViews)
    }

    /**
     * 
     * @param {Integer} NumRenderTargetDescriptors 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pRenderTargetDescriptors 
     * @param {BOOL} RTsSingleHandleToDescriptorRange 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDepthStencilDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetrendertargets
     */
    OMSetRenderTargets(NumRenderTargetDescriptors, pRenderTargetDescriptors, RTsSingleHandleToDescriptorRange, pDepthStencilDescriptor) {
        ComCall(46, this, "uint", NumRenderTargetDescriptors, "ptr", pRenderTargetDescriptors, "int", RTsSingleHandleToDescriptorRange, "ptr", pDepthStencilDescriptor)
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview
     */
    ClearDepthStencilView(DepthStencilView, ClearFlags, Depth, Stencil, NumRects, pRects) {
        ComCall(47, this, "ptr", DepthStencilView, "int", ClearFlags, "float", Depth, "char", Stencil, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} RenderTargetView 
     * @param {Pointer<Float>} ColorRGBA 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearrendertargetview
     */
    ClearRenderTargetView(RenderTargetView, ColorRGBA, NumRects, pRects) {
        ColorRGBAMarshal := ColorRGBA is VarRef ? "float*" : "ptr"

        ComCall(48, this, "ptr", RenderTargetView, ColorRGBAMarshal, ColorRGBA, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<Integer>} Values 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewuint
     */
    ClearUnorderedAccessViewUint(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ValuesMarshal := Values is VarRef ? "uint*" : "ptr"

        ComCall(49, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, ValuesMarshal, Values, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {D3D12_GPU_DESCRIPTOR_HANDLE} ViewGPUHandleInCurrentHeap 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} ViewCPUHandle 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<Float>} Values 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewfloat
     */
    ClearUnorderedAccessViewFloat(ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects) {
        ValuesMarshal := Values is VarRef ? "float*" : "ptr"

        ComCall(50, this, "ptr", ViewGPUHandleInCurrentHeap, "ptr", ViewCPUHandle, "ptr", pResource, ValuesMarshal, Values, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_DISCARD_REGION>} pRegion 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource
     */
    DiscardResource(pResource, pRegion) {
        ComCall(51, this, "ptr", pResource, "ptr", pRegion)
    }

    /**
     * 
     * @param {ID3D12QueryHeap} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-beginquery
     */
    BeginQuery(pQueryHeap, Type, Index) {
        ComCall(52, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * 
     * @param {ID3D12QueryHeap} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-endquery
     */
    EndQuery(pQueryHeap, Type, Index) {
        ComCall(53, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * 
     * @param {ID3D12QueryHeap} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} StartIndex 
     * @param {Integer} NumQueries 
     * @param {ID3D12Resource} pDestinationBuffer 
     * @param {Integer} AlignedDestinationBufferOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resolvequerydata
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pDestinationBuffer, AlignedDestinationBufferOffset) {
        ComCall(54, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, "ptr", pDestinationBuffer, "uint", AlignedDestinationBufferOffset)
    }

    /**
     * 
     * @param {ID3D12Resource} pBuffer 
     * @param {Integer} AlignedBufferOffset 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setpredication
     */
    SetPredication(pBuffer, AlignedBufferOffset, Operation) {
        ComCall(55, this, "ptr", pBuffer, "uint", AlignedBufferOffset, "int", Operation)
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setmarker
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(56, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-beginevent
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(57, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-endevent
     */
    EndEvent() {
        ComCall(58, this)
    }

    /**
     * 
     * @param {ID3D12CommandSignature} pCommandSignature 
     * @param {Integer} MaxCommandCount 
     * @param {ID3D12Resource} pArgumentBuffer 
     * @param {Integer} ArgumentBufferOffset 
     * @param {ID3D12Resource} pCountBuffer 
     * @param {Integer} CountBufferOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-executeindirect
     */
    ExecuteIndirect(pCommandSignature, MaxCommandCount, pArgumentBuffer, ArgumentBufferOffset, pCountBuffer, CountBufferOffset) {
        ComCall(59, this, "ptr", pCommandSignature, "uint", MaxCommandCount, "ptr", pArgumentBuffer, "uint", ArgumentBufferOffset, "ptr", pCountBuffer, "uint", CountBufferOffset)
    }
}
