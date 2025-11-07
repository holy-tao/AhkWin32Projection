#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Buffer.ahk
#Include .\ID3D11Texture1D.ahk
#Include .\ID3D11Texture2D.ahk
#Include .\ID3D11Texture3D.ahk
#Include .\ID3D11ShaderResourceView.ahk
#Include .\ID3D11UnorderedAccessView.ahk
#Include .\ID3D11RenderTargetView.ahk
#Include .\ID3D11DepthStencilView.ahk
#Include .\ID3D11InputLayout.ahk
#Include .\ID3D11VertexShader.ahk
#Include .\ID3D11GeometryShader.ahk
#Include .\ID3D11PixelShader.ahk
#Include .\ID3D11HullShader.ahk
#Include .\ID3D11DomainShader.ahk
#Include .\ID3D11ComputeShader.ahk
#Include .\ID3D11ClassLinkage.ahk
#Include .\ID3D11BlendState.ahk
#Include .\ID3D11DepthStencilState.ahk
#Include .\ID3D11RasterizerState.ahk
#Include .\ID3D11SamplerState.ahk
#Include .\ID3D11Query.ahk
#Include .\ID3D11Predicate.ahk
#Include .\ID3D11Counter.ahk
#Include .\ID3D11DeviceContext.ahk
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
     * @returns {ID3D11Buffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3D11Buffer(ppBuffer)
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE1D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @returns {ID3D11Texture1D} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture1D := 0, "HRESULT")
        return ID3D11Texture1D(ppTexture1D)
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE2D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @returns {ID3D11Texture2D} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData) {
        result := ComCall(5, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D11Texture2D(ppTexture2D)
    }

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE3D_DESC>} pDesc 
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData 
     * @returns {ID3D11Texture3D} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData) {
        result := ComCall(6, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D11Texture3D(ppTexture3D)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @returns {ID3D11ShaderResourceView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D11ShaderResourceView(ppSRView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @returns {ID3D11UnorderedAccessView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pDesc) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppUAView := 0, "HRESULT")
        return ID3D11UnorderedAccessView(ppUAView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @returns {ID3D11RenderTargetView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppRTView := 0, "HRESULT")
        return ID3D11RenderTargetView(ppRTView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @returns {ID3D11DepthStencilView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc) {
        result := ComCall(10, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppDepthStencilView := 0, "HRESULT")
        return ID3D11DepthStencilView(ppDepthStencilView)
    }

    /**
     * 
     * @param {Pointer<D3D11_INPUT_ELEMENT_DESC>} pInputElementDescs 
     * @param {Integer} NumElements 
     * @param {Pointer<Void>} pShaderBytecodeWithInputSignature 
     * @param {Pointer} BytecodeLength 
     * @returns {ID3D11InputLayout} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength) {
        pShaderBytecodeWithInputSignatureMarshal := pShaderBytecodeWithInputSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", pInputElementDescs, "uint", NumElements, pShaderBytecodeWithInputSignatureMarshal, pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", &ppInputLayout := 0, "HRESULT")
        return ID3D11InputLayout(ppInputLayout)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11VertexShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppVertexShader := 0, "HRESULT")
        return ID3D11VertexShader(ppVertexShader)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11GeometryShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
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
     * @returns {ID3D11GeometryShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, pBufferStrides, NumStrides, RasterizedStream, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"
        pBufferStridesMarshal := pBufferStrides is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, pBufferStridesMarshal, pBufferStrides, "uint", NumStrides, "uint", RasterizedStream, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11PixelShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppPixelShader := 0, "HRESULT")
        return ID3D11PixelShader(ppPixelShader)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11HullShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createhullshader
     */
    CreateHullShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppHullShader := 0, "HRESULT")
        return ID3D11HullShader(ppHullShader)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11DomainShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdomainshader
     */
    CreateDomainShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppDomainShader := 0, "HRESULT")
        return ID3D11DomainShader(ppDomainShader)
    }

    /**
     * 
     * @param {Pointer<Void>} pShaderBytecode 
     * @param {Pointer} BytecodeLength 
     * @param {ID3D11ClassLinkage} pClassLinkage 
     * @returns {ID3D11ComputeShader} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcomputeshader
     */
    CreateComputeShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppComputeShader := 0, "HRESULT")
        return ID3D11ComputeShader(ppComputeShader)
    }

    /**
     * 
     * @returns {ID3D11ClassLinkage} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createclasslinkage
     */
    CreateClassLinkage() {
        result := ComCall(19, this, "ptr*", &ppLinkage := 0, "HRESULT")
        return ID3D11ClassLinkage(ppLinkage)
    }

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC>} pBlendStateDesc 
     * @returns {ID3D11BlendState} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createblendstate
     */
    CreateBlendState(pBlendStateDesc) {
        result := ComCall(20, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D11BlendState(ppBlendState)
    }

    /**
     * 
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDepthStencilDesc 
     * @returns {ID3D11DepthStencilState} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc) {
        result := ComCall(21, this, "ptr", pDepthStencilDesc, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D11DepthStencilState(ppDepthStencilState)
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pRasterizerDesc 
     * @returns {ID3D11RasterizerState} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc) {
        result := ComCall(22, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState(ppRasterizerState)
    }

    /**
     * 
     * @param {Pointer<D3D11_SAMPLER_DESC>} pSamplerDesc 
     * @returns {ID3D11SamplerState} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc) {
        result := ComCall(23, this, "ptr", pSamplerDesc, "ptr*", &ppSamplerState := 0, "HRESULT")
        return ID3D11SamplerState(ppSamplerState)
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pQueryDesc 
     * @returns {ID3D11Query} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createquery
     */
    CreateQuery(pQueryDesc) {
        result := ComCall(24, this, "ptr", pQueryDesc, "ptr*", &ppQuery := 0, "HRESULT")
        return ID3D11Query(ppQuery)
    }

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pPredicateDesc 
     * @returns {ID3D11Predicate} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpredicate
     */
    CreatePredicate(pPredicateDesc) {
        result := ComCall(25, this, "ptr", pPredicateDesc, "ptr*", &ppPredicate := 0, "HRESULT")
        return ID3D11Predicate(ppPredicate)
    }

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pCounterDesc 
     * @returns {ID3D11Counter} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcounter
     */
    CreateCounter(pCounterDesc) {
        result := ComCall(26, this, "ptr", pCounterDesc, "ptr*", &ppCounter := 0, "HRESULT")
        return ID3D11Counter(ppCounter)
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @returns {ID3D11DeviceContext} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdeferredcontext
     */
    CreateDeferredContext(ContextFlags) {
        result := ComCall(27, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext(ppDeferredContext)
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} ReturnedInterface 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-opensharedresource
     */
    OpenSharedResource(hResource, ReturnedInterface) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(28, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }

    /**
     * 
     * @param {Integer} Format 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkformatsupport
     */
    CheckFormatSupport(Format) {
        result := ComCall(29, this, "int", Format, "uint*", &pFormatSupport := 0, "HRESULT")
        return pFormatSupport
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount) {
        result := ComCall(30, this, "int", Format, "uint", SampleCount, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
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
        szName := szName is String ? StrPtr(szName) : szName
        szUnits := szUnits is String ? StrPtr(szUnits) : szUnits
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pActiveCountersMarshal := pActiveCounters is VarRef ? "uint*" : "ptr"
        pNameLengthMarshal := pNameLength is VarRef ? "uint*" : "ptr"
        pUnitsLengthMarshal := pUnitsLength is VarRef ? "uint*" : "ptr"
        pDescriptionLengthMarshal := pDescriptionLength is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, "ptr", pDesc, pTypeMarshal, pType, pActiveCountersMarshal, pActiveCounters, "ptr", szName, pNameLengthMarshal, pNameLength, "ptr", szUnits, pUnitsLengthMarshal, pUnitsLength, "ptr", szDescription, pDescriptionLengthMarshal, pDescriptionLength, "HRESULT")
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
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
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
