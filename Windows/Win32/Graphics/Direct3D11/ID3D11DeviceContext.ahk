#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_MAPPED_SUBRESOURCE.ahk
#Include .\ID3D11CommandList.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * The ID3D11DeviceContext interface represents a device context which generates rendering commands.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11devicecontext
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VSSetConstantBuffers", "PSSetShaderResources", "PSSetShader", "PSSetSamplers", "VSSetShader", "DrawIndexed", "Draw", "Map", "Unmap", "PSSetConstantBuffers", "IASetInputLayout", "IASetVertexBuffers", "IASetIndexBuffer", "DrawIndexedInstanced", "DrawInstanced", "GSSetConstantBuffers", "GSSetShader", "IASetPrimitiveTopology", "VSSetShaderResources", "VSSetSamplers", "Begin", "End", "GetData", "SetPredication", "GSSetShaderResources", "GSSetSamplers", "OMSetRenderTargets", "OMSetRenderTargetsAndUnorderedAccessViews", "OMSetBlendState", "OMSetDepthStencilState", "SOSetTargets", "DrawAuto", "DrawIndexedInstancedIndirect", "DrawInstancedIndirect", "Dispatch", "DispatchIndirect", "RSSetState", "RSSetViewports", "RSSetScissorRects", "CopySubresourceRegion", "CopyResource", "UpdateSubresource", "CopyStructureCount", "ClearRenderTargetView", "ClearUnorderedAccessViewUint", "ClearUnorderedAccessViewFloat", "ClearDepthStencilView", "GenerateMips", "SetResourceMinLOD", "GetResourceMinLOD", "ResolveSubresource", "ExecuteCommandList", "HSSetShaderResources", "HSSetShader", "HSSetSamplers", "HSSetConstantBuffers", "DSSetShaderResources", "DSSetShader", "DSSetSamplers", "DSSetConstantBuffers", "CSSetShaderResources", "CSSetUnorderedAccessViews", "CSSetShader", "CSSetSamplers", "CSSetConstantBuffers", "VSGetConstantBuffers", "PSGetShaderResources", "PSGetShader", "PSGetSamplers", "VSGetShader", "PSGetConstantBuffers", "IAGetInputLayout", "IAGetVertexBuffers", "IAGetIndexBuffer", "GSGetConstantBuffers", "GSGetShader", "IAGetPrimitiveTopology", "VSGetShaderResources", "VSGetSamplers", "GetPredication", "GSGetShaderResources", "GSGetSamplers", "OMGetRenderTargets", "OMGetRenderTargetsAndUnorderedAccessViews", "OMGetBlendState", "OMGetDepthStencilState", "SOGetTargets", "RSGetState", "RSGetViewports", "RSGetScissorRects", "HSGetShaderResources", "HSGetShader", "HSGetSamplers", "HSGetConstantBuffers", "DSGetShaderResources", "DSGetShader", "DSGetSamplers", "DSGetConstantBuffers", "CSGetShaderResources", "CSGetUnorderedAccessViews", "CSGetShader", "CSGetSamplers", "CSGetConstantBuffers", "ClearState", "Flush", "GetType", "GetContextFlags", "FinishCommandList"]

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(7, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(8, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {ID3D11PixelShader} pPixelShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshader
     */
    PSSetShader(pPixelShader, ppClassInstances, NumClassInstances) {
        ComCall(9, this, "ptr", pPixelShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-pssetsamplers
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {ID3D11VertexShader} pVertexShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshader
     */
    VSSetShader(pVertexShader, ppClassInstances, NumClassInstances) {
        ComCall(11, this, "ptr", pVertexShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} IndexCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexed
     */
    DrawIndexed(IndexCount, StartIndexLocation, BaseVertexLocation) {
        ComCall(12, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
    }

    /**
     * 
     * @param {Integer} VertexCount 
     * @param {Integer} StartVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-draw
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(13, this, "uint", VertexCount, "uint", StartVertexLocation)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} MapType 
     * @param {Integer} MapFlags 
     * @returns {D3D11_MAPPED_SUBRESOURCE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-map
     */
    Map(pResource, Subresource, MapType, MapFlags) {
        pMappedResource := D3D11_MAPPED_SUBRESOURCE()
        result := ComCall(14, this, "ptr", pResource, "uint", Subresource, "int", MapType, "uint", MapFlags, "ptr", pMappedResource, "HRESULT")
        return pMappedResource
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Integer} Subresource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-unmap
     */
    Unmap(pResource, Subresource) {
        ComCall(15, this, "ptr", pResource, "uint", Subresource)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {ID3D11InputLayout} pInputLayout 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iasetinputlayout
     */
    IASetInputLayout(pInputLayout) {
        ComCall(17, this, "ptr", pInputLayout)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers 
     * @param {Pointer<Integer>} pStrides 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(18, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * 
     * @param {ID3D11Buffer} pIndexBuffer 
     * @param {Integer} Format 
     * @param {Integer} Offset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iasetindexbuffer
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(19, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
    }

    /**
     * 
     * @param {Integer} IndexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(20, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} VertexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(21, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gssetconstantbuffers
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(22, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {ID3D11GeometryShader} pShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshader
     */
    GSSetShader(pShader, ppClassInstances, NumClassInstances) {
        ComCall(23, this, "ptr", pShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} Topology 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iasetprimitivetopology
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(24, this, "int", Topology)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(25, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vssetsamplers
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(26, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {ID3D11Asynchronous} pAsync 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-begin
     */
    Begin(pAsync) {
        ComCall(27, this, "ptr", pAsync)
    }

    /**
     * 
     * @param {ID3D11Asynchronous} pAsync 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-end
     */
    End(pAsync) {
        ComCall(28, this, "ptr", pAsync)
    }

    /**
     * 
     * @param {ID3D11Asynchronous} pAsync 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @param {Integer} GetDataFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-getdata
     */
    GetData(pAsync, pData, DataSize, GetDataFlags) {
        result := ComCall(29, this, "ptr", pAsync, "ptr", pData, "uint", DataSize, "uint", GetDataFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Predicate} pPredicate 
     * @param {BOOL} PredicateValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-setpredication
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(30, this, "ptr", pPredicate, "int", PredicateValue)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(31, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gssetsamplers
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(32, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {ID3D11DepthStencilView} pDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(33, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView)
    }

    /**
     * 
     * @param {Integer} NumRTVs 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {ID3D11DepthStencilView} pDepthStencilView 
     * @param {Integer} UAVStartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @param {Pointer<Integer>} pUAVInitialCounts 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews
     */
    OMSetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, pDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        pUAVInitialCountsMarshal := pUAVInitialCounts is VarRef ? "uint*" : "ptr"

        ComCall(34, this, "uint", NumRTVs, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews, pUAVInitialCountsMarshal, pUAVInitialCounts)
    }

    /**
     * 
     * @param {ID3D11BlendState} pBlendState 
     * @param {Pointer<Float>} BlendFactor 
     * @param {Integer} SampleMask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"

        ComCall(35, this, "ptr", pBlendState, BlendFactorMarshal, BlendFactor, "uint", SampleMask)
    }

    /**
     * 
     * @param {ID3D11DepthStencilState} pDepthStencilState 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omsetdepthstencilstate
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(36, this, "ptr", pDepthStencilState, "uint", StencilRef)
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppSOTargets 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(37, this, "uint", NumBuffers, "ptr*", ppSOTargets, pOffsetsMarshal, pOffsets)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawauto
     */
    DrawAuto() {
        ComCall(38, this)
    }

    /**
     * 
     * @param {ID3D11Buffer} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstancedindirect
     */
    DrawIndexedInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(39, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * 
     * @param {ID3D11Buffer} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstancedindirect
     */
    DrawInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(40, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * 
     * @param {Integer} ThreadGroupCountX 
     * @param {Integer} ThreadGroupCountY 
     * @param {Integer} ThreadGroupCountZ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch
     */
    Dispatch(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(41, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }

    /**
     * 
     * @param {ID3D11Buffer} pBufferForArgs 
     * @param {Integer} AlignedByteOffsetForArgs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dispatchindirect
     */
    DispatchIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(42, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * 
     * @param {ID3D11RasterizerState} pRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rssetstate
     */
    RSSetState(pRasterizerState) {
        ComCall(43, this, "ptr", pRasterizerState)
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D11_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(44, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(45, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {ID3D11Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D11_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(46, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {ID3D11Resource} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(47, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D11_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(48, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * 
     * @param {ID3D11Buffer} pDstBuffer 
     * @param {Integer} DstAlignedByteOffset 
     * @param {ID3D11UnorderedAccessView} pSrcView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-copystructurecount
     */
    CopyStructureCount(pDstBuffer, DstAlignedByteOffset, pSrcView) {
        ComCall(49, this, "ptr", pDstBuffer, "uint", DstAlignedByteOffset, "ptr", pSrcView)
    }

    /**
     * 
     * @param {ID3D11RenderTargetView} pRenderTargetView 
     * @param {Pointer<Float>} ColorRGBA 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-clearrendertargetview
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ColorRGBAMarshal := ColorRGBA is VarRef ? "float*" : "ptr"

        ComCall(50, this, "ptr", pRenderTargetView, ColorRGBAMarshal, ColorRGBA)
    }

    /**
     * 
     * @param {ID3D11UnorderedAccessView} pUnorderedAccessView 
     * @param {Pointer<Integer>} Values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewuint
     */
    ClearUnorderedAccessViewUint(pUnorderedAccessView, Values) {
        ValuesMarshal := Values is VarRef ? "uint*" : "ptr"

        ComCall(51, this, "ptr", pUnorderedAccessView, ValuesMarshal, Values)
    }

    /**
     * 
     * @param {ID3D11UnorderedAccessView} pUnorderedAccessView 
     * @param {Pointer<Float>} Values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewfloat
     */
    ClearUnorderedAccessViewFloat(pUnorderedAccessView, Values) {
        ValuesMarshal := Values is VarRef ? "float*" : "ptr"

        ComCall(52, this, "ptr", pUnorderedAccessView, ValuesMarshal, Values)
    }

    /**
     * 
     * @param {ID3D11DepthStencilView} pDepthStencilView 
     * @param {Integer} ClearFlags 
     * @param {Float} Depth 
     * @param {Integer} Stencil 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(53, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
    }

    /**
     * 
     * @param {ID3D11ShaderResourceView} pShaderResourceView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips
     */
    GenerateMips(pShaderResourceView) {
        ComCall(54, this, "ptr", pShaderResourceView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Float} MinLOD 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-setresourceminlod
     */
    SetResourceMinLOD(pResource, MinLOD) {
        ComCall(55, this, "ptr", pResource, "float", MinLOD)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-getresourceminlod
     */
    GetResourceMinLOD(pResource) {
        result := ComCall(56, this, "ptr", pResource, "float")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {ID3D11Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(57, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * 
     * @param {ID3D11CommandList} pCommandList 
     * @param {BOOL} RestoreContextState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-executecommandlist
     */
    ExecuteCommandList(pCommandList, RestoreContextState) {
        ComCall(58, this, "ptr", pCommandList, "int", RestoreContextState)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hssetshaderresources
     */
    HSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(59, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {ID3D11HullShader} pHullShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hssetshader
     */
    HSSetShader(pHullShader, ppClassInstances, NumClassInstances) {
        ComCall(60, this, "ptr", pHullShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hssetsamplers
     */
    HSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(61, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hssetconstantbuffers
     */
    HSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(62, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dssetshaderresources
     */
    DSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(63, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {ID3D11DomainShader} pDomainShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dssetshader
     */
    DSSetShader(pDomainShader, ppClassInstances, NumClassInstances) {
        ComCall(64, this, "ptr", pDomainShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dssetsamplers
     */
    DSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(65, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dssetconstantbuffers
     */
    DSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(66, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cssetshaderresources
     */
    CSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(67, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @param {Pointer<Integer>} pUAVInitialCounts 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews
     */
    CSSetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        pUAVInitialCountsMarshal := pUAVInitialCounts is VarRef ? "uint*" : "ptr"

        ComCall(68, this, "uint", StartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews, pUAVInitialCountsMarshal, pUAVInitialCounts)
    }

    /**
     * 
     * @param {ID3D11ComputeShader} pComputeShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Integer} NumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cssetshader
     */
    CSSetShader(pComputeShader, ppClassInstances, NumClassInstances) {
        ComCall(69, this, "ptr", pComputeShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cssetsamplers
     */
    CSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(70, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-cssetconstantbuffers
     */
    CSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(71, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetconstantbuffers
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(72, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-psgetshaderresources
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(73, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Pointer<ID3D11PixelShader>} ppPixelShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-psgetshader
     */
    PSGetShader(ppPixelShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(74, this, "ptr*", ppPixelShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-psgetsamplers
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(75, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Pointer<ID3D11VertexShader>} ppVertexShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetshader
     */
    VSGetShader(ppVertexShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(76, this, "ptr*", ppVertexShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-psgetconstantbuffers
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(77, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Pointer<ID3D11InputLayout>} ppInputLayout 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iagetinputlayout
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(78, this, "ptr*", ppInputLayout)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers 
     * @param {Pointer<Integer>} pStrides 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iagetvertexbuffers
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(79, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pIndexBuffer 
     * @param {Pointer<Integer>} Format 
     * @param {Pointer<Integer>} Offset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iagetindexbuffer
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        FormatMarshal := Format is VarRef ? "int*" : "ptr"
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        ComCall(80, this, "ptr*", pIndexBuffer, FormatMarshal, Format, OffsetMarshal, Offset)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetconstantbuffers
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(81, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetshader
     */
    GSGetShader(ppGeometryShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(82, this, "ptr*", ppGeometryShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Pointer<Integer>} pTopology 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-iagetprimitivetopology
     */
    IAGetPrimitiveTopology(pTopology) {
        pTopologyMarshal := pTopology is VarRef ? "int*" : "ptr"

        ComCall(83, this, pTopologyMarshal, pTopology)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetshaderresources
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(84, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetsamplers
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(85, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Pointer<ID3D11Predicate>} ppPredicate 
     * @param {Pointer<BOOL>} pPredicateValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-getpredication
     */
    GetPredication(ppPredicate, pPredicateValue) {
        pPredicateValueMarshal := pPredicateValue is VarRef ? "int*" : "ptr"

        ComCall(86, this, "ptr*", ppPredicate, pPredicateValueMarshal, pPredicateValue)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetshaderresources
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(87, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetsamplers
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(88, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargets
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(89, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView)
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargetsandunorderedaccessviews
     */
    OMGetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, ppDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(90, this, "uint", NumRTVs, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews)
    }

    /**
     * 
     * @param {Pointer<ID3D11BlendState>} ppBlendState 
     * @param {Pointer<Float>} BlendFactor 
     * @param {Pointer<Integer>} pSampleMask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omgetblendstate
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"
        pSampleMaskMarshal := pSampleMask is VarRef ? "uint*" : "ptr"

        ComCall(91, this, "ptr*", ppBlendState, BlendFactorMarshal, BlendFactor, pSampleMaskMarshal, pSampleMask)
    }

    /**
     * 
     * @param {Pointer<ID3D11DepthStencilState>} ppDepthStencilState 
     * @param {Pointer<Integer>} pStencilRef 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-omgetdepthstencilstate
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        pStencilRefMarshal := pStencilRef is VarRef ? "uint*" : "ptr"

        ComCall(92, this, "ptr*", ppDepthStencilState, pStencilRefMarshal, pStencilRef)
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppSOTargets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-sogettargets
     */
    SOGetTargets(NumBuffers, ppSOTargets) {
        ComCall(93, this, "uint", NumBuffers, "ptr*", ppSOTargets)
    }

    /**
     * 
     * @param {Pointer<ID3D11RasterizerState>} ppRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetstate
     */
    RSGetState(ppRasterizerState) {
        ComCall(94, this, "ptr*", ppRasterizerState)
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumViewports 
     * @param {Pointer<D3D11_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetviewports
     */
    RSGetViewports(pNumViewports, pViewports) {
        pNumViewportsMarshal := pNumViewports is VarRef ? "uint*" : "ptr"

        ComCall(95, this, pNumViewportsMarshal, pNumViewports, "ptr", pViewports)
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetscissorrects
     */
    RSGetScissorRects(pNumRects, pRects) {
        pNumRectsMarshal := pNumRects is VarRef ? "uint*" : "ptr"

        ComCall(96, this, pNumRectsMarshal, pNumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetshaderresources
     */
    HSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(97, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Pointer<ID3D11HullShader>} ppHullShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetshader
     */
    HSGetShader(ppHullShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(98, this, "ptr*", ppHullShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetsamplers
     */
    HSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(99, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetconstantbuffers
     */
    HSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(100, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetshaderresources
     */
    DSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(101, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Pointer<ID3D11DomainShader>} ppDomainShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetshader
     */
    DSGetShader(ppDomainShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(102, this, "ptr*", ppDomainShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetsamplers
     */
    DSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(103, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetconstantbuffers
     */
    DSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(104, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-csgetshaderresources
     */
    CSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(105, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumUAVs 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-csgetunorderedaccessviews
     */
    CSGetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(106, this, "uint", StartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews)
    }

    /**
     * 
     * @param {Pointer<ID3D11ComputeShader>} ppComputeShader 
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances 
     * @param {Pointer<Integer>} pNumClassInstances 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-csgetshader
     */
    CSGetShader(ppComputeShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(107, this, "ptr*", ppComputeShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D11SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-csgetsamplers
     */
    CSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(108, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-csgetconstantbuffers
     */
    CSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(109, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate
     */
    ClearState() {
        ComCall(110, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-flush
     */
    Flush() {
        ComCall(111, this)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-gettype
     */
    GetType() {
        result := ComCall(112, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-getcontextflags
     */
    GetContextFlags() {
        result := ComCall(113, this, "uint")
        return result
    }

    /**
     * 
     * @param {BOOL} RestoreDeferredContextState 
     * @returns {ID3D11CommandList} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicecontext-finishcommandlist
     */
    FinishCommandList(RestoreDeferredContextState) {
        result := ComCall(114, this, "int", RestoreDeferredContextState, "ptr*", &ppCommandList := 0, "HRESULT")
        return ID3D11CommandList(ppCommandList)
    }
}
