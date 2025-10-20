#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources.
 * @remarks
 * 
  * A device is created using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>.
  *           
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11device
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device extends IUnknown{
    /**
     * The interface identifier for ID3D11Device
     * @type {Guid}
     */
    static IID => Guid("{db6f6ddb-ac77-4e88-8253-819df9bbf140}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D3D11_BUFFER_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Buffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    CreateBuffer(pDesc, pInitialData, ppBuffer) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE1D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture1D>} ppTexture1D 
     * @returns {HRESULT} 
     */
    CreateTexture1D(pDesc, pInitialData, ppTexture1D) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture1D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE2D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture2D>} ppTexture2D 
     * @returns {HRESULT} 
     */
    CreateTexture2D(pDesc, pInitialData, ppTexture2D) {
        result := ComCall(5, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture2D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE3D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture3D>} ppTexture3D 
     * @returns {HRESULT} 
     */
    CreateTexture3D(pDesc, pInitialData, ppTexture3D) {
        result := ComCall(6, this, "ptr", pDesc, "ptr", pInitialData, "ptr", ppTexture3D, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11ShaderResourceView>} ppSRView 
     * @returns {HRESULT} 
     */
    CreateShaderResourceView(pResource, pDesc, ppSRView) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr", ppSRView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUAView 
     * @returns {HRESULT} 
     */
    CreateUnorderedAccessView(pResource, pDesc, ppUAView) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pDesc, "ptr", ppUAView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11RenderTargetView>} ppRTView 
     * @returns {HRESULT} 
     */
    CreateRenderTargetView(pResource, pDesc, ppRTView) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pDesc, "ptr", ppRTView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView 
     * @returns {HRESULT} 
     */
    CreateDepthStencilView(pResource, pDesc, ppDepthStencilView) {
        result := ComCall(10, this, "ptr", pResource, "ptr", pDesc, "ptr", ppDepthStencilView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INPUT_ELEMENT_DESC>} pInputElementDescs 
     * @param {Integer} NumElements 
     * @param {Pointer<Void>} pShaderBytecodeWithInputSignature 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11InputLayout>} ppInputLayout 
     * @returns {HRESULT} 
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength, ppInputLayout) {
        result := ComCall(11, this, "ptr", pInputElementDescs, "uint", NumElements, "ptr", pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr", ppInputLayout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11VertexShader>} ppVertexShader 
     * @returns {HRESULT} 
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppVertexShader) {
        result := ComCall(12, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppVertexShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppGeometryShader) {
        result := ComCall(13, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppGeometryShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<D3D11_SO_DECLARATION_ENTRY>} pSODeclaration 
     * @param {Integer} NumEntries 
     * @param {Pointer<UInt32>} pBufferStrides 
     * @param {Integer} NumStrides 
     * @param {Integer} RasterizedStream 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, pBufferStrides, NumStrides, RasterizedStream, pClassLinkage, ppGeometryShader) {
        result := ComCall(14, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, "uint*", pBufferStrides, "uint", NumStrides, "uint", RasterizedStream, "ptr", pClassLinkage, "ptr", ppGeometryShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11PixelShader>} ppPixelShader 
     * @returns {HRESULT} 
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppPixelShader) {
        result := ComCall(15, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppPixelShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11HullShader>} ppHullShader 
     * @returns {HRESULT} 
     */
    CreateHullShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppHullShader) {
        result := ComCall(16, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppHullShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11DomainShader>} ppDomainShader 
     * @returns {HRESULT} 
     */
    CreateDomainShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppDomainShader) {
        result := ComCall(17, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppDomainShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<ID3D11ClassLinkage>} pClassLinkage 
     * @param {Pointer<ID3D11ComputeShader>} ppComputeShader 
     * @returns {HRESULT} 
     */
    CreateComputeShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppComputeShader) {
        result := ComCall(18, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr", ppComputeShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage 
     * @returns {HRESULT} 
     */
    CreateClassLinkage(ppLinkage) {
        result := ComCall(19, this, "ptr", ppLinkage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC>} pBlendStateDesc 
     * @param {Pointer<ID3D11BlendState>} ppBlendState 
     * @returns {HRESULT} 
     */
    CreateBlendState(pBlendStateDesc, ppBlendState) {
        result := ComCall(20, this, "ptr", pBlendStateDesc, "ptr", ppBlendState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDepthStencilDesc 
     * @param {Pointer<ID3D11DepthStencilState>} ppDepthStencilState 
     * @returns {HRESULT} 
     */
    CreateDepthStencilState(pDepthStencilDesc, ppDepthStencilState) {
        result := ComCall(21, this, "ptr", pDepthStencilDesc, "ptr", ppDepthStencilState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pRasterizerDesc 
     * @param {Pointer<ID3D11RasterizerState>} ppRasterizerState 
     * @returns {HRESULT} 
     */
    CreateRasterizerState(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(22, this, "ptr", pRasterizerDesc, "ptr", ppRasterizerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_SAMPLER_DESC>} pSamplerDesc 
     * @param {Pointer<ID3D11SamplerState>} ppSamplerState 
     * @returns {HRESULT} 
     */
    CreateSamplerState(pSamplerDesc, ppSamplerState) {
        result := ComCall(23, this, "ptr", pSamplerDesc, "ptr", ppSamplerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pQueryDesc 
     * @param {Pointer<ID3D11Query>} ppQuery 
     * @returns {HRESULT} 
     */
    CreateQuery(pQueryDesc, ppQuery) {
        result := ComCall(24, this, "ptr", pQueryDesc, "ptr", ppQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pPredicateDesc 
     * @param {Pointer<ID3D11Predicate>} ppPredicate 
     * @returns {HRESULT} 
     */
    CreatePredicate(pPredicateDesc, ppPredicate) {
        result := ComCall(25, this, "ptr", pPredicateDesc, "ptr", ppPredicate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pCounterDesc 
     * @param {Pointer<ID3D11Counter>} ppCounter 
     * @returns {HRESULT} 
     */
    CreateCounter(pCounterDesc, ppCounter) {
        result := ComCall(26, this, "ptr", pCounterDesc, "ptr", ppCounter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @param {Pointer<ID3D11DeviceContext>} ppDeferredContext 
     * @returns {HRESULT} 
     */
    CreateDeferredContext(ContextFlags, ppDeferredContext) {
        result := ComCall(27, this, "uint", ContextFlags, "ptr", ppDeferredContext, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(28, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr", ppResource, "int")
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
        result := ComCall(29, this, "int", Format, "uint*", pFormatSupport, "int")
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
        result := ComCall(30, this, "int", Format, "uint", SampleCount, "uint*", pNumQualityLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_INFO>} pCounterInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(31, this, "ptr", pCounterInfo)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pDesc 
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
        result := ComCall(32, this, "ptr", pDesc, "int*", pType, "uint*", pActiveCounters, "ptr", szName, "uint*", pNameLength, "ptr", szUnits, "uint*", pUnitsLength, "ptr", szDescription, "uint*", pDescriptionLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(33, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(34, this, "ptr", guid, "uint*", pDataSize, "ptr", pData, "int")
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
        result := ComCall(35, this, "ptr", guid, "uint", DataSize, "ptr", pData, "int")
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
        result := ComCall(36, this, "ptr", guid, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFeatureLevel() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCreationFlags() {
        result := ComCall(38, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetDeviceRemovedReason() {
        result := ComCall(39, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     */
    GetImmediateContext(ppImmediateContext) {
        ComCall(40, this, "ptr", ppImmediateContext)
        return result
    }

    /**
     * 
     * @param {Integer} RaiseFlags 
     * @returns {HRESULT} 
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(41, this, "uint", RaiseFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExceptionMode() {
        result := ComCall(42, this, "uint")
        return result
    }
}
