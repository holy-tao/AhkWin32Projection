#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Buffer.ahk
#Include .\ID3D10Texture1D.ahk
#Include .\ID3D10Texture2D.ahk
#Include .\ID3D10Texture3D.ahk
#Include .\ID3D10ShaderResourceView.ahk
#Include .\ID3D10RenderTargetView.ahk
#Include .\ID3D10DepthStencilView.ahk
#Include .\ID3D10InputLayout.ahk
#Include .\ID3D10VertexShader.ahk
#Include .\ID3D10GeometryShader.ahk
#Include .\ID3D10PixelShader.ahk
#Include .\ID3D10BlendState.ahk
#Include .\ID3D10DepthStencilState.ahk
#Include .\ID3D10RasterizerState.ahk
#Include .\ID3D10SamplerState.ahk
#Include .\ID3D10Query.ahk
#Include .\ID3D10Predicate.ahk
#Include .\ID3D10Counter.ahk
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
     * Set the constant buffers used by the vertex shader pipeline stage.
     * @remarks
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vssetconstantbuffers
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(3, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an array of shader resources to the pixel shader stage.
     * @remarks
     * 
     * If you bind a subresource as an input and an output, this API will fill the destination shader resource slot with <b>NULL</b>. The debug layer (when active) will alert you if this is true.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-pssetshaderresources
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(4, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Sets a pixel shader to the device.
     * @remarks
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10PixelShader} pPixelShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>*</b>
     * 
     * Pointer to a pixel shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-pssetshader
     */
    PSSetShader(pPixelShader) {
        ComCall(5, this, "ptr", pPixelShader)
    }

    /**
     * Set an array of sampler states to the pixel shader pipeline stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * <table>
     * <tr>
     * <th>State</th>
     * <th>Default Value</th>
     * </tr>
     * <tr>
     * <td>Filter</td>
     * <td>D3D10_FILTER_MIN_MAG_MIP_LINEAR</td>
     * </tr>
     * <tr>
     * <td>AddressU</td>
     * <td>D3D10_TEXTURE_ADDRESS_CLAMP</td>
     * </tr>
     * <tr>
     * <td>AddressV</td>
     * <td>D3D10_TEXTURE_ADDRESS_CLAMP</td>
     * </tr>
     * <tr>
     * <td>AddressW</td>
     * <td>D3D10_TEXTURE_ADDRESS_CLAMP</td>
     * </tr>
     * <tr>
     * <td>MipLODBias</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>MaxAnisotropy</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>ComparisonFunc</td>
     * <td>D3D10_COMPARISON_NEVER</td>
     * </tr>
     * <tr>
     * <td>BorderColor[0]</td>
     * <td>1.0f</td>
     * </tr>
     * <tr>
     * <td>BorderColor[1]</td>
     * <td>1.0f</td>
     * </tr>
     * <tr>
     * <td>BorderColor[2]</td>
     * <td>1.0f</td>
     * </tr>
     * <tr>
     * <td>BorderColor[3]</td>
     * <td>1.0f</td>
     * </tr>
     * <tr>
     * <td>MinLOD</td>
     * <td>-FLT_MAX</td>
     * </tr>
     * <tr>
     * <td>MaxLOD</td>
     * <td>FLT_MAX</td>
     * </tr>
     * </table>
     *  
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-pssetsamplers
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(6, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Set a vertex shader to the device.
     * @remarks
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10VertexShader} pVertexShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>*</b>
     * 
     * Pointer to a vertex shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vssetshader
     */
    VSSetShader(pVertexShader) {
        ComCall(7, this, "ptr", pVertexShader)
    }

    /**
     * Draw indexed, non-instanced primitives.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">draw API</a> submits work to the rendering pipeline.
     * 
     * If the sum of both indices is negative, the result of the function call is undefined.
     * 
     * 
     * @param {Integer} IndexCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of indices to draw.
     * @param {Integer} StartIndexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first index to use when accesssing the vertex buffer; begin at <i>StartIndexLocation</i> to index vertices from the vertex buffer.
     * @param {Integer} BaseVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Offset from the start of the vertex buffer to the first vertex.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-drawindexed
     */
    DrawIndexed(IndexCount, StartIndexLocation, BaseVertexLocation) {
        ComCall(8, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
    }

    /**
     * Draw non-indexed, non-instanced primitives.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">draw API</a> submits work to the rendering pipeline.
     * 
     * The vertex data for a draw call normally comes from a vertex buffer that is bound to the pipeline. However, you could also provide the vertex data from a shader that has vertex data marked with the <b>SV_VertexId</b> <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">system-value semantic</a>.
     * 
     * 
     * @param {Integer} VertexCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of vertices to draw.
     * @param {Integer} StartVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first vertex, which is usually an offset in a vertex buffer; it could also be used as the first vertex id generated for a shader parameter marked with the <b>SV_TargetId</b> <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">system-value semantic</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-draw
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(9, this, "uint", VertexCount, "uint", StartVertexLocation)
    }

    /**
     * Set the constant buffers used by the pixel shader pipeline stage.
     * @remarks
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-pssetconstantbuffers
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an input-layout object to the input-assembler stage.
     * @remarks
     * 
     * Input-layout objects describe how vertex buffer data is streamed into the IA pipeline stage. To create an input-layout object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createinputlayout">ID3D10Device::CreateInputLayout</a>.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10InputLayout} pInputLayout Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout</a>*</b>
     * 
     * A pointer to the input-layout object (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout</a>), which describes the input buffers that will be read by the IA stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iasetinputlayout
     */
    IASetInputLayout(pInputLayout) {
        ComCall(11, this, "ptr", pInputLayout)
    }

    /**
     * Bind an array of vertex buffers to the input-assembler stage.
     * @remarks
     * 
     * For information about creating vertex buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Create a Vertex Buffer</a>.
     * 
     * Calling this method using a buffer that is currently bound for writing (i.e. bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream output</a> pipeline stage) will effectively bind <b>NULL</b> instead because a buffer cannot be bound as both an input and an output at the same time.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">Debug Layer</a> will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will not prevent invalid data from being used by the runtime.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">input slot</a> for binding. The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot. A maximum of 16 or 32 input slots (ranges from 0 to either D3D10_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1 or D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available; the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">maximum number of input slots depends on the feature level</a>.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of vertex buffers in the array. The number of buffers (plus the starting slot) cannot exceed the total number of IA-stage input slots.
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * A pointer to an array of vertex buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>). The vertex buffers must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_VERTEX_BUFFER</a> flag.
     * @param {Pointer<Integer>} pStrides Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of stride values; one stride value for each buffer in the vertex-buffer array. Each stride is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param {Pointer<Integer>} pOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of offset values; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(12, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * Bind an index buffer to the input-assembler stage.
     * @remarks
     * 
     * For information about creating index buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Create an Index Buffer</a>.
     * 
     * Calling this method using a buffer that is currently bound for writing (i.e. bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream output</a> pipeline stage) will effectively bind <b>NULL</b> instead because a buffer cannot be bound as both an input and an output at the same time.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">Debug Layer</a> will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will not prevent invalid data from being used by the runtime.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10Buffer} pIndexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * A pointer to a buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) that contains indices. The index buffer must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_INDEX_BUFFER</a> flag.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * Specifies format of the data in the index buffer. The only formats allowed for index buffer data are 16-bit (<a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R16_UINT</a>) and 32-bit (<b>DXGI_FORMAT_R32_UINT</b>) integers.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset (in bytes) from the start of the index buffer to the first index to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iasetindexbuffer
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(13, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
    }

    /**
     * Draw indexed, instanced primitives.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">draw API</a> submits work to the rendering pipeline.
     * 
     * Instancing may extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be to draw the same object with different positions and colors. Indexing requires multiple vertex buffers: at least one for per-vertex data and a second buffer for per-instance data. For an example of instancing, see the <a href="https://msdn.microsoft.com/library/Ee416415(v=VS.85).aspx">Instancing10 Sample</a>.
     * 
     * 
     * @param {Integer} IndexCountPerInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the index buffer used in each instance.
     * @param {Integer} InstanceCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of instances to draw.
     * @param {Integer} StartIndexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first index.
     * @param {Integer} BaseVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Index of the first vertex. The index is signed, which allows a negative index. If the negative index plus the index value from the index buffer are less than 0, the result is undefined.
     * @param {Integer} StartInstanceLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first instance.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(14, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Draw non-indexed, instanced primitives.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">draw API</a> submits work to the rendering pipeline.
     * 
     * Instancing may extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be to draw the same object with different positions and colors. For an example of instancing, see the <a href="https://msdn.microsoft.com/library/Ee416415(v=VS.85).aspx">Instancing10 Sample</a>.
     * 
     * The vertex data for an instanced draw call normally comes from a vertex buffer that is bound to the pipeline. However, you could also provide the vertex data from a shader that has instanced data identified with a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">system-value semantic</a> (SV_InstanceID).
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
     * Index of the first instance.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(15, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Set the constant buffers used by the geometry shader pipeline stage.
     * @remarks
     * 
     * The method will not hold references to the interfaces passed in. For that reason, applications should be careful not to release interfaces currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gssetconstantbuffers
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Set a geometry shader to the device.
     * @remarks
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10GeometryShader} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>*</b>
     * 
     * Pointer to a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gssetshader
     */
    GSSetShader(pShader) {
        ComCall(17, this, "ptr", pShader)
    }

    /**
     * Bind information about the primitive type, and data order that describes input data for the input assembler stage.
     * @param {Integer} Topology Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb205334(v=vs.85)">D3D10_PRIMITIVE_TOPOLOGY</a></b>
     * 
     * The type of primitive and ordering of the primitive data (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb205334(v=vs.85)">D3D10_PRIMITIVE_TOPOLOGY</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iasetprimitivetopology
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(18, this, "int", Topology)
    }

    /**
     * Bind an array of shader resources to the vertex shader stage.
     * @remarks
     * 
     * If you bind a subresource as an input and an output, this API will fill the destination shader resource slot with <b>NULL</b>. The debug layer (when active) will alert you if this is true.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vssetshaderresources
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(19, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Set an array of sampler states to the vertex shader pipeline stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * 
     * ```
     * 
     * //Default sampler state:
     * D3D10_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D10_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D10_COMPARISON_NEVER;
     * SamplerDesc.BorderColor[0] = 1.0f;
     * SamplerDesc.BorderColor[1] = 1.0f;
     * SamplerDesc.BorderColor[2] = 1.0f;
     * SamplerDesc.BorderColor[3] = 1.0f;
     * SamplerDesc.MinLOD = -FLT_MAX;
     * SamplerDesc.MaxLOD = FLT_MAX;
     * 		
     * ```
     * 
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vssetsamplers
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(20, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Set a rendering predicate.
     * @remarks
     * 
     * The predicate must be in the "issued" or "signaled" state to be used for predication. While the predicate is set for predication, calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">ID3D10Asynchronous::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">ID3D10Asynchronous::End</a> are invalid.
     * 
     * This method is used to denote that subsequent rendering and resource manipulation commands are not actually performed if the resulting Predicate data of the Predicate is equal to the PredicateValue. However, some Predicates are only hints, so they may not actually prevent operations from being performed. 
     * 
     * The primary usefulness of Predication is to allow an application to issue graphics commands without taking the performance hit of spinning, waiting for <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> to return. So, Predication can occur while <b>ID3D10Asynchronous::GetData</b> returns S_FALSE. Another way to think of it: an application can also use Predication as a fallback, if it is possible that <b>ID3D10Asynchronous::GetData</b> returns S_FALSE. If <b>ID3D10Asynchronous::GetData</b> returns S_OK, the application can skip calling the graphics commands manually with it's own application logic.
     * 
     * 
     * @param {ID3D10Predicate} pPredicate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate</a>*</b>
     * 
     * Pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate</a>). A <b>NULL</b> value indicates "no" predication; in this case, the value of PredicateValue is irrelevent but will be preserved for <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getpredication">ID3D10Device::GetPredication</a>.
     * @param {BOOL} PredicateValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, rendering will be affected by when the predicate's conditions are met. If <b>FALSE</b>, rendering will be affected when the conditions are not met.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-setpredication
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(21, this, "ptr", pPredicate, "int", PredicateValue)
    }

    /**
     * Bind an array of shader resources to the geometry shader stage.
     * @remarks
     * 
     * If you bind a subresource as an input and an output, this API will fill the destination shader resource slot with <b>NULL</b>. The debug layer (when active) will alert you if this is true.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gssetshaderresources
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(22, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Set an array of sampler states to the geometry shader pipeline stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * 
     * ```
     * 
     * //Default sampler state:
     * D3D10_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D10_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D10_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D10_COMPARISON_NEVER;
     * SamplerDesc.BorderColor[0] = 1.0f;
     * SamplerDesc.BorderColor[1] = 1.0f;
     * SamplerDesc.BorderColor[2] = 1.0f;
     * SamplerDesc.BorderColor[3] = 1.0f;
     * SamplerDesc.MinLOD = -FLT_MAX;
     * SamplerDesc.MaxLOD = FLT_MAX;
     * 		
     * ```
     * 
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gssetsamplers
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(23, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Bind one or more render targets and the depth-stencil buffer to the output-merger stage.
     * @remarks
     * 
     * A call to <b>OMSetRenderTargets</b> overrides all bounded render targets and the depth stencil target regardless of the number of render targets in <i>ppRenderTargetViews</i>.
     * 
     * The maximum number of render targets a device can have active at any given time is set by a #define in D3D10.h called D3D10_SIMULTANEOUS_RENDER_TARGET_COUNT. It is invalid to try to set the same <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">subresource</a> to multiple render target slots.
     * 
     * If any subresources are also currently bound for reading or writing (perhaps in a different part of the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>), those bind points will be <b>NULL</b>'ed out to prevent the same subresource from being read and written simultaneously in a single rendering operation.
     * 
     * The method will not hold references to the interfaces passed in. For that reason, applications should be careful not to release interfaces currently in use by the device.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Binding Resources and Pipeline stages</a> for more information on binding resources.
     * 
     * The pixel shader must be able to simultaneously render to at least eight separate render targets. All of these render targets must access the same type of resource: <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-buffer">Buffer</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture1d">Texture1D</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture1darray">Texture1DArray</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2darray">Texture2DArray</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture3d">Texture3D</a>, or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-type">TextureCube</a>. All render targets must have the same size in all dimensions (width and height, and depth for 3D or array size for *Array types). If render targets use multisample anti-aliasing, all bound render targets and depth buffer must be the same form of multisample resource (that is, the sample counts must be the same). Each render target can have a different data format. These render target formats are not required to have identical bit-per-element counts.
     * 
     * Any combination of the eight slots for render targets can have a render target set or not set.
     * 
     * The same resource view cannot be bound to multiple render target slots simultaneously. However, you can set multiple non-overlapping resource views of a single resource as simultaneous multiple render targets.
     * 
     * 
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of render targets to bind.
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>*</b>
     * 
     * Pointer to an array of render targets (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>) to bind to the device. If this parameter is <b>NULL</b>, no render targets are bound. See Remarks.
     * @param {ID3D10DepthStencilView} pDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>*</b>
     * 
     * Pointer to a depth-stencil view (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>) to bind to the device. If this parameter is <b>NULL</b>, the depth-stencil state is not bound.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omsetrendertargets
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(24, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView)
    }

    /**
     * Set the blend state of the output-merger stage.
     * @remarks
     * 
     * Blend state is used by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> to determine how to blend together two RGB pixel values and two alpha values. The two RGB pixel values and two alpha values are the RGB pixel value and alpha value that the pixel shader outputs and the RGB pixel value and alpha value already in the output render target. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> controls the data source that the blending stage uses to modulate values for the pixel shader, render target, or both. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> controls how the blending stage mathematically combines these modulated values.
     * 
     * To create a blend-state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createblendstate">ID3D10Device::CreateBlendState</a>.
     * 
     * Passing in <b>NULL</b> for the blend-state interface indicates to the runtime to set a default blending state.  The following table indicates the default blending parameters.
     * 
     * <table>
     * <tr>
     * <th>State</th>
     * <th>Default Value</th>
     * </tr>
     * <tr>
     * <td>AlphaToCoverageEnable</td>
     * <td><b>FALSE</b></td>
     * </tr>
     * <tr>
     * <td>BlendEnable</td>
     * <td><b>FALSE</b>[8]</td>
     * </tr>
     * <tr>
     * <td>SrcBlend</td>
     * <td>D3D10_BLEND_ONE</td>
     * </tr>
     * <tr>
     * <td>DstBlend</td>
     * <td>D3D10_BLEND_ZERO</td>
     * </tr>
     * <tr>
     * <td>BlendOp</td>
     * <td>D3D10_BLEND_OP_ADD</td>
     * </tr>
     * <tr>
     * <td>SrcBlendAlpha</td>
     * <td>D3D10_BLEND_ONE</td>
     * </tr>
     * <tr>
     * <td>DstBlendAlpha</td>
     * <td>D3D10_BLEND_ZERO</td>
     * </tr>
     * <tr>
     * <td>BlendOpAlpha</td>
     * <td>D3D10_BLEND_OP_ADD</td>
     * </tr>
     * <tr>
     * <td>RenderTargetWriteMask[8]</td>
     * <td>D3D10_COLOR_WRITE_ENABLE_ALL[8]</td>
     * </tr>
     * </table>
     *  
     * 
     * A sample mask determines which samples get updated in all the active render targets. The mapping of bits in a sample mask to samples in a multisample render target is the responsibility of an individual application. A sample mask is always applied; it is independent of whether multisampling is enabled, and does not depend on whether an application uses multisample render targets.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10BlendState} pBlendState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>*</b>
     * 
     * Pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>). Passing in <b>NULL</b> implies a default blend state. See remarks for further details.
     * @param {Pointer<Float>} BlendFactor Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Array of blend factors, one for each RGBA component. The blend factors modulate values for the pixel shader, render target, or both. If you created  the blend-state object with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND_BLEND_FACTOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND_INV_BLEND_FACTOR</a>, the blending stage uses the non-NULL array of blend factors. If you didn't create the blend-state object with <b>D3D10_BLEND_BLEND_FACTOR</b> or <b>D3D10_BLEND_INV_BLEND_FACTOR</b>, the blending stage does not use the non-NULL array of blend factors; the runtime stores the blend factors, and you can later call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetblendstate">ID3D11DeviceContext::OMGetBlendState</a> to retrieve the blend factors. If you pass <b>NULL</b>, the runtime uses or stores a blend factor equal to { 1, 1, 1, 1 }.
     * @param {Integer} SampleMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 32-bit sample coverage. The default value is 0xffffffff. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omsetblendstate
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"

        ComCall(25, this, "ptr", pBlendState, BlendFactorMarshal, BlendFactor, "uint", SampleMask)
    }

    /**
     * Sets the depth-stencil state of the output-merger stage.
     * @remarks
     * 
     * To create a depth-stencil state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilstate">ID3D10Device::CreateDepthStencilState</a>.
     * 
     * Depth-stencil state is used by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger</a> stage to 
     *       setup depth-stencil testing. 
     *       The stencil reference value is the control value used in the depth-stencil test.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an 
     *       interface currently in use by the device.
     * 
     * 
     * @param {ID3D10DepthStencilState} pDepthStencilState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>*</b>
     * 
     * Pointer to a depth-stencil state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>) to bind to the device.
     * @param {Integer} StencilRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reference value to perform against when doing a depth-stencil test. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(26, this, "ptr", pDepthStencilState, "uint", StencilRef)
    }

    /**
     * Set the target output buffers for the StreamOutput stage, which enables/disables the pipeline to stream-out data.
     * @remarks
     * 
     * Call <b>ID3D10Device::SOSetTargets</b> (before any draw calls) to stream data out; call SOSetTargets with <b>NULL</b> to stop streaming data out. For an example, see Exercise 01 from the GDC 2007 workshop, which sets the stream output rendertargets before calling draw methods in the RenderInstanceToStream function.
     * 
     * An offset of -1 will cause the stream output buffer to be appended, continuing after the last location written to the buffer in a previous stream output pass.
     * 
     * Calling this method using a buffer that is currently bound for writing will effectively bind <b>NULL</b> instead because a buffer cannot be bound as both an input and an output at the same time.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">Debug Layer</a> will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will not prevent invalid data from being used by the runtime.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of buffer to bind to the device. A maximum of four output buffers can be set. If less than four are defined by the call, the remaining buffer slots are set to <b>NULL</b>. See Remarks.
     * @param {Pointer<ID3D10Buffer>} ppSOTargets Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * The array of output buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) to bind to the device. The buffers must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_STREAM_OUTPUT</a> flag.
     * @param {Pointer<Integer>} pOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Array of offsets to the output buffers from <i>ppSOTargets</i>, one offset for each buffer. The offset values must be in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-sosettargets
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(27, this, "uint", NumBuffers, "ptr*", ppSOTargets, pOffsetsMarshal, pOffsets)
    }

    /**
     * Draw geometry of an unknown size that was created by the geometry shader stage. See remarks.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">draw API</a> submits work to the rendering pipeline.
     * 
     * After data has been streamed out to <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">SO stage</a> buffers, those buffers can be again bound to the Input Assembler stage at input slot 0 and DrawAuto will draw them without the application needing to know the amount of data that was written to the buffers. A measurement of the amount of data written to the SO stage buffers is maintained internally when the data is streamed out. This means that the CPU does not need to fetch the measurement before re-binding the data that was streamed as input data. Although this amount is tracked internally, it is still the responsibility of applications to use input layouts to describe the format of the data in the SO stage buffers so that the layouts are available when the buffers are again bound to the input assembler.
     * 
     * The following diagram shows the DrawAuto process.
     * 
     * <img alt="Diagram of DrawAuto as data moves through several stages to a buffer and then back to the Input Assembler stage" src="./images/d3d10_pipeline_stages_drawauto.png"/>
     * 
     * Calling DrawAuto does not change the state of the streaming-output buffers that were bound again as inputs.
     * 
     * DrawAuto only works when drawing with one input buffer bound as an input to the IA stage at slot 0. Applications must create the SO buffer resource with both binding flags, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_VERTEX_BUFFER</a> and <b>D3D10_BIND_STREAM_OUTPUT</b>.
     * 
     * This API does not support indexing or instancing.
     * 
     * If an application needs to retrieve the size of the streaming-output buffer, it can query for statistics on streaming output by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query">D3D10_QUERY_SO_STATISTICS</a>.
     * 
     * Example of using DrawAuto can be found in the <a href="https://msdn.microsoft.com/library/Ee416421(v=VS.85).aspx">ParticlesGS Sample</a> and <a href="https://msdn.microsoft.com/library/Ee416423(v=VS.85).aspx">PipesGS Sample</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-drawauto
     */
    DrawAuto() {
        ComCall(28, this)
    }

    /**
     * Set the rasterizer state for the rasterizer stage of the pipeline.
     * @remarks
     * 
     * To create a rasterizer state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrasterizerstate">ID3D10Device::CreateRasterizerState</a>. For more details on setting up the rasterizer state, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-getting-started">Set Rasterizer State</a>.
     * 
     * The method will not hold a reference to the interfaces passed in. For that reason, applications should be careful not to release an interface currently in use by the device.
     * 
     * 
     * @param {ID3D10RasterizerState} pRasterizerState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>*</b>
     * 
     * Pointer to a rasterizer-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>) to bind to the pipeline.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rssetstate
     */
    RSSetState(pRasterizerState) {
        ComCall(29, this, "ptr", pRasterizerState)
    }

    /**
     * Bind an array of viewports to the rasterizer stage of the pipeline.
     * @remarks
     * 
     * All viewports must be set atomically as one operation. Any viewports not defined by the call are disabled.
     * 
     * Which viewport to use is determined by the SV_ViewportArrayIndex semantic output by a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">shader semantic syntax</a>). If a geometry shader does not make use of the SV_ViewportArrayIndex semantic then Direct3D will use the first viewport in the array.
     * 
     * 
     * @param {Integer} NumViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of viewports to bind.
     * @param {Pointer<D3D10_VIEWPORT>} pViewports Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_viewport">D3D10_VIEWPORT</a>*</b>
     * 
     * An array of viewports (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_viewport">D3D10_VIEWPORT</a>) to bind to the device. Each viewport must have its extents within the allowed ranges: D3D10_VIEWPORT_BOUNDS_MIN, D3D10_VIEWPORT_BOUNDS_MAX, D3D10_MIN_DEPTH, and D3D10_MAX_DEPTH.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(30, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * Bind an array of scissor rectangles to the rasterizer stage.
     * @remarks
     * 
     * The scissor rectangles will only be used if ScissorEnable is set to true in the rasterizer state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
     * 
     * Which scissor rectangle to use is determined by the SV_ViewportArrayIndex semantic output by a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">shader semantic syntax</a>). If a geometry shader does not make use of the SV_ViewportArrayIndex semantic then Direct3D will use the first scissor rectangle in the array.
     * 
     * Each scissor rectangle in the array corresponds to a viewport in an array of viewports (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetviewports">ID3D10Device::RSSetViewports</a>).
     * 
     * 
     * @param {Integer} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of scissor rectangles to bind.
     * @param {Pointer<RECT>} pRects Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-rect">D3D10_RECT</a>*</b>
     * 
     * An array of scissor rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-rect">D3D10_RECT</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(31, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Copy a region from a source resource to a destination resource.
     * @remarks
     * 
     * The source box must be within the size of the source resource. The destination location is an absolute value (not a relative value). The destination location can be offset from the source location; however, the size of the region to copy (including the destination location) must fit in the destination resource.
     * 
     * If the resources are buffers, all coordinates are in bytes; if the resources are textures, all coordinates are in texels. 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> is a helper function for calculating subresource indexes.
     * 
     * <b>CopySubresourceRegion</b> performs the copy on the GPU (similar to a memcpy by the CPU). As a consequence, the source and destination resources must meet the following criteria:
     * 
     * <ul>
     * <li>Must be different subresources (although they can be from the same resource).</li>
     * <li>Must be the same <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">type</a>.</li>
     * <li>Must have compatible <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">formats</a> (the formats must either be identical or be from the same type group). For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture because both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. Beginning with Direct3D 10.1, <b>CopySubresourceRegion</b> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.</li>
     * <li>May not be currently <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">mapped</a>.</li>
     * </ul>
     * <b>CopySubresourceRegion</b>  supports only copy; it does not support any stretch, color key, blend, or format conversions. Beginning with Direct3D 10.1, <b>CopySubresourceRegion</b> can reinterpret the resource data between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     * 
     * If your app needs to copy an entire resource, we recommend to use <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">ID3D10Device::CopyResource</a> instead.
     * 
     * <b>CopySubresourceRegion</b> is an asynchronous call that the runtime can add  to the command-buffer queue. This asynchronous behaviorattempts to remove pipeline stalls that may occur when copying data. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">performance considerations</a> for more details.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 10 and Direct3D 10.1:
     * 
     * Direct3D 10 has the following limitations:
     * 
     * <ul>
     * <li>You cannot use a depth-stencil resource as a destination.</li>
     * <li>You cannot use an immutable resource as a destination.</li>
     * <li>You cannot use a multisampled texture as either a source or a destination</li>
     * </ul>
     * Direct3D 10.1 has added support for the following features:
     * 
     * <ul>
     * <li>You can use a depth-stencil buffer as a source or a destination.</li>
     * <li>You can use multisampled resources as  source and destination only if both source and destination have identical multisampled count and quality. If source and destination differ in multisampled count and quality or if the source is multisampled and the destination is not multisampled (or vice versa), the call to <b>ID3D10Device::CopySubresourceRegion</b> fails.</li>
     * <li>You can copy between uncompressed and compressed resources. During copy, the format conversions that are specified in  <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a> are supported automatically. The uncompressed resource must be at least prestructured, and typed. You must also account for the difference between the virtual and the physical size of the mipmaps levels.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If you use <b>CopySubresourceRegion</b> with a depth-stencil buffer or a multisampled resource, you must copy the whole subresource. You must also pass 0 to the <i>DstX</i>, <i>DstY</i>, and <i>DstZ</i> parameters and <b>NULL</b> to the <i>pSrcBox</i> parameter. In addition, source and destination resources, which are represented by the <i>pSrcResource</i> and <i>pDstResource</i> parameters respectively, must have identical sample count values.</div>
     * <div> </div>
     * <h3><a id="Example"></a><a id="example"></a><a id="EXAMPLE"></a>Example</h3>
     * The following code snippet copies a box (located at (120,100),(200,220)) from a source texture into a reqion (130,120),(210,240) in a destination texture.
     * 
     * 
     * ```
     * 
     * D3D10_BOX sourceRegion;
     * sourceRegion.left = 120;
     * sourceRegion.right = 200;
     * sourceRegion.top = 100;
     * sourceRegion.bottom = 220;
     * sourceRegion.front = 0;
     * sourceRegion.back = 1;
     * 
     * pd3dDevice->CopySubresourceRegion( pDestTexture, 0, 130, 120, 0, pSourceTexture, 0, &sourceRegion );
     * 
     * ```
     * 
     * 
     * Notice that, for a 2D texture, front and back are always set to 0 and 1 respectively.
     * 
     * 
     * @param {ID3D10Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * A pointer to the destination resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>).
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Subresource</a> index of the destination.
     * @param {Integer} DstX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x coordinate of the upper left corner of the destination region.
     * @param {Integer} DstY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y coordinate of the upper left corner of the destination region.
     * @param {Integer} DstZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z coordinate of the upper left corner of the destination region. For a 1D or 2D subresource, this must be zero.
     * @param {ID3D10Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * A pointer to the source resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>).
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Subresource</a> index of the source.
     * @param {Pointer<D3D10_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_box">D3D10_BOX</a>*</b>
     * 
     * A 3D box (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_box">D3D10_BOX</a>) that defines the source subresource that can be copied. If <b>NULL</b>, the entire source subresource is copied. The box must fit within the source resource.
     * 
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value. When the box is empty, <b>CopySubresourceRegion</b> doesn't perform a copy operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-copysubresourceregion
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(32, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }

    /**
     * Copy the entire contents of the source resource to the destination resource using the GPU.
     * @remarks
     * 
     * This method is unusual in that it causes the GPU to perform the copy operation (similar to a memcpy by the CPU). As a result, it has a few restrictions designed for improving performance. For instance, the source and destination resources:
     * 
     * <ul>
     * <li>Must be different resources.</li>
     * <li>Must be the same <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">type</a>.</li>
     * <li>Must have identical dimensions (including width, height, depth, and size as appropriate).</li>
     * <li>Must have compatible <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">formats</a>, which means the formats must be identical or at least from the same type group. For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. Beginning with Direct3D 10.1, <b>CopyResource</b> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.</li>
     * <li>May not be currently <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">mapped</a>.</li>
     * </ul>
     * <b>CopyResource</b>  supports only copy; it does not support any stretch, color key, blend, or format conversions. Beginning with Direct3D 10.1, <b>CopyResource</b> can reinterpret the resource data between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">Immutable</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">depth-stencil</a> resources cannot be used as a destination.  Resources created with <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">multisampling capability</a> cannot be used as either a source or destination.
     * 
     * The method is an asynchronous call which may be added to the command-buffer queue. This attempts to remove pipeline stalls that may occur when copying data. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">performance considerations</a> for more details.
     * 
     * An application that only needs to copy a portion of the data in a resource should use <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copysubresourceregion">ID3D10Device::CopySubresourceRegion</a> instead.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 10 and Direct3D 10.1:
     * 
     * Direct3D 10.1 enables depth-stencil resources to be used as either a source or destination. Direct3D 10.1 enables multisampled resources to be used as source and destination only if both source and destination have identical multisampled count and quality. If source and destination differ in multisampled count and quality or one of them is multisampled and the other is not multisampled, the call to <b>ID3D10Device::CopyResource</b> fails.
     * 
     * It is possible to copy between prestructured+typed resources and block-compressed textures. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D10Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * A pointer to the destination resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>).
     * @param {ID3D10Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * A pointer to the source resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(33, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * The CPU copies data from memory to a subresource created in non-mappable memory. See remarks.
     * @remarks
     * 
     * For a shader-constant buffer; set pDstBox to <b>NULL</b>. It is not possible to use this method to partially update a shader-constant buffer.
     * 
     * A resource cannot be used as a destination if:
     * 
     * <ul>
     * <li>the resource is created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">immutable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">dynamic</a> usage.</li>
     * <li>the resource is created as a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">depth-stencil resource</a>.</li>
     * <li>the resource is created with multisampling capability (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a>).</li>
     * </ul>
     * When UpdateSubresource returns, the application is free to change or even free the data pointed to by pSrcData because the method has already copied/snapped away the original contents.
     * 
     * The performance of UpdateSubresource depends on whether or not there is contention for the destination resource. For example, contention for a vertex buffer resource occurs when the application executes a Draw call and later calls UpdateSubresource on the same vertex buffer before the Draw call is actually executed by the GPU.
     * 
     * <ul>
     * <li>When there is contention for the resource, UpdateSubresource will perform 2 copies of the source data. First, the data is copied by the CPU to a temporary storage space accessible by the command buffer. This copy happens before the method returns.  A second copy is then performed by the GPU to copy the source data into non-mappable memory. This second copy happens asynchronously because it is executed by GPU when the command buffer is flushed.</li>
     * <li>When there is no resource contention, the behavior of UpdateSubresource is dependent on which is faster (from the CPU's perspective): copying the data to the command buffer and then having a second copy execute when the command buffer is flushed, or having the CPU copy the data to the final resource location. This is dependent on the architecture of the underlying system.</li>
     * </ul>
     * To better understand the source row pitch and source depth pitch parameters, consider the following illustration of a 3D volume texture.
     * 
     * <img alt="Illustration of a 3D volume texture" src="./images/d3d10_pitches_conceptual.png"/>
     * 
     * Each block in this visual represents an element of data, and the size of each element is dependent on the resource's format. For example, if the resource format is DXGI_FORMAT_R32G32B32A32_FLOAT, then the size of each element would be 128 bits, or 16 bytes. This 3D volume texture has a width of two, a height of three, and a depth of four.
     * 
     * To calculate the source row pitch and source depth pitch for a given resource, use the following formulas:
     * 
     * <ul>
     * <li>Source Row Pitch = [size of one element in bytes] * [number of elements in one row]</li>
     * <li>Source Depth Pitch = [Source Row Pitch] * [number of rows (height)]</li>
     * </ul>
     * In the case of this example 3D volume texture where the size of each element is 16 bytes, the formulas are as follows:
     * 
     * <ul>
     * <li>Source Row Pitch = 16 * 2 = 32</li>
     * <li>Source Depth Pitch = 16 * 2 * 3 = 96</li>
     * </ul>
     * The following illustration shows the resource as it is laid out in memory.
     * 
     * <img alt="Illustration of a 3D volume texture in memory" src="./images/d3d10_pitches.png"/>
     * 
     * For example, the following code snippet shows how to specify a destination region in a 2D texture. Assume the destination texture is 512x512 and the operation will copy the data pointed to by pData to  [(120,100)..(200,220)] in the destination texture. Also assume that rowPitch has been initialized with the proper value (as explained above). Front and back are set to 0 and 1 respectively, because by having front equal to back, the box is technically empty.
     * 
     * 
     * ```
     * 
     * D3D10_BOX destRegion;
     * destRegion.left = 120;
     * destRegion.right = 200;
     * destRegion.top = 100;
     * destRegion.bottom = 220;
     * destRegion.front = 0;
     * destRegion.back = 1;
     * 
     * pd3dDevice->UpdateSubresource( pDestTexture, 0, &destRegion, pData, rowPitch, 0 );
     * 
     * ```
     * 
     * 
     * The 1D case is similar. The following snippet shows how to specify a destination region in a 1D texture. Use the same assumptions as above, except that the texture is 512 in length.
     * 
     * 
     * ```
     * 
     * D3D10_BOX destRegion;
     * destRegion.left = 120;
     * destRegion.right = 200;
     * destRegion.top = 0;
     * destRegion.bottom = 1;
     * destRegion.front = 0;
     * destRegion.back = 1;
     * 
     * pd3dDevice->UpdateSubresource( pDestTexture, 0, &destRegion, pData, rowPitch, 0 );
     * 
     * ```
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 10 and Direct3D 10.1:
     * 
     * Direct3D 10.1 enables depth-stencil resources to be used as either a source or destination.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D10Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * A pointer to the destination resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource Interface</a>).
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @param {Pointer<D3D10_BOX>} pDstBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_box">D3D10_BOX</a>*</b>
     * 
     * A box that defines the portion of the destination subresource to copy the resource data into. Coordinates are in bytes for buffers and in texels for textures. If <b>NULL</b>, the data is written to the destination subresource with no offset. The dimensions of the source must fit the destination (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_box">D3D10_BOX</a>).
     * 
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value. When the box is empty, <b>UpdateSubresource</b> doesn't perform an update operation.
     * @param {Pointer<Void>} pSrcData Type: <b>const void*</b>
     * 
     * A pointer to the source data in memory.
     * @param {Integer} SrcRowPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one row of the source data.
     * @param {Integer} SrcDepthPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one depth slice of source data.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-updatesubresource
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(34, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * Set all the elements in a render target to one value.
     * @remarks
     * 
     * Applications that wish to clear a render target to a specific integer value bit pattern should render a screen-aligned quad instead of using this method.  The reason for this is because this method accepts as input a floating point value, which may not have the same bit pattern as the original integer.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * Unlike Direct3D 9, the full extent of the resource view is always cleared. Viewport and scissor settings are not applied.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When using <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-10level9">10Level9</a>, <b>ClearRenderTargetView</b> only clears the first array slice in the render target view. This can impact (for example) cube map rendering scenarios. Applications should create a render target view for each face or array slice, then clear each view individually.
     * 
     * 
     * @param {ID3D10RenderTargetView} pRenderTargetView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>*</b>
     * 
     * Pointer to the render target.
     * @param {Pointer<Float>} ColorRGBA Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * A 4-component array that represents the color to fill the render target with.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-clearrendertargetview
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ColorRGBAMarshal := ColorRGBA is VarRef ? "float*" : "ptr"

        ComCall(35, this, "ptr", pRenderTargetView, ColorRGBAMarshal, ColorRGBA)
    }

    /**
     * Clears the depth-stencil resource.
     * @remarks
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * Unlike Direct3D 9, the full extent of the resource view is always cleared. Viewport and scissor settings are not applied.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D10DepthStencilView} pDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>*</b>
     * 
     * Pointer to the depth stencil to be cleared.
     * @param {Integer} ClearFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Which parts of the buffer to clear. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_clear_flag">D3D10_CLEAR_FLAG</a>.
     * @param {Float} Depth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Clear the depth buffer with this value. This value will be clamped between 0 and 1.
     * @param {Integer} Stencil Type: <b>UINT8</b>
     * 
     * Clear the stencil buffer with this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-cleardepthstencilview
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(36, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
    }

    /**
     * Generates mipmaps for the given shader resource.
     * @remarks
     * 
     * GenerateMips may be called on any ID3D10ShaderResourceView in order to generate the lower mipmap levels. GenerateMips uses the largest mipmap level of the view to recursively generate the lower levels of the mip, stopping with the smallest level specified by the view. If the base resource was not created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_RENDER_TARGET</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_misc_flag">D3D10_RESOURCE_MISC_GENERATE_MIPS</a>, this call has no effect.
     * 
     * Video adapters that support <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1 and higher support generating mipmaps if you use any of these formats:
     * 
     * 
     * ```
     * 
     * DXGI_FORMAT_R8G8B8A8_UNORM
     * DXGI_FORMAT_R8G8B8A8_UNORM_SRGB
     * DXGI_FORMAT_B5G6R5_UNORM
     * DXGI_FORMAT_B8G8R8A8_UNORM
     * DXGI_FORMAT_B8G8R8A8_UNORM_SRGB
     * DXGI_FORMAT_B8G8R8X8_UNORM
     * DXGI_FORMAT_B8G8R8X8_UNORM_SRGB
     * 
     * ```
     * 
     * 
     * Video adapters that support <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.2 and higher support generating mipmaps if you use any of these formats in addition to any of the formats for feature level 9.1:
     * 
     * 
     * ```
     * 
     * DXGI_FORMAT_R16G16B16A16_FLOAT
     * DXGI_FORMAT_R16G16B16A16_UNORM
     * DXGI_FORMAT_R16G16_FLOAT
     * DXGI_FORMAT_R16G16_UNORM
     * DXGI_FORMAT_R32_FLOAT
     * 
     * ```
     * 
     * 
     * Video adapters that support <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.3 and higher support generating mipmaps if you use any of these formats in addition to any of the formats for feature levels 9.1 and 9.2:
     * 
     * 
     * ```
     * 
     * DXGI_FORMAT_R32G32B32A32_FLOAT
     * DXGI_FORMAT_B4G4R4A4 (optional)
     * 
     * ```
     * 
     * 
     * Video adapters that support <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 10 and higher support generating mipmaps if you use any of these formats in addition to any of the formats for feature levels 9.1, 9.2, and 9.3:
     * 
     * 
     * ```
     * 
     * DXGI_FORMAT_R32G32B32_FLOAT (optional)
     * DXGI_FORMAT_R16G16B16A16_SNORM
     * DXGI_FORMAT_R32G32_FLOAT
     * DXGI_FORMAT_R10G10B10A2_UNORM
     * DXGI_FORMAT_R11G11B10_FLOAT
     * DXGI_FORMAT_R8G8B8A8_SNORM
     * DXGI_FORMAT_R16G16_SNORM
     * DXGI_FORMAT_R8G8_UNORM
     * DXGI_FORMAT_R8G8_SNORM
     * DXGI_FORMAT_R16_FLOAT
     * DXGI_FORMAT_R16_UNORM
     * DXGI_FORMAT_R16_SNORM
     * DXGI_FORMAT_R8_UNORM
     * DXGI_FORMAT_R8_SNORM
     * DXGI_FORMAT_A8_UNORM
     * DXGI_FORMAT_B5G5R5A1_UNORM (optional)
     * 
     * ```
     * 
     * 
     * For all other unsupported formats, this method will silently fail.
     * 
     * 
     * @param {ID3D10ShaderResourceView} pShaderResourceView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>. The mipmaps will be generated for this shader resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-generatemips
     */
    GenerateMips(pShaderResourceView) {
        ComCall(37, this, "ptr", pShaderResourceView)
    }

    /**
     * Copy a multisampled resource into a non-multisampled resource. This API is most useful when re-using the resulting rendertarget of one render pass as an input to a second render pass.
     * @remarks
     * 
     * Both the source and destination resources must be the same <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">resource type</a> and have the same dimensions.
     * 
     * The source and destination must have compatible formats. There are three scenarios for this:
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
     * <td>Both the source and desintation must have the same typeless format (i.e. both must have DXGI_FORMAT_R32_TYPELESS), and the Format parameter must specify a format that is compatible with the source and destination (i.e. if both are DXGI_FORMAT_R32_TYPELESS then DXGI_FORMAT_R32_FLOAT or DXGI_FORMAT_R32_UINT could be specified in the Format parameter).</td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D10Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Destination resource. Must be a created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE_DEFAULT</a> flag and be single-sampled. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>.
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @param {ID3D10Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Source resource. Must be multisampled.
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The source subresource of the source resource.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> that indicates how the multisampled resource will be resolved to a single-sampled resource. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(38, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * Get the constant buffers used by the vertex shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vsgetconstantbuffers
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(39, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the pixel shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-psgetshaderresources
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(40, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get the pixel shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10PixelShader>} ppPixelShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>**</b>
     * 
     * Address of a pointer to a pixel shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-psgetshader
     */
    PSGetShader(ppPixelShader) {
        ComCall(41, this, "ptr*", ppPixelShader)
    }

    /**
     * Get an array of sampler states from the pixel shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting samplers from.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from the device. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>**</b>
     * 
     * Arry of sampler-state interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>) to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-psgetsamplers
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(42, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the vertex shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10VertexShader>} ppVertexShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>**</b>
     * 
     * Address of a pointer to a vertex shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vsgetshader
     */
    VSGetShader(ppVertexShader) {
        ComCall(43, this, "ptr*", ppVertexShader)
    }

    /**
     * Get the constant buffers used by the pixel shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-psgetconstantbuffers
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(44, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get a pointer to the input-layout object that is bound to the input-assembler stage.
     * @remarks
     * 
     * For information about creating an input-layout object, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">Creating the Input-Layout Object</a>.
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10InputLayout>} ppInputLayout Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout</a>**</b>
     * 
     * A pointer to the input-layout object (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout</a>), which describes the input buffers that will be read by the IA stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iagetinputlayout
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(45, this, "ptr*", ppInputLayout)
    }

    /**
     * Get the vertex buffers bound to the input-assembler stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage-getting-started">input slot</a> of the first vertex buffer to get. The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot. A maximum of 16 or 32 input slots (ranges from 0 to either D3D10_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1 or D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available; the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">maximum number of input slots depends on the feature level</a>.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of vertex buffers to get starting at the offset. The number of buffers (plus the starting slot) cannot exceed the total number of IA-stage input slots.
     * @param {Pointer<ID3D10Buffer>} ppVertexBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * A pointer to an array of vertex buffers returned by the method (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>).
     * @param {Pointer<Integer>} pStrides Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of stride values returned by the method; one stride value for each buffer in the vertex-buffer array. Each stride value is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param {Pointer<Integer>} pOffsets Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of offset values returned by the method; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iagetvertexbuffers
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(46, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * Get a pointer to the index buffer that is bound to the input-assembler stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10Buffer>} pIndexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * A pointer to an index buffer returned by the method (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>).
     * @param {Pointer<Integer>} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>*</b>
     * 
     * Specifies format of the data in the index buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>). These formats provide the size and type of the data in the buffer. The only formats allowed for index buffer data are 16-bit (DXGI_FORMAT_R16_UINT) and 32-bit (DXGI_FORMAT_R32_UINT) integers.
     * @param {Pointer<Integer>} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Offset (in bytes) from the start of the index buffer, to the first index to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iagetindexbuffer
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        FormatMarshal := Format is VarRef ? "int*" : "ptr"
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        ComCall(47, this, "ptr*", pIndexBuffer, FormatMarshal, Format, OffsetMarshal, Offset)
    }

    /**
     * Get the constant buffers used by the geometry shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve.
     * @param {Pointer<ID3D10Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gsgetconstantbuffers
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(48, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the geometry shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10GeometryShader>} ppGeometryShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>**</b>
     * 
     * Address of a pointer to a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gsgetshader
     */
    GSGetShader(ppGeometryShader) {
        ComCall(49, this, "ptr*", ppGeometryShader)
    }

    /**
     * Get information about the primitive type, and data order that describes input data for the input assembler stage.
     * @param {Pointer<Integer>} pTopology Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb205334(v=vs.85)">D3D10_PRIMITIVE_TOPOLOGY</a>*</b>
     * 
     * A pointer to the type of primitive, and ordering of the primitive data (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb205334(v=vs.85)">D3D10_PRIMITIVE_TOPOLOGY</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-iagetprimitivetopology
     */
    IAGetPrimitiveTopology(pTopology) {
        pTopologyMarshal := pTopology is VarRef ? "int*" : "ptr"

        ComCall(50, this, pTopologyMarshal, pTopology)
    }

    /**
     * Get the vertex shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vsgetshaderresources
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(51, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get an array of sampler states from the vertex shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting samplers from.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from the device. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>**</b>
     * 
     * Arry of sampler-state interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>) to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-vsgetsamplers
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(52, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the rendering predicate state.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10Predicate>} ppPredicate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate</a>**</b>
     * 
     * Address of a pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate</a>). Value stored here will be <b>NULL</b> upon device creation.
     * @param {Pointer<BOOL>} pPredicateValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Address of a boolean to fill with the predicate comparison value. <b>FALSE</b> upon device creation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-getpredication
     */
    GetPredication(ppPredicate, pPredicateValue) {
        pPredicateValueMarshal := pPredicateValue is VarRef ? "int*" : "ptr"

        ComCall(53, this, "ptr*", ppPredicate, pPredicateValueMarshal, pPredicateValue)
    }

    /**
     * Get the geometry shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from.
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gsgetshaderresources
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(54, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get an array of sampler states from the geometry shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting samplers from.
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from the device. Each pipeline stage has a total of 16 sampler slots available.
     * @param {Pointer<ID3D10SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>**</b>
     * 
     * Arry of sampler-state pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>) to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gsgetsamplers
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(55, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get pointers to the render targets and the depth-stencil buffer that are available to the output-merger stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of render targets to retrieve.
     * @param {Pointer<ID3D10RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * Pointer to an array of render targets views (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>) to be filled with the render targets from the device. Specify <b>NULL</b> for this parameter when retrieval of a render target is not needed.
     * @param {Pointer<ID3D10DepthStencilView>} ppDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>**</b>
     * 
     * Pointer to a depth-stencil view (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>) to be filled with the depth-stencil information from the device. Specify <b>NULL</b> for this parameter when retrieval of the depth-stencil view is not needed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omgetrendertargets
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(56, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView)
    }

    /**
     * Get the blend state of the output-merger stage.
     * @remarks
     * 
     * The reference count of the returned interface will be incremented by one when the blend state is retrieved. Applications must release returned pointer(s) when they are no longer needed, or else there will be a memory leak.
     * 
     * 
     * @param {Pointer<ID3D10BlendState>} ppBlendState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>**</b>
     * 
     * Address of a pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>).
     * @param {Pointer<Float>} BlendFactor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Array of blend factors, one for each RGBA component.
     * @param {Pointer<Integer>} pSampleMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">sample mask</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omgetblendstate
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"
        pSampleMaskMarshal := pSampleMask is VarRef ? "uint*" : "ptr"

        ComCall(57, this, "ptr*", ppBlendState, BlendFactorMarshal, BlendFactor, pSampleMaskMarshal, pSampleMask)
    }

    /**
     * Gets the depth-stencil state of the output-merger stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10DepthStencilState>} ppDepthStencilState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>**</b>
     * 
     * Address of a pointer to a depth-stencil state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>) to be filled with information from the device.
     * @param {Pointer<Integer>} pStencilRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to the stencil reference value used in the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">depth-stencil</a> test.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-omgetdepthstencilstate
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        pStencilRefMarshal := pStencilRef is VarRef ? "uint*" : "ptr"

        ComCall(58, this, "ptr*", ppDepthStencilState, pStencilRefMarshal, pStencilRef)
    }

    /**
     * Get the target output buffers for the StreamOutput stage of the pipeline.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to get. A maximum of four output buffers can be retrieved.
     * @param {Pointer<ID3D10Buffer>} ppSOTargets Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * An array of output buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>) to be retrieved from the device.
     * @param {Pointer<Integer>} pOffsets Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Array of offsets to the output buffers from <i>ppSOTargets</i>, one offset for each buffer. The offset values are in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-sogettargets
     */
    SOGetTargets(NumBuffers, ppSOTargets, pOffsets) {
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(59, this, "uint", NumBuffers, "ptr*", ppSOTargets, pOffsetsMarshal, pOffsets)
    }

    /**
     * Get the rasterizer state from the rasterizer stage of the pipeline.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D10RasterizerState>} ppRasterizerState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>**</b>
     * 
     * Address of a pointer to a rasterizer-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>) to fill with information from the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rsgetstate
     */
    RSGetState(ppRasterizerState) {
        ComCall(60, this, "ptr*", ppRasterizerState)
    }

    /**
     * Get the array of viewports bound to the rasterizer stage
     * @param {Pointer<Integer>} NumViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of viewports in <i>pViewports</i>.  
     *         If <i>pViewports</i> is <b>NULL</b>, this will be filled with the number of viewports currently bound.
     * @param {Pointer<D3D10_VIEWPORT>} pViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_viewport">D3D10_VIEWPORT</a>*</b>
     * 
     * An array of viewports (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_viewport">D3D10_VIEWPORT</a>) to be filled with information from the device. If NumViewports is greater than 
     *         the actual number of viewports currently bound, then unused members of the array will contain 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rsgetviewports
     */
    RSGetViewports(NumViewports, pViewports) {
        NumViewportsMarshal := NumViewports is VarRef ? "uint*" : "ptr"

        ComCall(61, this, NumViewportsMarshal, NumViewports, "ptr", pViewports)
    }

    /**
     * Get the array of scissor rectangles bound to the rasterizer stage.
     * @param {Pointer<Integer>} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of scissor rectangles to get. If pRects is <b>NULL</b>, this will be filled with the number of scissor rectangles currently bound.
     * @param {Pointer<RECT>} pRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-rect">D3D10_RECT</a>*</b>
     * 
     * An array of scissor rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-rect">D3D10_RECT</a>). If NumRects is greater than the number of scissor rects currently bound, then unused members of the array will contain 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-rsgetscissorrects
     */
    RSGetScissorRects(NumRects, pRects) {
        NumRectsMarshal := NumRects is VarRef ? "uint*" : "ptr"

        ComCall(62, this, NumRectsMarshal, NumRects, "ptr", pRects)
    }

    /**
     * Get the reason why the device was removed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: 
     * 
     * 
     * 
     * <ul>
     * <li>DXGI_ERROR_DEVICE_HUNG</li>
     * <li>DXGI_ERROR_DEVICE_REMOVED</li>
     * <li>DXGI_ERROR_DEVICE_RESET</li>
     * <li>DXGI_ERROR_DRIVER_INTERNAL_ERROR</li>
     * <li>DXGI_ERROR_INVALID_CALL</li>
     * <li>S_OK</li>
     * </ul>
     * For more detail on these return codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * Get the exception-mode flags.
     * @param {Integer} RaiseFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_raise_flag">D3D10_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-setexceptionmode
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(64, this, "uint", RaiseFlags, "HRESULT")
        return result
    }

    /**
     * Get the exception-mode flags.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="/windows/desktop/api/d3d10/ne-d3d10-d3d10_raise_flag">D3D10_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-getexceptionmode
     */
    GetExceptionMode() {
        result := ComCall(65, this, "uint")
        return result
    }

    /**
     * Get data from a device that is associated with a guid.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Size of the data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Pointer to the data stored with the device. If pData is <b>NULL</b>, DataSize must also be 0, and any data previously associated with the guid will be destroyed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set data to a device and associate that data with a guid.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Pointer to the data to be stored with this device. If pData is <b>NULL</b>, DataSize must also be 0, and any data previously associated with the guid will be destroyed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(67, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associate an IUnknown-derived interface with this device and associate that interface with an application-defined guid.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the interface.
     * @param {IUnknown} pData Type: <b>const IUnknown*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface to be associated with the device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(68, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Restore all default device settings; return the device to the state it was in when it was created.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-clearstate
     */
    ClearState() {
        ComCall(69, this)
    }

    /**
     * Send queued-up commands in the command buffer to the GPU.
     * @remarks
     * 
     * Most applications will not need to call this method. Calling this method when not necessary will incur a performance penalty. Each call to <b>Flush</b> incurs a significant amount of overhead.
     * 
     * When Direct3D state-setting, present, or draw commands are called by an application, those commands are queued into an internal command buffer. <b>Flush</b> sends those commands to the GPU for processing. Normally, these commands are sent to the GPU automatically whenever Direct3D determines that they need to be, such as when the command buffer is full or when mapping a resource. <b>Flush</b> will send the commands manually.
     * 
     * <b>Flush</b> should be used when the CPU waits for an arbitrary amount of time (such as when calling <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleep">Sleep</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d10/id3dx10threadpump-waitforallitems">ID3DX10ThreadPump::WaitForAllItems</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-waitforvblank">WaitForVBlank</a>.
     * 
     * For more information about how flushing works, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/accurately-profiling-direct3d-api-calls">Accurately Profiling Direct3D API Calls (Direct3D 9)</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-flush
     */
    Flush() {
        ComCall(70, this)
    }

    /**
     * Create a buffer (vertex buffer, index buffer, or shader-constant buffer).
     * @param {Pointer<D3D10_BUFFER_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>*</b>
     * 
     * Pointer to a buffer description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>).
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>*</b>
     * 
     * Pointer to the initialization data (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>); use <b>NULL</b> to allocate space only.
     * @returns {ID3D10Buffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * Address of a pointer to the buffer created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer Interface</a>). Set this parameter to <b>NULL</b> to validate the other input parameters (S_FALSE indicates a pass).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData) {
        result := ComCall(71, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3D10Buffer(ppBuffer)
    }

    /**
     * Create an array of 1D textures (see Texture1D).
     * @param {Pointer<D3D10_TEXTURE1D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>*</b>
     * 
     * Pointer to a 1D texture description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>). To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">subresource</a> descriptions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>); one for each subresource (ordered by texture array index). Applications may not specify <b>NULL</b> for pInitialData when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>). If the resource is multisampled, pInitialData must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created.
     * @returns {ID3D10Texture1D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture1d">ID3D10Texture1D</a>**</b>
     * 
     * Address of a pointer to the created texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture1d">ID3D10Texture1D Interface</a>). Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData) {
        result := ComCall(72, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture1D := 0, "HRESULT")
        return ID3D10Texture1D(ppTexture1D)
    }

    /**
     * Create an array of 2D textures (see Texture2D).
     * @param {Pointer<D3D10_TEXTURE2D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>*</b>
     * 
     * Pointer to a 2D texture description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>). To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">subresource</a> descriptions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>); one for each subresource (ordered by texture array index, then mip level). Applications may not specify <b>NULL</b> for pInitialData when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>). If the resource is multisampled, pInitialData must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created.
     * @returns {ID3D10Texture2D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture2d">ID3D10Texture2D</a>**</b>
     * 
     * Address of a pointer to the created texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture2d">ID3D10Texture2D Interface</a>). Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData) {
        result := ComCall(73, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D10Texture2D(ppTexture2D)
    }

    /**
     * Create a single 3D texture (see Texture3D).
     * @param {Pointer<D3D10_TEXTURE3D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture3d_desc">D3D10_TEXTURE3D_DESC</a>*</b>
     * 
     * Pointer to a 3D texture description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture3d_desc">D3D10_TEXTURE3D_DESC</a>). To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D10_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">subresource</a> descriptions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_subresource_data">D3D10_SUBRESOURCE_DATA</a>); one for each subresource (ordered by texture array index, then slice index, then mip level). Applications may not specify <b>NULL</b> for pInitialData when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>). If the resource is multisampled, pInitialData must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created.
     * @returns {ID3D10Texture3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture3d">ID3D10Texture3D</a>**</b>
     * 
     * Address of a pointer to the created texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10texture3d">ID3D10Texture3D Interface</a>). Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData) {
        result := ComCall(74, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D10Texture3D(ppTexture3D)
    }

    /**
     * Create a shader-resource view for accessing data in a resource.
     * @param {ID3D10Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">resource</a> that will serve as input to a shader. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_SHADER_RESOURCE</a> flag.
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a>*</b>
     * 
     * Pointer to a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D10ShaderResourceView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc) {
        result := ComCall(75, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D10ShaderResourceView(ppSRView)
    }

    /**
     * Create a render-target view for accessing resource data.
     * @param {ID3D10Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">resource</a> that will serve as the render target. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_RENDER_TARGET</a> flag.
     * @param {Pointer<D3D10_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * Pointer to a render-target-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a view that accesses mipmap level 0 of the entire resource (using the format the resource was created with).
     * @returns {ID3D10RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc) {
        result := ComCall(76, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppRTView := 0, "HRESULT")
        return ID3D10RenderTargetView(ppRTView)
    }

    /**
     * Create a depth-stencil view for accessing resource data.
     * @param {ID3D10Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">resource</a> that will serve as the depth-stencil surface. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_DEPTH_STENCIL</a> flag.
     * @param {Pointer<D3D10_DEPTH_STENCIL_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_view_desc">D3D10_DEPTH_STENCIL_VIEW_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_view_desc">D3D10_DEPTH_STENCIL_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a view that accesses mipmap level 0 of the entire resource (using the format the resource was created with).
     * @returns {ID3D10DepthStencilView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc) {
        result := ComCall(77, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppDepthStencilView := 0, "HRESULT")
        return ID3D10DepthStencilView(ppDepthStencilView)
    }

    /**
     * Create an input-layout object to describe the input-buffer data for the input-assembler stage.
     * @param {Pointer<D3D10_INPUT_ELEMENT_DESC>} pInputElementDescs Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_input_element_desc">D3D10_INPUT_ELEMENT_DESC</a>*</b>
     * 
     * An array of the input-assembler stage input data types; each type is described by an element description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_input_element_desc">D3D10_INPUT_ELEMENT_DESC</a>).
     * @param {Integer} NumElements Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of input-data types in the array of input-elements.
     * @param {Pointer<Void>} pShaderBytecodeWithInputSignature Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>. The compiled shader code contains a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-signatures">input signature</a> which is validated against the array of elements. See remarks.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled shader.
     * @returns {ID3D10InputLayout} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout</a>**</b>
     * 
     * A pointer to the input-layout object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10inputlayout">ID3D10InputLayout Interface</a>). To validate the other input parameters, set this pointer to be <b>NULL</b> and verify that the method returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength) {
        pShaderBytecodeWithInputSignatureMarshal := pShaderBytecodeWithInputSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(78, this, "ptr", pInputElementDescs, "uint", NumElements, pShaderBytecodeWithInputSignatureMarshal, pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", &ppInputLayout := 0, "HRESULT")
        return ID3D10InputLayout(ppInputLayout)
    }

    /**
     * Create a vertex-shader object from a compiled shader.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled vertex shader.
     * @returns {ID3D10VertexShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10vertexshader">ID3D10VertexShader Interface</a>. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(79, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppVertexShader := 0, "HRESULT")
        return ID3D10VertexShader(ppVertexShader)
    }

    /**
     * Create a geometry shader.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled geometry shader.
     * @returns {ID3D10GeometryShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader Interface</a>.  If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(80, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D10GeometryShader(ppGeometryShader)
    }

    /**
     * Creates a geometry shader that can write to streaming output buffers.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled geometry shader for a standard geometry shader plus stream output. For info on how to get this pointer, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * 
     * To create the stream output without using a geometry shader, pass a pointer to the output signature for the prior stage. To obtain this output signature, call the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dgetoutputsignatureblob">D3DGetOutputSignatureBlob</a> compiler function. You can also pass a pointer to the compiled <a href="https://docs.microsoft.com/previous-versions/bb205146(v=vs.85)">vertex shader</a> that is used in the prior stage. This compiled shader provides the output signature for the data.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled geometry shader.
     * @param {Pointer<D3D10_SO_DECLARATION_ENTRY>} pSODeclaration Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_so_declaration_entry">D3D10_SO_DECLARATION_ENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_so_declaration_entry">D3D10_SO_DECLARATION_ENTRY</a> array. Cannot be <b>NULL</b> if <i>NumEntries</i>&gt; 0.
     * @param {Integer} NumEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the array pointed to by <i>pSODeclaration</i>. Minimum 0, maximum 64.
     * @param {Integer} OutputStreamStride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size, in bytes, of each element in the array pointed to by <i>pSODeclaration</i>. This parameter is only used when the output slot is 0 for all entries in <i>pSODeclaration</i>.
     * @returns {ID3D10GeometryShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10geometryshader">ID3D10GeometryShader Interface</a>. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, OutputStreamStride) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(81, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, "uint", OutputStreamStride, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D10GeometryShader(ppGeometryShader)
    }

    /**
     * Create a pixel shader.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled pixel shader.
     * @returns {ID3D10PixelShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10pixelshader">ID3D10PixelShader Interface</a>. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(82, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppPixelShader := 0, "HRESULT")
        return ID3D10PixelShader(ppPixelShader)
    }

    /**
     * Create a blend-state object that encapsules blend state for the output-merger stage.
     * @param {Pointer<D3D10_BLEND_DESC>} pBlendStateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>*</b>
     * 
     * Pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>).
     * @returns {ID3D10BlendState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>**</b>
     * 
     * Address of a pointer to the blend-state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createblendstate
     */
    CreateBlendState(pBlendStateDesc) {
        result := ComCall(83, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D10BlendState(ppBlendState)
    }

    /**
     * Create a depth-stencil state object that encapsulates depth-stencil test information for the output-merger stage.
     * @param {Pointer<D3D10_DEPTH_STENCIL_DESC>} pDepthStencilDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>).
     * @returns {ID3D10DepthStencilState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>**</b>
     * 
     * Address of a pointer to the depth-stencil state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc) {
        result := ComCall(84, this, "ptr", pDepthStencilDesc, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D10DepthStencilState(ppDepthStencilState)
    }

    /**
     * Create a rasterizer state object that tells the rasterizer stage how to behave.
     * @param {Pointer<D3D10_RASTERIZER_DESC>} pRasterizerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>*</b>
     * 
     * Pointer to a rasterizer state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
     * @returns {ID3D10RasterizerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>**</b>
     * 
     * Address of a pointer to the rasterizer state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc) {
        result := ComCall(85, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D10RasterizerState(ppRasterizerState)
    }

    /**
     * Create a sampler-state object that encapsulates sampling information for a texture.
     * @param {Pointer<D3D10_SAMPLER_DESC>} pSamplerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>*</b>
     * 
     * Pointer to a sampler state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>).
     * @returns {ID3D10SamplerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>**</b>
     * 
     * Address of a pointer to the sampler state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc) {
        result := ComCall(86, this, "ptr", pSamplerDesc, "ptr*", &ppSamplerState := 0, "HRESULT")
        return ID3D10SamplerState(ppSamplerState)
    }

    /**
     * This interface encapsulates methods for querying information from the GPU.
     * @param {Pointer<D3D10_QUERY_DESC>} pQueryDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>).
     * @returns {ID3D10Query} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10query">ID3D10Query</a>**</b>
     * 
     * Address of a pointer to the query object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10query">ID3D10Query Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createquery
     */
    CreateQuery(pQueryDesc) {
        result := ComCall(87, this, "ptr", pQueryDesc, "ptr*", &ppQuery := 0, "HRESULT")
        return ID3D10Query(ppQuery)
    }

    /**
     * Creates a predicate.
     * @param {Pointer<D3D10_QUERY_DESC>} pPredicateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description where the type of query must be a D3D10_QUERY_SO_OVERFLOW_PREDICATE or D3D10_QUERY_OCCLUSION_PREDICATE (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>).
     * @returns {ID3D10Predicate} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate</a>**</b>
     * 
     * Address of a pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createpredicate
     */
    CreatePredicate(pPredicateDesc) {
        result := ComCall(88, this, "ptr", pPredicateDesc, "ptr*", &ppPredicate := 0, "HRESULT")
        return ID3D10Predicate(ppPredicate)
    }

    /**
     * Create a counter object for measuring GPU performance.
     * @param {Pointer<D3D10_COUNTER_DESC>} pCounterDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_desc">D3D10_COUNTER_DESC</a>*</b>
     * 
     * Pointer to a counter description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_desc">D3D10_COUNTER_DESC</a>).
     * @returns {ID3D10Counter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10counter">ID3D10Counter</a>**</b>
     * 
     * Address of a pointer to a counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10counter">ID3D10Counter Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-createcounter
     */
    CreateCounter(pCounterDesc) {
        result := ComCall(89, this, "ptr", pCounterDesc, "ptr*", &ppCounter := 0, "HRESULT")
        return ID3D10Counter(ppCounter)
    }

    /**
     * Get the support of a given format on the installed video device.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> enumeration that describes a format for which to check for support.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A bitfield of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_format_support">D3D10_FORMAT_SUPPORT</a> enumeration values describing how the specified format is supported on the installed device. 
     *         The values are ORed together.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-checkformatsupport
     */
    CheckFormatSupport(Format) {
        result := ComCall(90, this, "int", Format, "uint*", &pFormatSupport := 0, "HRESULT")
        return pFormatSupport
    }

    /**
     * Get the number of quality levels available during multisampling.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The texture format. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     * @param {Integer} SampleCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of samples during multisampling.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of quality levels supported by the adapter. See remarks.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount) {
        result := ComCall(91, this, "int", Format, "uint", SampleCount, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
    }

    /**
     * Get a counter's information.
     * @param {Pointer<D3D10_COUNTER_INFO>} pCounterInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_info">D3D10_COUNTER_INFO</a>*</b>
     * 
     * Pointer to counter information (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_info">D3D10_COUNTER_INFO</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-checkcounterinfo
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(92, this, "ptr", pCounterInfo)
    }

    /**
     * Get the type, name, units of measure, and a description of an existing counter.
     * @param {Pointer<D3D10_COUNTER_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_desc">D3D10_COUNTER_DESC</a>*</b>
     * 
     * Pointer to a counter description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_counter_desc">D3D10_COUNTER_DESC</a>). Specifies which counter information is to be retrieved about.
     * @param {Pointer<Integer>} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter_type">D3D10_COUNTER_TYPE</a>*</b>
     * 
     * Pointer to the data type of a counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_counter_type">D3D10_COUNTER_TYPE</a>). Specifies the data type of the counter being retrieved.
     * @param {Pointer<Integer>} pActiveCounters Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to the number of hardware counters that are needed for this counter type to be created. All instances of the same counter type use the same hardware counters.
     * @param {PSTR} szName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * String to be filled with a brief name for the counter. May be <b>NULL</b> if the application is not interested in the name of the counter.
     * @param {Pointer<Integer>} pNameLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Length of the string returned to szName. Can be <b>NULL</b>.
     * @param {PSTR} szUnits Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Name of the units a counter measures, provided the memory the pointer points to has enough room to hold the string. Can be <b>NULL</b>. The returned string will always be in English.
     * @param {Pointer<Integer>} pUnitsLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Length of the string returned to szUnits. Can be <b>NULL</b>.
     * @param {PSTR} szDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * A description of the counter, provided the memory the pointer points to has enough room to hold the string. Can be <b>NULL</b>. The returned string will always be in English.
     * @param {Pointer<Integer>} pDescriptionLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Length of the string returned to szDescription. Can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-checkcounter
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

        result := ComCall(93, this, "ptr", pDesc, pTypeMarshal, pType, pActiveCountersMarshal, pActiveCounters, "ptr", szName, pNameLengthMarshal, pNameLength, "ptr", szUnits, pUnitsLengthMarshal, pUnitsLength, "ptr", szDescription, pDescriptionLengthMarshal, pDescriptionLength, "HRESULT")
        return result
    }

    /**
     * Get the flags used during the call to create the device with D3D10CreateDevice.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A bitfield containing the flags used to create the device. See <a href="/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(94, this, "uint")
        return result
    }

    /**
     * Give a device access to a shared resource created on a different Direct3d device.
     * @param {HANDLE} hResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A resource handle. See remarks.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) for the resource interface. See remarks.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Address of a pointer to the resource we are gaining access to.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-opensharedresource
     */
    OpenSharedResource(hResource, ReturnedInterface) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(95, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }

    /**
     * This method is not implemented.
     * @remarks
     * 
     * This method is not implemented, and should not be used.
     * 
     * 
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Not applicable
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Not applicable
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-settextfiltersize
     */
    SetTextFilterSize(Width, Height) {
        ComCall(96, this, "uint", Width, "uint", Height)
    }

    /**
     * This method is not implemented.
     * @remarks
     * 
     * This method is not implemented, and should not be used.
     * 
     * 
     * @param {Pointer<Integer>} pWidth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Not applicable
     * @param {Pointer<Integer>} pHeight Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Not applicable
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10device-gettextfiltersize
     */
    GetTextFilterSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "uint*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "uint*" : "ptr"

        ComCall(97, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight)
    }
}
