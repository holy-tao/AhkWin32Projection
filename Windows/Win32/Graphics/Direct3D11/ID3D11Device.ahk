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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBuffer", "CreateTexture1D", "CreateTexture2D", "CreateTexture3D", "CreateShaderResourceView", "CreateUnorderedAccessView", "CreateRenderTargetView", "CreateDepthStencilView", "CreateInputLayout", "CreateVertexShader", "CreateGeometryShader", "CreateGeometryShaderWithStreamOutput", "CreatePixelShader", "CreateHullShader", "CreateDomainShader", "CreateComputeShader", "CreateClassLinkage", "CreateBlendState", "CreateDepthStencilState", "CreateRasterizerState", "CreateSamplerState", "CreateQuery", "CreatePredicate", "CreateCounter", "CreateDeferredContext", "OpenSharedResource", "CheckFormatSupport", "CheckMultisampleQualityLevels", "CheckCounterInfo", "CheckCounter", "CheckFeatureSupport", "GetPrivateData", "SetPrivateData", "SetPrivateDataInterface", "GetFeatureLevel", "GetCreationFlags", "GetDeviceRemovedReason", "GetImmediateContext", "SetExceptionMode", "GetExceptionMode"]

    /**
     * 
     * @param {Pointer<D3D11_BUFFER_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Buffer>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData, ppBuffer) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE1D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture1D>} ppTexture1D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData, ppTexture1D) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture1D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE2D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture2D>} ppTexture2D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData, ppTexture2D) {
        result := ComCall(5, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture2D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE3D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @param {Pointer<ID3D11Texture3D>} ppTexture3D 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData, ppTexture3D) {
        result := ComCall(6, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", ppTexture3D, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11ShaderResourceView>} ppSRView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc, ppSRView) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppSRView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUAView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pDesc, ppUAView) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppUAView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11RenderTargetView>} ppRTView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc, ppRTView) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppRTView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc, ppDepthStencilView) {
        result := ComCall(10, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppDepthStencilView, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength, ppInputLayout) {
        result := ComCall(11, this, "ptr", pInputElementDescs, "uint", NumElements, "ptr", pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", ppInputLayout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11VertexShader>} ppVertexShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppVertexShader) {
        result := ComCall(12, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppVertexShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppGeometryShader) {
        result := ComCall(13, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppGeometryShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {Pointer<D3D11_SO_DECLARATION_ENTRY>} pSODeclaration 
     * @param {Integer} NumEntries 
     * @param {Pointer<Integer>} pBufferStrides 
     * @param {Integer} NumStrides 
     * @param {Integer} RasterizedStream 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, pBufferStrides, NumStrides, RasterizedStream, pClassLinkage, ppGeometryShader) {
        result := ComCall(14, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, "uint*", pBufferStrides, "uint", NumStrides, "uint", RasterizedStream, "ptr", pClassLinkage, "ptr*", ppGeometryShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11PixelShader>} ppPixelShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppPixelShader) {
        result := ComCall(15, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppPixelShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11HullShader>} ppHullShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createhullshader
     */
    CreateHullShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppHullShader) {
        result := ComCall(16, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppHullShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11DomainShader>} ppDomainShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdomainshader
     */
    CreateDomainShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppDomainShader) {
        result := ComCall(17, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppDomainShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @param {Pointer<ID3D11ComputeShader>} ppComputeShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcomputeshader
     */
    CreateComputeShader(pShaderBytecode, BytecodeLength, pClassLinkage, ppComputeShader) {
        result := ComCall(18, this, "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", ppComputeShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ClassLinkage>} ppLinkage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createclasslinkage
     */
    CreateClassLinkage(ppLinkage) {
        result := ComCall(19, this, "ptr*", ppLinkage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC>} pBlendStateDesc 
     * @param {Pointer<ID3D11BlendState>} ppBlendState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createblendstate
     */
    CreateBlendState(pBlendStateDesc, ppBlendState) {
        result := ComCall(20, this, "ptr", pBlendStateDesc, "ptr*", ppBlendState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDepthStencilDesc 
     * @param {Pointer<ID3D11DepthStencilState>} ppDepthStencilState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc, ppDepthStencilState) {
        result := ComCall(21, this, "ptr", pDepthStencilDesc, "ptr*", ppDepthStencilState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pRasterizerDesc 
     * @param {Pointer<ID3D11RasterizerState>} ppRasterizerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(22, this, "ptr", pRasterizerDesc, "ptr*", ppRasterizerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_SAMPLER_DESC>} pSamplerDesc 
     * @param {Pointer<ID3D11SamplerState>} ppSamplerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc, ppSamplerState) {
        result := ComCall(23, this, "ptr", pSamplerDesc, "ptr*", ppSamplerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pQueryDesc 
     * @param {Pointer<ID3D11Query>} ppQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createquery
     */
    CreateQuery(pQueryDesc, ppQuery) {
        result := ComCall(24, this, "ptr", pQueryDesc, "ptr*", ppQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pPredicateDesc 
     * @param {Pointer<ID3D11Predicate>} ppPredicate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpredicate
     */
    CreatePredicate(pPredicateDesc, ppPredicate) {
        result := ComCall(25, this, "ptr", pPredicateDesc, "ptr*", ppPredicate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pCounterDesc 
     * @param {Pointer<ID3D11Counter>} ppCounter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcounter
     */
    CreateCounter(pCounterDesc, ppCounter) {
        result := ComCall(26, this, "ptr", pCounterDesc, "ptr*", ppCounter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @param {Pointer<ID3D11DeviceContext>} ppDeferredContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdeferredcontext
     */
    CreateDeferredContext(ContextFlags, ppDeferredContext) {
        result := ComCall(27, this, "uint", ContextFlags, "ptr*", ppDeferredContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @param {Pointer<Pointer<Void>>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-opensharedresource
     */
    OpenSharedResource(hResource, ReturnedInterface, ppResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(28, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr*", ppResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Pointer<Integer>} pFormatSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkformatsupport
     */
    CheckFormatSupport(Format, pFormatSupport) {
        result := ComCall(29, this, "int", Format, "uint*", pFormatSupport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @param {Pointer<Integer>} pNumQualityLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount, pNumQualityLevels) {
        result := ComCall(30, this, "int", Format, "uint", SampleCount, "uint*", pNumQualityLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_INFO>} pCounterInfo 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkcounterinfo
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(31, this, "ptr", pCounterInfo)
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pDesc 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pActiveCounters 
     * @param {PSTR} szName 
     * @param {Pointer<Integer>} pNameLength 
     * @param {PSTR} szUnits 
     * @param {Pointer<Integer>} pUnitsLength 
     * @param {PSTR} szDescription 
     * @param {Pointer<Integer>} pDescriptionLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkcounter
     */
    CheckCounter(pDesc, pType, pActiveCounters, szName, pNameLength, szUnits, pUnitsLength, szDescription, pDescriptionLength) {
        result := ComCall(32, this, "ptr", pDesc, "int*", pType, "uint*", pActiveCounters, "ptr", szName, "uint*", pNameLength, "ptr", szUnits, "uint*", pUnitsLength, "ptr", szDescription, "uint*", pDescriptionLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(33, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        result := ComCall(34, this, "ptr", guid, "uint*", pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(35, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(36, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getfeaturelevel
     */
    GetFeatureLevel() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(38, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getimmediatecontext
     */
    GetImmediateContext(ppImmediateContext) {
        ComCall(40, this, "ptr*", ppImmediateContext)
    }

    /**
     * 
     * @param {Integer} RaiseFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setexceptionmode
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(41, this, "uint", RaiseFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getexceptionmode
     */
    GetExceptionMode() {
        result := ComCall(42, this, "uint")
        return result
    }
}
