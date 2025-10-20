#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The device interface represents a virtual adapter for Direct3D 10.0; it is used to perform rendering and create Direct3D resources.
 * @remarks
 * 
  * A device is created using <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdevice">D3D10CreateDevice</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10device
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Device extends IUnknown{
    /**
     * The interface identifier for ID3D10Device
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c0f-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(3, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(4, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10PixelShader>} pPixelShader 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetShader(pPixelShader) {
        ComCall(5, this, "ptr", pPixelShader)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(6, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10VertexShader>} pVertexShader 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetShader(pVertexShader) {
        ComCall(7, this, "ptr", pVertexShader)
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
        ComCall(8, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
        return result
    }

    /**
     * 
     * @param {Integer} VertexCount 
     * @param {Integer} StartVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(9, this, "uint", VertexCount, "uint", StartVertexLocation)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10InputLayout>} pInputLayout 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetInputLayout(pInputLayout) {
        ComCall(11, this, "ptr", pInputLayout)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers 
     * @param {Pointer<UInt32>} pStrides 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(12, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Buffer>} pIndexBuffer 
     * @param {Integer} Format 
     * @param {Integer} Offset 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(13, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
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
        ComCall(14, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
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
        ComCall(15, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10GeometryShader>} pShader 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetShader(pShader) {
        ComCall(17, this, "ptr", pShader)
        return result
    }

    /**
     * 
     * @param {Integer} Topology 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(18, this, "int", Topology)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(19, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(20, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Predicate>} pPredicate 
     * @param {BOOL} PredicateValue 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(21, this, "ptr", pPredicate, "int", PredicateValue)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(22, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(23, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D10DepthStencilView>} pDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(24, this, "uint", NumViews, "ptr", ppRenderTargetViews, "ptr", pDepthStencilView)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10BlendState>} pBlendState 
     * @param {Pointer<Single>} BlendFactor 
     * @param {Integer} SampleMask 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        ComCall(25, this, "ptr", pBlendState, "float*", BlendFactor, "uint", SampleMask)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilState>} pDepthStencilState 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(26, this, "ptr", pDepthStencilState, "uint", StencilRef)
        return result
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppSOTargets 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        ComCall(27, this, "uint", NumBuffers, "ptr", ppSOTargets, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawAuto() {
        ComCall(28, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10RasterizerState>} pRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetState(pRasterizerState) {
        ComCall(29, this, "ptr", pRasterizerState)
        return result
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D10_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(30, this, "uint", NumViewports, "ptr", pViewports)
        return result
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(31, this, "uint", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {Pointer<ID3D10Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D10_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(32, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pDstResource 
     * @param {Pointer<ID3D10Resource>} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(33, this, "ptr", pDstResource, "ptr", pSrcResource)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D10_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {String} Nothing - always returns an empty string
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        ComCall(34, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10RenderTargetView>} pRenderTargetView 
     * @param {Pointer<Single>} ColorRGBA 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ComCall(35, this, "ptr", pRenderTargetView, "float*", ColorRGBA)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilView>} pDepthStencilView 
     * @param {Integer} ClearFlags 
     * @param {Float} Depth 
     * @param {Integer} Stencil 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(36, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10ShaderResourceView>} pShaderResourceView 
     * @returns {String} Nothing - always returns an empty string
     */
    GenerateMips(pShaderResourceView) {
        ComCall(37, this, "ptr", pShaderResourceView)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<ID3D10Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(38, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(39, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(40, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10PixelShader>} ppPixelShader 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetShader(ppPixelShader) {
        ComCall(41, this, "ptr", ppPixelShader)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(42, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10VertexShader>} ppVertexShader 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetShader(ppVertexShader) {
        ComCall(43, this, "ptr", ppVertexShader)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(44, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10InputLayout>} ppInputLayout 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(45, this, "ptr", ppInputLayout)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers 
     * @param {Pointer<UInt32>} pStrides 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(46, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Buffer>} pIndexBuffer 
     * @param {Pointer<Int32>} Format 
     * @param {Pointer<UInt32>} Offset 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(47, this, "ptr", pIndexBuffer, "int*", Format, "uint*", Offset)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(48, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetShader(ppGeometryShader) {
        ComCall(49, this, "ptr", ppGeometryShader)
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTopology 
     * @returns {String} Nothing - always returns an empty string
     */
    IAGetPrimitiveTopology(pTopology) {
        ComCall(50, this, "int*", pTopology)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(51, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(52, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Predicate>} ppPredicate 
     * @param {Pointer<BOOL>} pPredicateValue 
     * @returns {String} Nothing - always returns an empty string
     */
    GetPredication(ppPredicate, pPredicateValue) {
        ComCall(53, this, "ptr", ppPredicate, "ptr", pPredicateValue)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(54, this, "uint", StartSlot, "uint", NumViews, "ptr", ppShaderResourceViews)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(55, this, "uint", StartSlot, "uint", NumSamplers, "ptr", ppSamplers)
        return result
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D10DepthStencilView>} ppDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(56, this, "uint", NumViews, "ptr", ppRenderTargetViews, "ptr", ppDepthStencilView)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10BlendState>} ppBlendState 
     * @param {Pointer<Single>} BlendFactor 
     * @param {Pointer<UInt32>} pSampleMask 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        ComCall(57, this, "ptr", ppBlendState, "float*", BlendFactor, "uint*", pSampleMask)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilState>} ppDepthStencilState 
     * @param {Pointer<UInt32>} pStencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        ComCall(58, this, "ptr", ppDepthStencilState, "uint*", pStencilRef)
        return result
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppSOTargets 
     * @param {Pointer<UInt32>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     */
    SOGetTargets(NumBuffers, ppSOTargets, pOffsets) {
        ComCall(59, this, "uint", NumBuffers, "ptr", ppSOTargets, "uint*", pOffsets)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10RasterizerState>} ppRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetState(ppRasterizerState) {
        ComCall(60, this, "ptr", ppRasterizerState)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} NumViewports 
     * @param {Pointer<D3D10_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetViewports(NumViewports, pViewports) {
        ComCall(61, this, "uint*", NumViewports, "ptr", pViewports)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     */
    RSGetScissorRects(NumRects, pRects) {
        ComCall(62, this, "uint*", NumRects, "ptr", pRects)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetDeviceRemovedReason() {
        result := ComCall(63, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RaiseFlags 
     * @returns {HRESULT} 
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(64, this, "uint", RaiseFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExceptionMode() {
        result := ComCall(65, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<UInt32>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    GetPrivateData(guid, pDataSize, pData) {
        result := ComCall(66, this, "ptr", guid, "uint*", pDataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(67, this, "ptr", guid, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} pData 
     * @returns {HRESULT} 
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(68, this, "ptr", guid, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearState() {
        ComCall(69, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Flush() {
        ComCall(70, this)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_BUFFER_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Buffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    CreateBuffer(pDesc, pInitialData, ppBuffer) {
        result := ComCall(71, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE1D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture1D>} ppTexture1D 
     * @returns {HRESULT} 
     */
    CreateTexture1D(pDesc, pInitialData, ppTexture1D) {
        result := ComCall(72, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture1D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE2D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture2D>} ppTexture2D 
     * @returns {HRESULT} 
     */
    CreateTexture2D(pDesc, pInitialData, ppTexture2D) {
        result := ComCall(73, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture2D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE3D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture3D>} ppTexture3D 
     * @returns {HRESULT} 
     */
    CreateTexture3D(pDesc, pInitialData, ppTexture3D) {
        result := ComCall(74, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pResource 
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10ShaderResourceView>} ppSRView 
     * @returns {HRESULT} 
     */
    CreateShaderResourceView(pResource, pDesc, ppSRView) {
        result := ComCall(75, this, "ptr", pResource, "ptr", pDesc, "ptr", ppSRView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pResource 
     * @param {Pointer<D3D10_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10RenderTargetView>} ppRTView 
     * @returns {HRESULT} 
     */
    CreateRenderTargetView(pResource, pDesc, ppRTView) {
        result := ComCall(76, this, "ptr", pResource, "ptr", pDesc, "ptr", ppRTView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Resource>} pResource 
     * @param {Pointer<D3D10_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10DepthStencilView>} ppDepthStencilView 
     * @returns {HRESULT} 
     */
    CreateDepthStencilView(pResource, pDesc, ppDepthStencilView) {
        result := ComCall(77, this, "ptr", pResource, "ptr", pDesc, "ptr", ppDepthStencilView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_INPUT_ELEMENT_DESC>} pInputElementDescs 
     * @param {Integer} NumElements 
     * @param {Pointer<Void>} pShaderBytecodeWithInputSignature 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10InputLayout>} ppInputLayout 
     * @returns {HRESULT} 
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength, ppInputLayout) {
        result := ComCall(78, this, "ptr", pInputElementDescs, "uint", NumElements, "ptr", pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr", ppInputLayout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10VertexShader>} ppVertexShader 
     * @returns {HRESULT} 
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, ppVertexShader) {
        result := ComCall(79, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", ppVertexShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, ppGeometryShader) {
        result := ComCall(80, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", ppGeometryShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<D3D10_SO_DECLARATION_ENTRY>} pSODeclaration 
     * @param {Integer} NumEntries 
     * @param {Integer} OutputStreamStride 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, OutputStreamStride, ppGeometryShader) {
        result := ComCall(81, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, "uint", OutputStreamStride, "ptr", ppGeometryShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10PixelShader>} ppPixelShader 
     * @returns {HRESULT} 
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, ppPixelShader) {
        result := ComCall(82, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", ppPixelShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_BLEND_DESC>} pBlendStateDesc 
     * @param {Pointer<ID3D10BlendState>} ppBlendState 
     * @returns {HRESULT} 
     */
    CreateBlendState(pBlendStateDesc, ppBlendState) {
        result := ComCall(83, this, "ptr", pBlendStateDesc, "ptr", ppBlendState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_DEPTH_STENCIL_DESC>} pDepthStencilDesc 
     * @param {Pointer<ID3D10DepthStencilState>} ppDepthStencilState 
     * @returns {HRESULT} 
     */
    CreateDepthStencilState(pDepthStencilDesc, ppDepthStencilState) {
        result := ComCall(84, this, "ptr", pDepthStencilDesc, "ptr", ppDepthStencilState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_RASTERIZER_DESC>} pRasterizerDesc 
     * @param {Pointer<ID3D10RasterizerState>} ppRasterizerState 
     * @returns {HRESULT} 
     */
    CreateRasterizerState(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(85, this, "ptr", pRasterizerDesc, "ptr", ppRasterizerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_SAMPLER_DESC>} pSamplerDesc 
     * @param {Pointer<ID3D10SamplerState>} ppSamplerState 
     * @returns {HRESULT} 
     */
    CreateSamplerState(pSamplerDesc, ppSamplerState) {
        result := ComCall(86, this, "ptr", pSamplerDesc, "ptr", ppSamplerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_QUERY_DESC>} pQueryDesc 
     * @param {Pointer<ID3D10Query>} ppQuery 
     * @returns {HRESULT} 
     */
    CreateQuery(pQueryDesc, ppQuery) {
        result := ComCall(87, this, "ptr", pQueryDesc, "ptr", ppQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_QUERY_DESC>} pPredicateDesc 
     * @param {Pointer<ID3D10Predicate>} ppPredicate 
     * @returns {HRESULT} 
     */
    CreatePredicate(pPredicateDesc, ppPredicate) {
        result := ComCall(88, this, "ptr", pPredicateDesc, "ptr", ppPredicate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_DESC>} pCounterDesc 
     * @param {Pointer<ID3D10Counter>} ppCounter 
     * @returns {HRESULT} 
     */
    CreateCounter(pCounterDesc, ppCounter) {
        result := ComCall(89, this, "ptr", pCounterDesc, "ptr", ppCounter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Pointer<UInt32>} pFormatSupport 
     * @returns {HRESULT} 
     */
    CheckFormatSupport(Format, pFormatSupport) {
        result := ComCall(90, this, "int", Format, "uint*", pFormatSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @param {Pointer<UInt32>} pNumQualityLevels 
     * @returns {HRESULT} 
     */
    CheckMultisampleQualityLevels(Format, SampleCount, pNumQualityLevels) {
        result := ComCall(91, this, "int", Format, "uint", SampleCount, "uint*", pNumQualityLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_INFO>} pCounterInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(92, this, "ptr", pCounterInfo)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_DESC>} pDesc 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<UInt32>} pActiveCounters 
     * @param {PSTR} szName 
     * @param {Pointer<UInt32>} pNameLength 
     * @param {PSTR} szUnits 
     * @param {Pointer<UInt32>} pUnitsLength 
     * @param {PSTR} szDescription 
     * @param {Pointer<UInt32>} pDescriptionLength 
     * @returns {HRESULT} 
     */
    CheckCounter(pDesc, pType, pActiveCounters, szName, pNameLength, szUnits, pUnitsLength, szDescription, pDescriptionLength) {
        result := ComCall(93, this, "ptr", pDesc, "int*", pType, "uint*", pActiveCounters, "ptr", szName, "uint*", pNameLength, "ptr", szUnits, "uint*", pUnitsLength, "ptr", szDescription, "uint*", pDescriptionLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCreationFlags() {
        result := ComCall(94, this, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @param {Pointer<Void>} ppResource 
     * @returns {HRESULT} 
     */
    OpenSharedResource(hResource, ReturnedInterface, ppResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(95, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr", ppResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {String} Nothing - always returns an empty string
     */
    SetTextFilterSize(Width, Height) {
        ComCall(96, this, "uint", Width, "uint", Height)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pWidth 
     * @param {Pointer<UInt32>} pHeight 
     * @returns {String} Nothing - always returns an empty string
     */
    GetTextFilterSize(pWidth, pHeight) {
        ComCall(97, this, "uint*", pWidth, "uint*", pHeight)
        return result
    }
}
