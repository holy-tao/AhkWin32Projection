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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VSSetConstantBuffers", "PSSetShaderResources", "PSSetShader", "PSSetSamplers", "VSSetShader", "DrawIndexed", "Draw", "PSSetConstantBuffers", "IASetInputLayout", "IASetVertexBuffers", "IASetIndexBuffer", "DrawIndexedInstanced", "DrawInstanced", "GSSetConstantBuffers", "GSSetShader", "IASetPrimitiveTopology", "VSSetShaderResources", "VSSetSamplers", "SetPredication", "GSSetShaderResources", "GSSetSamplers", "OMSetRenderTargets", "OMSetBlendState", "OMSetDepthStencilState", "SOSetTargets", "DrawAuto", "RSSetState", "RSSetViewports", "RSSetScissorRects", "CopySubresourceRegion", "CopyResource", "UpdateSubresource", "ClearRenderTargetView", "ClearDepthStencilView", "GenerateMips", "ResolveSubresource", "VSGetConstantBuffers", "PSGetShaderResources", "PSGetShader", "PSGetSamplers", "VSGetShader", "PSGetConstantBuffers", "IAGetInputLayout", "IAGetVertexBuffers", "IAGetIndexBuffer", "GSGetConstantBuffers", "GSGetShader", "IAGetPrimitiveTopology", "VSGetShaderResources", "VSGetSamplers", "GetPredication", "GSGetShaderResources", "GSGetSamplers", "OMGetRenderTargets", "OMGetBlendState", "OMGetDepthStencilState", "SOGetTargets", "RSGetState", "RSGetViewports", "RSGetScissorRects", "GetDeviceRemovedReason", "SetExceptionMode", "GetExceptionMode", "GetPrivateData", "SetPrivateData", "SetPrivateDataInterface", "ClearState", "Flush", "CreateBuffer", "CreateTexture1D", "CreateTexture2D", "CreateTexture3D", "CreateShaderResourceView", "CreateRenderTargetView", "CreateDepthStencilView", "CreateInputLayout", "CreateVertexShader", "CreateGeometryShader", "CreateGeometryShaderWithStreamOutput", "CreatePixelShader", "CreateBlendState", "CreateDepthStencilState", "CreateRasterizerState", "CreateSamplerState", "CreateQuery", "CreatePredicate", "CreateCounter", "CheckFormatSupport", "CheckMultisampleQualityLevels", "CheckCounterInfo", "CheckCounter", "GetCreationFlags", "OpenSharedResource", "SetTextFilterSize", "GetTextFilterSize"]

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vssetconstantbuffers
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(3, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-pssetshaderresources
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(4, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {ID3D10PixelShader} pPixelShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-pssetshader
     */
    PSSetShader(pPixelShader) {
        ComCall(5, this, "ptr", pPixelShader)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-pssetsamplers
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(6, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {ID3D10VertexShader} pVertexShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vssetshader
     */
    VSSetShader(pVertexShader) {
        ComCall(7, this, "ptr", pVertexShader)
    }

    /**
     * 
     * @param {Integer} IndexCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-drawindexed
     */
    DrawIndexed(IndexCount, StartIndexLocation, BaseVertexLocation) {
        ComCall(8, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
    }

    /**
     * 
     * @param {Integer} VertexCount 
     * @param {Integer} StartVertexLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-draw
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(9, this, "uint", VertexCount, "uint", StartVertexLocation)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-pssetconstantbuffers
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {ID3D10InputLayout} pInputLayout 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iasetinputlayout
     */
    IASetInputLayout(pInputLayout) {
        ComCall(11, this, "ptr", pInputLayout)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers 
     * @param {Pointer<Integer>} pStrides 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(12, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
    }

    /**
     * 
     * @param {ID3D10Buffer} pIndexBuffer 
     * @param {Integer} Format 
     * @param {Integer} Offset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iasetindexbuffer
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(13, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
    }

    /**
     * 
     * @param {Integer} IndexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartIndexLocation 
     * @param {Integer} BaseVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(14, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} VertexCountPerInstance 
     * @param {Integer} InstanceCount 
     * @param {Integer} StartVertexLocation 
     * @param {Integer} StartInstanceLocation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(15, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gssetconstantbuffers
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {ID3D10GeometryShader} pShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gssetshader
     */
    GSSetShader(pShader) {
        ComCall(17, this, "ptr", pShader)
    }

    /**
     * 
     * @param {Integer} Topology 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iasetprimitivetopology
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(18, this, "int", Topology)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(19, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vssetsamplers
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(20, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {ID3D10Predicate} pPredicate 
     * @param {BOOL} PredicateValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-setpredication
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(21, this, "ptr", pPredicate, "int", PredicateValue)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gssetshaderresources
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(22, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gssetsamplers
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(23, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews 
     * @param {ID3D10DepthStencilView} pDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omsetrendertargets
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(24, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView)
    }

    /**
     * 
     * @param {ID3D10BlendState} pBlendState 
     * @param {Pointer<Float>} BlendFactor 
     * @param {Integer} SampleMask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omsetblendstate
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        ComCall(25, this, "ptr", pBlendState, "float*", BlendFactor, "uint", SampleMask)
    }

    /**
     * 
     * @param {ID3D10DepthStencilState} pDepthStencilState 
     * @param {Integer} StencilRef 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(26, this, "ptr", pDepthStencilState, "uint", StencilRef)
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppSOTargets 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-sosettargets
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        ComCall(27, this, "uint", NumBuffers, "ptr*", ppSOTargets, "uint*", pOffsets)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-drawauto
     */
    DrawAuto() {
        ComCall(28, this)
    }

    /**
     * 
     * @param {ID3D10RasterizerState} pRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rssetstate
     */
    RSSetState(pRasterizerState) {
        ComCall(29, this, "ptr", pRasterizerState)
    }

    /**
     * 
     * @param {Integer} NumViewports 
     * @param {Pointer<D3D10_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(30, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * 
     * @param {Integer} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(31, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @param {ID3D10Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {ID3D10Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D10_BOX>} pSrcBox 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-copysubresourceregion
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(32, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }

    /**
     * 
     * @param {ID3D10Resource} pDstResource 
     * @param {ID3D10Resource} pSrcResource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(33, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * 
     * @param {ID3D10Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D10_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-updatesubresource
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        ComCall(34, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * 
     * @param {ID3D10RenderTargetView} pRenderTargetView 
     * @param {Pointer<Float>} ColorRGBA 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-clearrendertargetview
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ComCall(35, this, "ptr", pRenderTargetView, "float*", ColorRGBA)
    }

    /**
     * 
     * @param {ID3D10DepthStencilView} pDepthStencilView 
     * @param {Integer} ClearFlags 
     * @param {Float} Depth 
     * @param {Integer} Stencil 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-cleardepthstencilview
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(36, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
    }

    /**
     * 
     * @param {ID3D10ShaderResourceView} pShaderResourceView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-generatemips
     */
    GenerateMips(pShaderResourceView) {
        ComCall(37, this, "ptr", pShaderResourceView)
    }

    /**
     * 
     * @param {ID3D10Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {ID3D10Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Integer} Format 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(38, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vsgetconstantbuffers
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(39, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-psgetshaderresources
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(40, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Pointer<ID3D10PixelShader>} ppPixelShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-psgetshader
     */
    PSGetShader(ppPixelShader) {
        ComCall(41, this, "ptr*", ppPixelShader)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-psgetsamplers
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(42, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Pointer<ID3D10VertexShader>} ppVertexShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vsgetshader
     */
    VSGetShader(ppVertexShader) {
        ComCall(43, this, "ptr*", ppVertexShader)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-psgetconstantbuffers
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(44, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Pointer<ID3D10InputLayout>} ppInputLayout 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iagetinputlayout
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(45, this, "ptr*", ppInputLayout)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers 
     * @param {Pointer<Integer>} pStrides 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iagetvertexbuffers
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        ComCall(46, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, "uint*", pStrides, "uint*", pOffsets)
    }

    /**
     * 
     * @param {Pointer<ID3D10Buffer>} pIndexBuffer 
     * @param {Pointer<Integer>} Format 
     * @param {Pointer<Integer>} Offset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iagetindexbuffer
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(47, this, "ptr*", pIndexBuffer, "int*", Format, "uint*", Offset)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gsgetconstantbuffers
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(48, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gsgetshader
     */
    GSGetShader(ppGeometryShader) {
        ComCall(49, this, "ptr*", ppGeometryShader)
    }

    /**
     * 
     * @param {Pointer<Integer>} pTopology 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-iagetprimitivetopology
     */
    IAGetPrimitiveTopology(pTopology) {
        ComCall(50, this, "int*", pTopology)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vsgetshaderresources
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(51, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-vsgetsamplers
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(52, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Pointer<ID3D10Predicate>} ppPredicate 
     * @param {Pointer<BOOL>} pPredicateValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-getpredication
     */
    GetPredication(ppPredicate, pPredicateValue) {
        ComCall(53, this, "ptr*", ppPredicate, "ptr", pPredicateValue)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gsgetshaderresources
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(54, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumSamplers 
     * @param {Pointer<ID3D10SamplerState>} ppSamplers 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gsgetsamplers
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(55, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * 
     * @param {Integer} NumViews 
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews 
     * @param {Pointer<ID3D10DepthStencilView>} ppDepthStencilView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omgetrendertargets
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(56, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView)
    }

    /**
     * 
     * @param {Pointer<ID3D10BlendState>} ppBlendState 
     * @param {Pointer<Float>} BlendFactor 
     * @param {Pointer<Integer>} pSampleMask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omgetblendstate
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        ComCall(57, this, "ptr*", ppBlendState, "float*", BlendFactor, "uint*", pSampleMask)
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilState>} ppDepthStencilState 
     * @param {Pointer<Integer>} pStencilRef 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-omgetdepthstencilstate
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        ComCall(58, this, "ptr*", ppDepthStencilState, "uint*", pStencilRef)
    }

    /**
     * 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D10Buffer>} ppSOTargets 
     * @param {Pointer<Integer>} pOffsets 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-sogettargets
     */
    SOGetTargets(NumBuffers, ppSOTargets, pOffsets) {
        ComCall(59, this, "uint", NumBuffers, "ptr*", ppSOTargets, "uint*", pOffsets)
    }

    /**
     * 
     * @param {Pointer<ID3D10RasterizerState>} ppRasterizerState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rsgetstate
     */
    RSGetState(ppRasterizerState) {
        ComCall(60, this, "ptr*", ppRasterizerState)
    }

    /**
     * 
     * @param {Pointer<Integer>} NumViewports 
     * @param {Pointer<D3D10_VIEWPORT>} pViewports 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rsgetviewports
     */
    RSGetViewports(NumViewports, pViewports) {
        ComCall(61, this, "uint*", NumViewports, "ptr", pViewports)
    }

    /**
     * 
     * @param {Pointer<Integer>} NumRects 
     * @param {Pointer<RECT>} pRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-rsgetscissorrects
     */
    RSGetScissorRects(NumRects, pRects) {
        ComCall(62, this, "uint*", NumRects, "ptr", pRects)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RaiseFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-setexceptionmode
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(64, this, "uint", RaiseFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-getexceptionmode
     */
    GetExceptionMode() {
        result := ComCall(65, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        result := ComCall(66, this, "ptr", guid, "uint*", pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(67, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(68, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-clearstate
     */
    ClearState() {
        ComCall(69, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-flush
     */
    Flush() {
        ComCall(70, this)
    }

    /**
     * 
     * @param {Pointer<D3D10_BUFFER_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Buffer>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData, ppBuffer) {
        result := ComCall(71, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE1D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture1D>} ppTexture1D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData, ppTexture1D) {
        result := ComCall(72, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture1D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE2D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture2D>} ppTexture2D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData, ppTexture2D) {
        result := ComCall(73, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture2D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE3D_DESC>} pDesc 
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D10Texture3D>} ppTexture3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData, ppTexture3D) {
        result := ComCall(74, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D10Resource} pResource 
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10ShaderResourceView>} ppSRView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc, ppSRView) {
        result := ComCall(75, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppSRView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D10Resource} pResource 
     * @param {Pointer<D3D10_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10RenderTargetView>} ppRTView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc, ppRTView) {
        result := ComCall(76, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppRTView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D10Resource} pResource 
     * @param {Pointer<D3D10_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D10DepthStencilView>} ppDepthStencilView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc, ppDepthStencilView) {
        result := ComCall(77, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppDepthStencilView, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength, ppInputLayout) {
        result := ComCall(78, this, "ptr", pInputElementDescs, "uint", NumElements, "ptr", pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", ppInputLayout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10VertexShader>} ppVertexShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, ppVertexShader) {
        result := ComCall(79, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppVertexShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, ppGeometryShader) {
        result := ComCall(80, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppGeometryShader, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, OutputStreamStride, ppGeometryShader) {
        result := ComCall(81, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, "uint", OutputStreamStride, "ptr*", ppGeometryShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D10PixelShader>} ppPixelShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, ppPixelShader) {
        result := ComCall(82, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppPixelShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_BLEND_DESC>} pBlendStateDesc 
     * @param {Pointer<ID3D10BlendState>} ppBlendState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createblendstate
     */
    CreateBlendState(pBlendStateDesc, ppBlendState) {
        result := ComCall(83, this, "ptr", pBlendStateDesc, "ptr*", ppBlendState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_DEPTH_STENCIL_DESC>} pDepthStencilDesc 
     * @param {Pointer<ID3D10DepthStencilState>} ppDepthStencilState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc, ppDepthStencilState) {
        result := ComCall(84, this, "ptr", pDepthStencilDesc, "ptr*", ppDepthStencilState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_RASTERIZER_DESC>} pRasterizerDesc 
     * @param {Pointer<ID3D10RasterizerState>} ppRasterizerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(85, this, "ptr", pRasterizerDesc, "ptr*", ppRasterizerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_SAMPLER_DESC>} pSamplerDesc 
     * @param {Pointer<ID3D10SamplerState>} ppSamplerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc, ppSamplerState) {
        result := ComCall(86, this, "ptr", pSamplerDesc, "ptr*", ppSamplerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_QUERY_DESC>} pQueryDesc 
     * @param {Pointer<ID3D10Query>} ppQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createquery
     */
    CreateQuery(pQueryDesc, ppQuery) {
        result := ComCall(87, this, "ptr", pQueryDesc, "ptr*", ppQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_QUERY_DESC>} pPredicateDesc 
     * @param {Pointer<ID3D10Predicate>} ppPredicate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createpredicate
     */
    CreatePredicate(pPredicateDesc, ppPredicate) {
        result := ComCall(88, this, "ptr", pPredicateDesc, "ptr*", ppPredicate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_DESC>} pCounterDesc 
     * @param {Pointer<ID3D10Counter>} ppCounter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createcounter
     */
    CreateCounter(pCounterDesc, ppCounter) {
        result := ComCall(89, this, "ptr", pCounterDesc, "ptr*", ppCounter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Pointer<Integer>} pFormatSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-checkformatsupport
     */
    CheckFormatSupport(Format, pFormatSupport) {
        result := ComCall(90, this, "int", Format, "uint*", pFormatSupport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @param {Pointer<Integer>} pNumQualityLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount, pNumQualityLevels) {
        result := ComCall(91, this, "int", Format, "uint", SampleCount, "uint*", pNumQualityLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_INFO>} pCounterInfo 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-checkcounterinfo
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(92, this, "ptr", pCounterInfo)
    }

    /**
     * 
     * @param {Pointer<D3D10_COUNTER_DESC>} pDesc 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pActiveCounters 
     * @param {PSTR} szName 
     * @param {Pointer<Integer>} pNameLength 
     * @param {PSTR} szUnits 
     * @param {Pointer<Integer>} pUnitsLength 
     * @param {PSTR} szDescription 
     * @param {Pointer<Integer>} pDescriptionLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-checkcounter
     */
    CheckCounter(pDesc, pType, pActiveCounters, szName, pNameLength, szUnits, pUnitsLength, szDescription, pDescriptionLength) {
        result := ComCall(93, this, "ptr", pDesc, "int*", pType, "uint*", pActiveCounters, "ptr", szName, "uint*", pNameLength, "ptr", szUnits, "uint*", pUnitsLength, "ptr", szDescription, "uint*", pDescriptionLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(94, this, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @param {Pointer<Pointer<Void>>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-opensharedresource
     */
    OpenSharedResource(hResource, ReturnedInterface, ppResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(95, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr*", ppResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-settextfiltersize
     */
    SetTextFilterSize(Width, Height) {
        ComCall(96, this, "uint", Width, "uint", Height)
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-gettextfiltersize
     */
    GetTextFilterSize(pWidth, pHeight) {
        ComCall(97, this, "uint*", pWidth, "uint*", pHeight)
    }
}
