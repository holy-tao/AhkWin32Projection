#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * The ID3D11DeviceContext interface represents a device context which generates rendering commands.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11devicecontext
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext extends ID3D11DeviceChild{
    /**
     * The interface identifier for ID3D11DeviceContext
     * @type {Guid}
     */
    static IID => Guid("{c0bfa96c-e089-44fb-8eaf-26f8796190da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(7, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(8, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11PixelShader>} pPixelShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetShader(pPixelShader, ppClassInstances, NumClassInstances) {
        ComCall(9, this, "ptr", pPixelShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VertexShader>} pVertexShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetShader(pVertexShader, ppClassInstances, NumClassInstances) {
        ComCall(11, this, "ptr", pVertexShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} IndexCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawIndexed(IndexCount, StartIndexLocation, BaseVertexLocation) {
        ComCall(12, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
        return result
    }

    /**
     * 
     * @param {Integer} VertexCount 
     * @param {Integer} StartVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(13, this, "uint", VertexCount, "uint", StartVertexLocation)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} MapType 
     * @param {Integer} MapFlags 
     * @param {Pointer<D3D11_MAPPED_SUBRESOURCE>} pMappedResource 
     * @returns {HRESULT} 
     */
    Map(pResource, Subresource, MapType, MapFlags, pMappedResource) {
        result := ComCall(14, this, "ptr", pResource, "uint", Subresource, "int", MapType, "uint", MapFlags, "ptr", pMappedResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Integer} Subresource 
     * @returns {String} Nothing - always returns an empty string
     */
    Unmap(pResource, Subresource) {
        ComCall(15, this, "ptr", pResource, "uint", Subresource)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11InputLayout>} pInputLayout 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetInputLayout(pInputLayout) {
        ComCall(17, this, "ptr", pInputLayout)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers 
     * @param {Pointer<UInt32>} pStrides 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(18, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pIndexBuffer 
     * @param {Integer} Format 
     * @param {Integer} Offset 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(19, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
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
        ComCall(20, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
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
        ComCall(21, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(22, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11GeometryShader>} pShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetShader(pShader, ppClassInstances, NumClassInstances) {
        ComCall(23, this, "ptr", pShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} Topology 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(24, this, "int", Topology)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(25, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(26, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Asynchronous>} pAsync 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin(pAsync) {
        ComCall(27, this, "ptr", pAsync)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Asynchronous>} pAsync 
     * @returns {String} Nothing - always returns an empty string
     */
    End(pAsync) {
        ComCall(28, this, "ptr", pAsync)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Asynchronous>} pAsync 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @param {Integer} GetDataFlags 
     * @returns {HRESULT} 
     */
    GetData(pAsync, pData, DataSize, GetDataFlags) {
        result := ComCall(29, this, "ptr", pAsync, "ptr", pData, "uint", DataSize, "uint", GetDataFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Predicate>} pPredicate 
     * @param {BOOL} PredicateValue 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(30, this, "ptr", pPredicate, "int", PredicateValue)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(31, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(32, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D11DepthStencilView>} pDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(33, this, "uint", NumViews, "ptr", ppRenderTargetViews, "ptr", pDepthStencilView)
        return result
    }

    /**
     * 
     * @param {Integer} NumRTVs 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D11DepthStencilView>} pDepthStencilView 
     * @param {Integer} UAVStartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @param {Pointer<UInt32>} pUAVInitialCounts 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, pDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        ComCall(34, this, "uint", NumRTVs, "ptr", ppRenderTargetViews, "ptr", pDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr", ppUnorderedAccessViews, "uint*", pUAVInitialCounts)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11BlendState>} pBlendState 
     * @param {Pointer<Single>} BlendFactor 
     * @param {Integer} SampleMask 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        ComCall(35, this, "ptr", pBlendState, "float*", BlendFactor, "uint", SampleMask)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DepthStencilState>} pDepthStencilState 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(36, this, "ptr", pDepthStencilState, "uint", StencilRef)
        return result
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppSOTargets 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        ComCall(37, this, "uint", NumBuffers, "ptr", ppSOTargets, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawAuto() {
        ComCall(38, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawIndexedInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(39, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(40, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
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
        ComCall(41, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(42, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11RasterizerState>} pRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetState(pRasterizerState) {
        ComCall(43, this, "ptr", pRasterizerState)
        return result
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D11_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(44, this, "uint", NumViewports, "ptr", pViewports)
        return result
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(45, this, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {Pointer<ID3D11Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D11_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(46, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Pointer<ID3D11Resource>} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(47, this, "ptr", pDstResource, "ptr", pSrcResource)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D11_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {String} Nothing - always returns an empty string
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        ComCall(48, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pDstBuffer 
     * @param {Integer} DstAlignedByteOffset 
     * @param {Pointer<ID3D11UnorderedAccessView>} pSrcView 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyStructureCount(pDstBuffer, DstAlignedByteOffset, pSrcView) {
        ComCall(49, this, "ptr", pDstBuffer, "uint", DstAlignedByteOffset, "ptr", pSrcView)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11RenderTargetView>} pRenderTargetView 
     * @param {Pointer<Single>} ColorRGBA 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ComCall(50, this, "ptr", pRenderTargetView, "float*", ColorRGBA)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11UnorderedAccessView>} pUnorderedAccessView 
     * @param {Pointer<UInt32>} Values 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearUnorderedAccessViewUint(pUnorderedAccessView, Values) {
        ComCall(51, this, "ptr", pUnorderedAccessView, "uint*", Values)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11UnorderedAccessView>} pUnorderedAccessView 
     * @param {Pointer<Single>} Values 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearUnorderedAccessViewFloat(pUnorderedAccessView, Values) {
        ComCall(52, this, "ptr", pUnorderedAccessView, "float*", Values)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DepthStencilView>} pDepthStencilView 
     * @param {Integer} ClearFlags 
     * @param {Float} Depth 
     * @param {Integer} Stencil 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(53, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ShaderResourceView>} pShaderResourceView 
     * @returns {String} Nothing - always returns an empty string
     */
    GenerateMips(pShaderResourceView) {
        ComCall(54, this, "ptr", pShaderResourceView)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Float} MinLOD 
     * @returns {String} Nothing - always returns an empty string
     */
    SetResourceMinLOD(pResource, MinLOD) {
        ComCall(55, this, "ptr", pResource, "float", MinLOD)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @returns {Float} 
     */
    GetResourceMinLOD(pResource) {
        result := ComCall(56, this, "ptr", pResource, "float")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<ID3D11Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(57, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CommandList>} pCommandList 
     * @param {BOOL} RestoreContextState 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteCommandList(pCommandList, RestoreContextState) {
        ComCall(58, this, "ptr", pCommandList, "int", RestoreContextState)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    HSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(59, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11HullShader>} pHullShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    HSSetShader(pHullShader, ppClassInstances, NumClassInstances) {
        ComCall(60, this, "ptr", pHullShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    HSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(61, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    HSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(62, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    DSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(63, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DomainShader>} pDomainShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    DSSetShader(pDomainShader, ppClassInstances, NumClassInstances) {
        ComCall(64, this, "ptr", pDomainShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    DSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(65, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    DSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(66, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(67, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @param {Pointer<UInt32>} pUAVInitialCounts 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        ComCall(68, this, "uint", StartSlot, "uint", NumUAVs, "ptr", ppUnorderedAccessViews, "uint*", pUAVInitialCounts)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ComputeShader>} pComputeShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetShader(pComputeShader, ppClassInstances, NumClassInstances) {
        ComCall(69, this, "ptr", pComputeShader, "ptr", ppClassInstances, "uint", NumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(70, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(71, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(72, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(73, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11PixelShader>} ppPixelShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetShader(ppPixelShader, ppClassInstances, pNumClassInstances) {
        ComCall(74, this, "ptr", ppPixelShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(75, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VertexShader>} ppVertexShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetShader(ppVertexShader, ppClassInstances, pNumClassInstances) {
        ComCall(76, this, "ptr", ppVertexShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(77, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11InputLayout>} ppInputLayout 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(78, this, "ptr", ppInputLayout)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers 
     * @param {Pointer<UInt32>} pStrides 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(79, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pIndexBuffer 
     * @param {Pointer<Int32>} Format 
     * @param {Pointer<UInt32>} Offset 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(80, this, "ptr", pIndexBuffer, "int*", Format, "uint*", Offset)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(81, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetShader(ppGeometryShader, ppClassInstances, pNumClassInstances) {
        ComCall(82, this, "ptr", ppGeometryShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTopology 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetPrimitiveTopology(pTopology) {
        ComCall(83, this, "int*", pTopology)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(84, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(85, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Predicate>} ppPredicate 
     * @param {Pointer<BOOL>} pPredicateValue 
     * @returns {String} Nothing - always returns an empty string
     */
    GetPredication(ppPredicate, pPredicateValue) {
        ComCall(86, this, "ptr", ppPredicate, "ptr", pPredicateValue)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(87, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(88, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(89, this, "uint", NumViews, "ptr", ppRenderTargetViews, "ptr", ppDepthStencilView)
        return result
    }

    /**
     * 
     * @param {Integer} NumRTVs 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView 
     * @param {Integer} UAVStartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, ppDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(90, this, "uint", NumRTVs, "ptr", ppRenderTargetViews, "ptr", ppDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr", ppUnorderedAccessViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11BlendState>} ppBlendState 
     * @param {Pointer<Single>} BlendFactor 
     * @param {Pointer<UInt32>} pSampleMask 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        ComCall(91, this, "ptr", ppBlendState, "float*", BlendFactor, "uint*", pSampleMask)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DepthStencilState>} ppDepthStencilState 
     * @param {Pointer<UInt32>} pStencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        ComCall(92, this, "ptr", ppDepthStencilState, "uint*", pStencilRef)
        return result
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppSOTargets 
     * @returns {String} Nothing - always returns an empty string
     */
    SOGetTargets(NumBuffers, ppSOTargets) {
        ComCall(93, this, "uint", NumBuffers, "ptr", ppSOTargets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11RasterizerState>} ppRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetState(ppRasterizerState) {
        ComCall(94, this, "ptr", ppRasterizerState)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumViewports 
     * @param {Pointer<D3D11_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetViewports(pNumViewports, pViewports) {
        ComCall(95, this, "uint*", pNumViewports, "ptr", pViewports)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetScissorRects(pNumRects, pRects) {
        ComCall(96, this, "uint*", pNumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    HSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(97, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11HullShader>} ppHullShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    HSGetShader(ppHullShader, ppClassInstances, pNumClassInstances) {
        ComCall(98, this, "ptr", ppHullShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    HSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(99, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    HSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(100, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    DSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(101, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DomainShader>} ppDomainShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    DSGetShader(ppDomainShader, ppClassInstances, pNumClassInstances) {
        ComCall(102, this, "ptr", ppDomainShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    DSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(103, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    DSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(104, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(105, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(106, this, "uint", StartSlot, "uint", NumUAVs, "ptr", ppUnorderedAccessViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ComputeShader>} ppComputeShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<UInt32>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetShader(ppComputeShader, ppClassInstances, pNumClassInstances) {
        ComCall(107, this, "ptr", ppComputeShader, "ptr", ppClassInstances, "uint*", pNumClassInstances)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(108, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(109, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearState() {
        ComCall(110, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Flush() {
        ComCall(111, this)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(112, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetContextFlags() {
        result := ComCall(113, this, "uint")
        return result
    }

    /**
     * 
     * @param {BOOL} RestoreDeferredContextState 
     * @param {Pointer<ID3D11CommandList>} ppCommandList 
     * @returns {HRESULT} 
     */
    FinishCommandList(RestoreDeferredContextState, ppCommandList) {
        result := ComCall(114, this, "int", RestoreDeferredContextState, "ptr", ppCommandList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
