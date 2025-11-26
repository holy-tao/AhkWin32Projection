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
     * Sets the constant buffers used by the vertex shader pipeline stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader than the maximum constant buffer size that is supported by shaders (4096 constants – 4\*32-bit components each).  When you bind such a large buffer, the shader can access only the first 4096 4\*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.
     *         
     * 
     * If the application wants the shader to access other parts of the buffer, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-vssetconstantbuffers1">VSSetConstantBuffers1</a> method instead.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers
     */
    VSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(7, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an array of shader resources to the pixel shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a rendertarget, then this API will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources
     */
    PSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(8, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Sets a pixel shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * Set ppClassInstances to <b>NULL</b> if no interfaces are used in the shader. If it is not <b>NULL</b>, the number of class instances must match the number of interfaces used in the shader. Furthermore, each interface pointer must have a corresponding class instance or the assigned shader will be disabled.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11PixelShader} pPixelShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>*</b>
     * 
     * Pointer to a pixel shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-pssetshader
     */
    PSSetShader(pPixelShader, ppClassInstances, NumClassInstances) {
        ComCall(9, this, "ptr", pPixelShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
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
     * <td>D3D11_FILTER_MIN_MAG_MIP_LINEAR</td>
     * </tr>
     * <tr>
     * <td>AddressU</td>
     * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
     * </tr>
     * <tr>
     * <td>AddressV</td>
     * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
     * </tr>
     * <tr>
     * <td>AddressW</td>
     * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
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
     * <td>D3D11_COMPARISON_NEVER</td>
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-pssetsamplers
     */
    PSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(10, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Set a vertex shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * 
     * @param {ID3D11VertexShader} pVertexShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>*</b>
     * 
     * Pointer to a vertex shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vssetshader
     */
    VSSetShader(pVertexShader, ppClassInstances, NumClassInstances) {
        ComCall(11, this, "ptr", pVertexShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * Draw indexed, non-instanced primitives.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline.
     * 
     * If the sum of both indices is negative, the result of the function call is undefined.
     * 
     * 
     * @param {Integer} IndexCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of indices to draw.
     * @param {Integer} StartIndexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The location of the first index read by the GPU from the index buffer.
     * @param {Integer} BaseVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value added to each index before reading a vertex from the vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawindexed
     */
    DrawIndexed(IndexCount, StartIndexLocation, BaseVertexLocation) {
        ComCall(12, this, "uint", IndexCount, "uint", StartIndexLocation, "int", BaseVertexLocation)
    }

    /**
     * Draw non-indexed, non-instanced primitives.
     * @remarks
     * 
     * <b>Draw</b> submits work to the rendering pipeline.
     * 
     * The vertex data for a draw call normally comes from a vertex buffer that is bound to the pipeline.
     * 
     * Even without any vertex buffer bound to the pipeline, you can generate your own vertex data in your vertex shader by using the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">SV_VertexID</a> system-value semantic to determine the current vertex that the runtime is processing.
     * 
     * 
     * @param {Integer} VertexCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of vertices to draw.
     * @param {Integer} StartVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first vertex, which is usually an offset in a vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-draw
     */
    Draw(VertexCount, StartVertexLocation) {
        ComCall(13, this, "uint", VertexCount, "uint", StartVertexLocation)
    }

    /**
     * Gets a pointer to the data contained in a subresource, and denies the GPU access to that subresource.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface.
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index number of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-subresources">subresource</a>.
     * @param {Integer} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP</a>-typed value that specifies the CPU's read and write permissions for a resource.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map_flag">Flag</a> that specifies what the CPU does when the GPU is busy. This flag is optional.
     * @returns {D3D11_MAPPED_SUBRESOURCE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_mapped_subresource">D3D11_MAPPED_SUBRESOURCE</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_mapped_subresource">D3D11_MAPPED_SUBRESOURCE</a> structure for the mapped subresource.
     *             See the Remarks section regarding NULL pointers.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-map
     */
    Map(pResource, Subresource, MapType, MapFlags) {
        pMappedResource := D3D11_MAPPED_SUBRESOURCE()
        result := ComCall(14, this, "ptr", pResource, "uint", Subresource, "int", MapType, "uint", MapFlags, "ptr", pMappedResource, "HRESULT")
        return pMappedResource
    }

    /**
     * Invalidate the pointer to a resource and reenable the GPU's access to that resource.
     * @remarks
     * 
     * For info about how to use <b>Unmap</b>, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/how-to--use-dynamic-resources">How to: Use dynamic resources</a>.
     *       
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface.
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A subresource to be unmapped.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-unmap
     */
    Unmap(pResource, Subresource) {
        ComCall(15, this, "ptr", pResource, "uint", Subresource)
    }

    /**
     * Sets the constant buffers used by the pixel shader pipeline stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * The Direct3D 11.1 runtime, which is available on Windows 8 and later operating systems, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader
     *           than the maximum constant buffer size that is supported by shaders (4096 constants – 4*32-bit components each).
     *           When you bind such a large buffer, the shader can access only the first 4096 4*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.
     *         
     * 
     * To enable the shader to access other parts of the buffer, call
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1">PSSetConstantBuffers1</a> instead of <b>PSSetConstantBuffers</b>.
     *           <b>PSSetConstantBuffers1</b> has additional parameters <i>pFirstConstant</i> and <i>pNumConstants</i>.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers
     */
    PSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(16, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an input-layout object to the input-assembler stage.
     * @remarks
     * 
     * Input-layout objects describe how vertex buffer data is streamed into the IA pipeline stage. To create an input-layout object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createinputlayout">ID3D11Device::CreateInputLayout</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {ID3D11InputLayout} pInputLayout Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>*</b>
     * 
     * A pointer to the input-layout object (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>), which describes the input buffers that will be read by the IA stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iasetinputlayout
     */
    IASetInputLayout(pInputLayout) {
        ComCall(17, this, "ptr", pInputLayout)
    }

    /**
     * Bind an array of vertex buffers to the input-assembler stage.
     * @remarks
     * 
     * For info about creating vertex buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-vertex-how-to">How to: Create a Vertex Buffer</a>.
     *         
     * 
     * Calling this method using a buffer that is currently bound for writing (that is, bound to the stream output pipeline stage) will effectively bind <b>NULL</b> instead because a buffer can't be bound as both an input and an output at the same time.
     *         
     * 
     * The debug layer will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will not prevent invalid data from being used by the runtime.
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first input slot for binding. The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot. The maximum of 16 or 32 input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available; the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">maximum number of input slots depends on the feature level</a>.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of vertex buffers in the array. The number of buffers (plus the starting slot) can't exceed the total number of IA-stage input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an array of vertex buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>). The vertex buffers must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_VERTEX_BUFFER</a> flag.
     * @param {Pointer<Integer>} pStrides Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of stride values; one stride value for each buffer in the vertex-buffer array. Each stride is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param {Pointer<Integer>} pOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of offset values; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iasetvertexbuffers
     */
    IASetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(18, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * Bind an index buffer to the input-assembler stage.
     * @remarks
     * 
     * For information about creating index buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-index-how-to">How to: Create an Index Buffer</a>.
     *         
     * 
     * Calling this method using a buffer that is currently bound for writing (i.e. bound to the stream output pipeline stage) will effectively bind
     *           <b>NULL</b> instead because a buffer cannot be bound as both an input and an output at the same time.
     *         
     * 
     * The debug layer will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will
     *           not prevent invalid data from being used by the runtime.
     *         
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11Buffer} pIndexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> object, that contains indices. The index buffer must have been created with
     *             the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_INDEX_BUFFER</a> flag.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> that specifies the format of the data in the index buffer. The only formats allowed for index
     *             buffer data are 16-bit (DXGI_FORMAT_R16_UINT) and 32-bit (DXGI_FORMAT_R32_UINT) integers.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset (in bytes) from the start of the index buffer to the first index to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iasetindexbuffer
     */
    IASetIndexBuffer(pIndexBuffer, Format, Offset) {
        ComCall(19, this, "ptr", pIndexBuffer, "int", Format, "uint", Offset)
    }

    /**
     * Draw indexed, instanced primitives.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline.
     * 
     * Instancing may extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be to draw the same object with different positions and colors. Instancing requires multiple vertex buffers: at least one for per-vertex data and a second buffer for per-instance data.
     * 
     * The second buffer is needed only if the input layout that you use has elements that use [D3D11_INPUT_PER_INSTANCE_DATA](./ne-d3d11-d3d11_input_classification.md) as the input element classification.uffer for per-instance data.
     * 
     * 
     * @param {Integer} IndexCountPerInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/winprog/windows-data-types">UINT</a></b>
     * 
     * Number of indices read from the index buffer for each instance.
     * @param {Integer} InstanceCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/winprog/windows-data-types">UINT</a></b>
     * 
     * Number of instances to draw.
     * @param {Integer} StartIndexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/winprog/windows-data-types">UINT</a></b>
     * 
     * The location of the first index read by the GPU from the index buffer.
     * @param {Integer} BaseVertexLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/winprog/windows-data-types">INT</a></b>
     * 
     * A value added to each index before reading a vertex from the vertex buffer.
     * @param {Integer} StartInstanceLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/winprog/windows-data-types">UINT</a></b>
     * 
     * A value added to each index before reading per-instance data from a vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstanced
     */
    DrawIndexedInstanced(IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation) {
        ComCall(20, this, "uint", IndexCountPerInstance, "uint", InstanceCount, "uint", StartIndexLocation, "int", BaseVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Draw non-indexed, instanced primitives.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline.
     * 
     * Instancing may extend performance by reusing the same geometry to draw multiple objects in a scene. One example of instancing could be 
     *       to draw the same object with different positions and colors.
     * 
     * The vertex data for an instanced draw call normally comes from a vertex buffer that is bound to the pipeline. 
     *       However, you could also provide the vertex data from a shader that has instanced data identified with a system-value semantic (SV_InstanceID).
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
     * A value added to each index before reading per-instance data from a vertex buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawinstanced
     */
    DrawInstanced(VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation) {
        ComCall(21, this, "uint", VertexCountPerInstance, "uint", InstanceCount, "uint", StartVertexLocation, "uint", StartInstanceLocation)
    }

    /**
     * Sets the constant buffers used by the geometry shader pipeline stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * You can't use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionconstantbuffer">ID3D11ShaderReflectionConstantBuffer</a> interface to get information about what is currently bound to the pipeline in the device context. But you can use <b>ID3D11ShaderReflectionConstantBuffer</b> to get information from a compiled shader. For example, you can use <b>ID3D11ShaderReflectionConstantBuffer</b> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable">ID3D11ShaderReflectionVariable</a> to determine the slot in which a geometry shader expects a constant buffer. You can then pass this slot number to <b>GSSetConstantBuffers</b> to set the constant buffer. You can call the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d11reflect">D3D11Reflect</a> function to retrieve the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflection">ID3D11ShaderReflection</a> interface and then call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconstantbufferbyname">ID3D11ShaderReflection::GetConstantBufferByName</a> to get a pointer to <b>ID3D11ShaderReflectionConstantBuffer</b>.
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader than the maximum constant buffer size that is supported by shaders (4096 constants – 4*32-bit components each).  When you bind such a large buffer, the shader can access only the first 4096 4*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.  
     * 
     * If the application wants the shader to access other parts of the buffer, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-gssetconstantbuffers1">GSSetConstantBuffers1</a> method instead.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gssetconstantbuffers
     */
    GSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(22, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Set a geometry shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * 
     * @param {ID3D11GeometryShader} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>*</b>
     * 
     * Pointer to a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gssetshader
     */
    GSSetShader(pShader, ppClassInstances, NumClassInstances) {
        ComCall(23, this, "ptr", pShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * Bind information about the primitive type, and data order that describes input data for the input assembler stage.
     * @remarks
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} Topology Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff476189(v=vs.85)">D3D11_PRIMITIVE_TOPOLOGY</a></b>
     * 
     * The type of primitive and ordering of the primitive data (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff476189(v=vs.85)">D3D11_PRIMITIVE_TOPOLOGY</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iasetprimitivetopology
     */
    IASetPrimitiveTopology(Topology) {
        ComCall(24, this, "int", Topology)
    }

    /**
     * Bind an array of shader resources to the vertex-shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a rendertarget, then this API will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (range is from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources (range is from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources
     */
    VSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(25, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
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
     * D3D11_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D11_COMPARISON_NEVER;
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vssetsamplers
     */
    VSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(26, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Mark the beginning of a series of commands.
     * @remarks
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> to mark the ending of the series of commands.
     * 
     * 
     * @param {ID3D11Asynchronous} pAsync Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a> interface.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-begin
     */
    Begin(pAsync) {
        ComCall(27, this, "ptr", pAsync)
    }

    /**
     * Mark the end of a series of commands.
     * @remarks
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> to mark the beginning of the series of commands.
     * 
     * 
     * @param {ID3D11Asynchronous} pAsync Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a> interface.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-end
     */
    End(pAsync) {
        ComCall(28, this, "ptr", pAsync)
    }

    /**
     * Get data from the graphics processing unit (GPU) asynchronously.
     * @param {ID3D11Asynchronous} pAsync Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a> interface for the object about which <b>GetData</b> retrieves data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Address of memory that will receive the data. If <b>NULL</b>, <b>GetData</b> will be used only to check status. The type of data output depends on the type of asynchronous interface.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data to retrieve or 0. Must be 0 when <i>pData</i> is <b>NULL</b>.
     * @param {Integer} GetDataFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional flags. Can be 0 or any combination of the flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_async_getdata_flag">D3D11_ASYNC_GETDATA_FLAG</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>. A return value of S_OK indicates that the data at <i>pData</i> is available for the calling application to access. A return value of S_FALSE indicates that the data is not yet available. If the data is not yet available, the application must call <b>GetData</b> until the data is available.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-getdata
     */
    GetData(pAsync, pData, DataSize, GetDataFlags) {
        result := ComCall(29, this, "ptr", pAsync, "ptr", pData, "uint", DataSize, "uint", GetDataFlags, "HRESULT")
        return result
    }

    /**
     * Set a rendering predicate.
     * @remarks
     * 
     * The predicate must be in the "issued" or "signaled" state to be used for predication. While the predicate is set for predication, calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> are invalid.
     * 
     * Use this method to denote that subsequent rendering and resource manipulation commands are not actually performed if the resulting predicate data of the predicate is equal to the <i>PredicateValue</i>. However, some predicates are only hints, so they may not actually prevent operations from being performed. 
     * 
     * The primary usefulness of predication is to allow an application to issue rendering and resource manipulation commands without taking the performance hit of spinning, waiting for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> to return. So, predication can occur while <b>ID3D11DeviceContext::GetData</b> returns <b>S_FALSE</b>. Another way to think of it: an application can also use predication as a fallback, if it is possible that <b>ID3D11DeviceContext::GetData</b> returns <b>S_FALSE</b>. If <b>ID3D11DeviceContext::GetData</b> returns <b>S_OK</b>, the application can skip calling the rendering and resource manipulation commands manually with it's own application logic.
     * 
     * Rendering and resource manipulation commands for Direct3D 11 include these Draw, Dispatch, Copy, Update, Clear, Generate, and Resolve operations.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-draw">Draw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawauto">DrawAuto</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexed">DrawIndexed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstanced">DrawIndexedInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstancedindirect">DrawIndexedInstancedIndirect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstanced">DrawInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstancedindirect">DrawInstancedIndirect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">Dispatch</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatchindirect">DispatchIndirect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">CopyResource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copystructurecount">CopyStructureCount</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">CopySubresourceRegion</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">CopySubresourceRegion1</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytiles">CopyTiles</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytilemappings">CopyTileMappings</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">UpdateSubresource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">UpdateSubresource1</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetiles">UpdateTiles</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetilemappings">UpdateTileMappings</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearrendertargetview">ClearRenderTargetView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewfloat">ClearUnorderedAccessViewFloat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewuint">ClearUnorderedAccessViewUint</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-clearview">ClearView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview">ClearDepthStencilView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">GenerateMips</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource">ResolveSubresource</a>
     * </li>
     * </ul>
     * You can set a rendering predicate on an immediate or a deferred context. For info about immediate and deferred contexts, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-render">Immediate and Deferred Rendering</a>.
     * 
     * 
     * @param {ID3D11Predicate} pPredicate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a> interface that represents the rendering predicate. A <b>NULL</b> value indicates "no" predication; in this case, the value of <i>PredicateValue</i> is irrelevant but will be preserved for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getpredication">ID3D11DeviceContext::GetPredication</a>.
     * @param {BOOL} PredicateValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, rendering will be affected by when the predicate's conditions are met. If <b>FALSE</b>, rendering will be affected when the conditions are not met.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-setpredication
     */
    SetPredication(pPredicate, PredicateValue) {
        ComCall(30, this, "ptr", pPredicate, "int", PredicateValue)
    }

    /**
     * Bind an array of shader resources to the geometry shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a render target, then the method will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources
     */
    GSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(31, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
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
     * D3D11_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D11_COMPARISON_NEVER;
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gssetsamplers
     */
    GSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(32, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Bind one or more render targets atomically and the depth-stencil buffer to the output-merger stage.
     * @remarks
     * 
     * The maximum number of active render targets a device can have active at any given time is set by a #define in D3D11.h called 
     *       <b>D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT</b>. It is invalid to try to set the same subresource to multiple render target slots. 
     *       Any render targets not defined by this call are set to <b>NULL</b>.
     * 
     * If any subresources are also currently bound for reading in a different stage or writing (perhaps in a different part of the pipeline), 
     *       those bind points will be set to <b>NULL</b>, in order to prevent the same subresource from being read and written simultaneously in a single rendering operation.
     * 
     * The method will hold a reference to the interfaces passed in.
     *         This differs from the device state behavior in Direct3D 10.
     *       
     * 
     * If the render-target views were created from an array resource type, all of the render-target views must have the same array size.  
     *       This restriction also applies to the depth-stencil view, its array size must match that of the render-target views being bound.
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
     * Number of render targets to bind (ranges between 0 and <b>D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT</b>). If this parameter is nonzero, the number of entries in the array to which <i>ppRenderTargetViews</i> points must equal the number in this parameter.
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a> that represent the render targets to bind to the device. 
     *         If this parameter is <b>NULL</b> and <i>NumViews</i> is 0, no render targets are bound.
     * @param {ID3D11DepthStencilView} pDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a> that represents the depth-stencil view to bind to the device. 
     *         If this parameter is <b>NULL</b>, the depth-stencil view is not bound.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets
     */
    OMSetRenderTargets(NumViews, ppRenderTargetViews, pDepthStencilView) {
        ComCall(33, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView)
    }

    /**
     * Binds resources to the output-merger stage.
     * @remarks
     * 
     * For pixel shaders, the render targets and unordered-access views share the same resource slots when being written out. This means that UAVs must be
     *           given an offset so that they are placed in the slots after the render target views that are being bound.
     *         
     * 
     * <div class="alert"><b>Note</b>  RTVs, DSV, and UAVs cannot be set independently; they all need to be set at the same time.</div>
     * <div> </div>
     * Two RTVs conflict if they share a subresource (and therefore share the same resource).
     * 
     * Two UAVs conflict if they share a subresource (and therefore share the same resource).
     * 
     * An RTV conflicts with a UAV if they share a subresource or share a bind point.
     * 
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> operates properly in the following situations:
     *           
     * 
     * <ol>
     * <li>
     * <i>NumRTVs</i> != D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL and <i>NumUAVs</i> != D3D11_KEEP_UNORDERED_ACCESS_VIEWS
     *                 
     * 
     * The following conditions must be true for <b>OMSetRenderTargetsAndUnorderedAccessViews</b> to succeed and for the runtime to pass the bind information to the driver:
     *                 
     * 
     * <ul>
     * <li><i>NumRTVs</i> &lt;= 8
     *               </li>
     * <li><i>UAVStartSlot</i> &gt;= <i>NumRTVs</i></li>
     * <li><i>UAVStartSlot</i> + <i>NumUAVs</i> &lt;= 8
     *               </li>
     * <li>There must be no conflicts in the set of all <i>ppRenderTargetViews</i> and <i>ppUnorderedAccessViews</i>.
     *               </li>
     * <li><i>ppDepthStencilView</i> must match the render-target views. For more information about resource views, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Introduction to a Resource in Direct3D 11</a>.
     *               </li>
     * </ul>
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> performs the following tasks:
     *               
     * 
     * <ul>
     * <li>Unbinds all currently bound conflicting resources (stream-output target resources (SOTargets), compute shader (CS) UAVs, shader-resource views (SRVs)).</li>
     * <li>Binds <i>ppRenderTargetViews</i>, <i>ppDepthStencilView</i>, and <i>ppUnorderedAccessViews</i>.
     *               </li>
     * </ul>
     * </li>
     * <li>
     * <i>NumRTVs</i> == D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL
     *                 
     * 
     * In this situation, <b>OMSetRenderTargetsAndUnorderedAccessViews</b> binds only UAVs.
     *                 
     * 
     * The following conditions must be true for <b>OMSetRenderTargetsAndUnorderedAccessViews</b> to succeed and for the runtime to pass the bind information to the driver:
     *                 
     * 
     * <ul>
     * <li><i>UAVStartSlot</i> + <i>NumUAVs</i> &lt;= 8
     *               </li>
     * <li>There must be no conflicts in <i>ppUnorderedAccessViews</i>.
     *               </li>
     * </ul>
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> unbinds the following items:
     *               
     * 
     * <ul>
     * <li>All RTVs in slots &gt;= <i>UAVStartSlot</i></li>
     * <li>All RTVs that conflict with any UAVs in <i>ppUnorderedAccessViews</i></li>
     * <li>All currently bound resources (SOTargets, CS UAVs, SRVs) that conflict with <i>ppUnorderedAccessViews</i></li>
     * </ul>
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> binds <i>ppUnorderedAccessViews</i>.
     *             
     * 
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> ignores <i>ppDepthStencilView</i>, and the current depth-stencil view remains bound.
     *             
     * 
     * </li>
     * <li>
     * <i>NumUAVs</i> == D3D11_KEEP_UNORDERED_ACCESS_VIEWS
     *                 
     * 
     * In this situation, <b>OMSetRenderTargetsAndUnorderedAccessViews</b> binds only RTVs and DSV.
     *                 
     * 
     * The following conditions must be true for <b>OMSetRenderTargetsAndUnorderedAccessViews</b> to succeed and for the runtime to pass the bind information to the driver:
     *                 
     * 
     * <ul>
     * <li><i>NumRTVs</i> &lt;= 8
     *               </li>
     * <li>There must be no conflicts in <i>ppRenderTargetViews</i>.
     *               </li>
     * <li><i>ppDepthStencilView</i> must match the render-target views. For more information about resource views, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Introduction to a Resource in Direct3D 11</a>.
     *               </li>
     * </ul>
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> unbinds the following items:
     *               
     * 
     * <ul>
     * <li>All UAVs in slots &lt; <i>NumRTVs</i></li>
     * <li>All UAVs that conflict with any RTVs in <i>ppRenderTargetViews</i></li>
     * <li>All currently bound resources (SOTargets, CS UAVs, SRVs) that conflict with <i>ppRenderTargetViews</i></li>
     * </ul>
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> binds <i>ppRenderTargetViews</i> and <i>ppDepthStencilView</i>.
     *             
     * 
     * <b>OMSetRenderTargetsAndUnorderedAccessViews</b> ignores <i>UAVStartSlot</i>.
     *             
     * 
     * </li>
     * </ol>
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} NumRTVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of render targets to bind (ranges between 0 and <b>D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT</b>). If this parameter is nonzero, the number of entries in the array to which <i>ppRenderTargetViews</i> points must equal the number in this parameter. If you set <i>NumRTVs</i> to D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL (0xffffffff), this method does not modify the currently bound render-target views (RTVs) and also does not modify depth-stencil view (DSV).
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>s that represent the render targets to bind to the device.
     *             If this parameter is <b>NULL</b> and <i>NumRTVs</i> is 0, no render targets are bound.
     * @param {ID3D11DepthStencilView} pDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a> that represents the depth-stencil view to bind to the device.
     *             If this parameter is <b>NULL</b>, the depth-stencil view is not bound.
     * @param {Integer} UAVStartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin setting unordered-access views (ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - 1).
     * 
     * For the Direct3D 11.1 runtime, which is available starting with Windows 8, this value can range from 0 to D3D11_1_UAV_SLOT_COUNT - 1. D3D11_1_UAV_SLOT_COUNT is defined as 64.
     *             
     * 
     * For pixel shaders, <i>UAVStartSlot</i> should be equal to the number of render-target views being bound.
     * @param {Integer} NumUAVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of unordered-access views (UAVs) in <i>ppUnorderedAccessViews</i>. If you set <i>NumUAVs</i> to D3D11_KEEP_UNORDERED_ACCESS_VIEWS (0xffffffff), this method does not modify the currently bound unordered-access views.
     *             
     * 
     * For the Direct3D 11.1 runtime, which is available starting with Windows 8, this value can range from 0 to D3D11_1_UAV_SLOT_COUNT - <i>UAVStartSlot</i>.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>s that represent the unordered-access views to bind to the device.
     *             If this parameter is <b>NULL</b> and <i>NumUAVs</i> is 0, no unordered-access views are bound.
     * @param {Pointer<Integer>} pUAVInitialCounts Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of append and consume buffer offsets. A value of -1 indicates to keep the current offset. Any other values set the hidden counter
     *             for that appendable and consumable UAV. <i>pUAVInitialCounts</i> is  relevant only for UAVs that were created with either
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_buffer_uav_flag">D3D11_BUFFER_UAV_FLAG_APPEND</a> or <b>D3D11_BUFFER_UAV_FLAG_COUNTER</b> specified
     *             when the UAV was created; otherwise, the argument is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews
     */
    OMSetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, pDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        pUAVInitialCountsMarshal := pUAVInitialCounts is VarRef ? "uint*" : "ptr"

        ComCall(34, this, "uint", NumRTVs, "ptr*", ppRenderTargetViews, "ptr", pDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews, pUAVInitialCountsMarshal, pUAVInitialCounts)
    }

    /**
     * Set the blend state of the output-merger stage.
     * @remarks
     * 
     * Blend state is used by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> to determine how to blend together two RGB pixel values and two alpha values. The two RGB pixel values and two alpha values are the RGB pixel value and alpha value that the pixel shader outputs and the RGB pixel value and alpha value already in the output render target. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> controls the data source that the blending stage uses to modulate values for the pixel shader, render target, or both. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">blend operation</a> controls how the blending stage mathematically combines these modulated values.
     * 
     * To create a blend-state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createblendstate">ID3D11Device::CreateBlendState</a>.
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
     * <td>IndependentBlendEnable</td>
     * <td><b>FALSE</b></td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].BlendEnable</td>
     * <td><b>FALSE</b></td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].SrcBlend</td>
     * <td>D3D11_BLEND_ONE</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].DestBlend</td>
     * <td>D3D11_BLEND_ZERO</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].BlendOp</td>
     * <td>D3D11_BLEND_OP_ADD</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].SrcBlendAlpha</td>
     * <td>D3D11_BLEND_ONE</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].DestBlendAlpha</td>
     * <td>D3D11_BLEND_ZERO</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].BlendOpAlpha</td>
     * <td>D3D11_BLEND_OP_ADD</td>
     * </tr>
     * <tr>
     * <td>RenderTarget[0].RenderTargetWriteMask</td>
     * <td>D3D11_COLOR_WRITE_ENABLE_ALL</td>
     * </tr>
     * </table>
     *  
     * 
     * A sample mask determines which samples get updated in all the active render targets. The mapping of bits in a sample mask to samples in a multisample render target is the responsibility of an individual application. A sample mask is always applied; it is independent of whether multisampling is enabled, and does not depend on whether an application uses multisample render targets.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {ID3D11BlendState} pBlendState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>*</b>
     * 
     * Pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>). Pass <b>NULL</b> for a default blend state. For more info about default blend state, see Remarks.
     * @param {Pointer<Float>} BlendFactor Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>[4]</b>
     * 
     * Array of blend factors, one for each RGBA component. The blend factors modulate values for the pixel shader, render target, or both. If you created  the blend-state object with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND_BLEND_FACTOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND_INV_BLEND_FACTOR</a>, the blending stage uses the non-NULL array of blend factors. If you didn't create the blend-state object with <b>D3D11_BLEND_BLEND_FACTOR</b> or <b>D3D11_BLEND_INV_BLEND_FACTOR</b>, the blending stage does not use the non-NULL array of blend factors; the runtime stores the blend factors, and you can later call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetblendstate">ID3D11DeviceContext::OMGetBlendState</a> to retrieve the blend factors. If you pass <b>NULL</b>, the runtime uses or stores a blend factor equal to { 1, 1, 1, 1 }.
     * @param {Integer} SampleMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 32-bit sample coverage. The default value is 0xffffffff. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate
     */
    OMSetBlendState(pBlendState, BlendFactor, SampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"

        ComCall(35, this, "ptr", pBlendState, BlendFactorMarshal, BlendFactor, "uint", SampleMask)
    }

    /**
     * Sets the depth-stencil state of the output-merger stage.
     * @remarks
     * 
     * To create a depth-stencil state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate">ID3D11Device::CreateDepthStencilState</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {ID3D11DepthStencilState} pDepthStencilState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>*</b>
     * 
     * Pointer to a depth-stencil state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>) to bind to the device. Set this to <b>NULL</b> to use the default state listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>.
     * @param {Integer} StencilRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reference value to perform against when doing a depth-stencil test. See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omsetdepthstencilstate
     */
    OMSetDepthStencilState(pDepthStencilState, StencilRef) {
        ComCall(36, this, "ptr", pDepthStencilState, "uint", StencilRef)
    }

    /**
     * Set the target output buffers for the stream-output stage of the pipeline.
     * @remarks
     * 
     * An offset of -1 will cause the stream output buffer to be appended, continuing after the last location written to the buffer in a previous stream output pass.
     * 
     * Calling this method using a buffer that is currently bound for writing will effectively bind <b>NULL</b> instead because a buffer cannot be bound as both an input and an output at the same time.
     *         
     * 
     * The debug layer will generate a warning whenever a resource is prevented from being bound simultaneously as an input and an output, but this will not prevent invalid data from being used by the runtime.
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of buffer to bind to the device. A maximum of four output buffers can be set. If less than four are defined by the call, the remaining buffer slots are set to <b>NULL</b>. See Remarks.
     * @param {Pointer<ID3D11Buffer>} ppSOTargets Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * The array of output buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to bind to the device. The buffers must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_STREAM_OUTPUT</a> flag.
     * @param {Pointer<Integer>} pOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Array of offsets to the output buffers from <i>ppSOTargets</i>, one offset for each buffer. The offset values must be in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-sosettargets
     */
    SOSetTargets(NumBuffers, ppSOTargets, pOffsets) {
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(37, this, "uint", NumBuffers, "ptr*", ppSOTargets, pOffsetsMarshal, pOffsets)
    }

    /**
     * Draw geometry of an unknown size.
     * @remarks
     * 
     * A draw API submits work to the rendering pipeline. This API submits work of an unknown size that was processed by the input assembler, vertex shader, and stream-output stages;  the work may or may not have gone through the geometry-shader stage.
     * 
     * After data has been streamed out to stream-output stage buffers, those buffers can be again bound to the Input Assembler stage at input slot 0 and DrawAuto will draw them without the application needing to know the amount of data that was written to the buffers. A measurement of the amount of data written to the SO stage buffers is maintained internally when the data is streamed out. This means that the CPU does not need to fetch the measurement before re-binding the data that was streamed as input data. Although this amount is tracked internally, it is still the responsibility of applications to use input layouts to describe the format of the data in the SO stage buffers so that the layouts are available when the buffers are again bound to the input assembler.
     * 
     * The following diagram shows the DrawAuto process.
     * 
     * <img alt="Diagram of DrawAuto as data moves through several stages to a buffer and then back to the Input Assembler stage" src="./images/d3d11_pipeline_stages_drawauto.png"/>
     * 
     * Calling DrawAuto does not change the state of the streaming-output buffers that were bound again as inputs.
     * 
     * DrawAuto only works when drawing with one input buffer bound as an input to the IA stage at slot 0. Applications must create the SO buffer resource with both binding flags, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_VERTEX_BUFFER</a> and <b>D3D11_BIND_STREAM_OUTPUT</b>.
     * 
     * This API does not support indexing or instancing.
     * 
     * If an application needs to retrieve the size of the streaming-output buffer, it can query for statistics on streaming output by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY_SO_STATISTICS</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawauto
     */
    DrawAuto() {
        ComCall(38, this)
    }

    /**
     * Draw indexed, instanced, GPU-generated primitives.
     * @remarks
     * 
     * When an application creates a buffer that is associated with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> interface that  <i>pBufferForArgs</i> points to, the application must set the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS</a> flag in the <b>MiscFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> structure that describes the buffer. To create the buffer, the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a> method and in this call passes a pointer to <b>D3D11_BUFFER_DESC</b> in the <i>pDesc</i> parameter.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11Buffer} pBufferForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>, which is a buffer containing the GPU generated primitives.
     * @param {Integer} AlignedByteOffsetForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset in <i>pBufferForArgs</i> to the start of the GPU generated primitives.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstancedindirect
     */
    DrawIndexedInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(39, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * Draw instanced, GPU-generated primitives.
     * @remarks
     * 
     * When an application creates a buffer that is associated with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> interface that  <i>pBufferForArgs</i> points to, the application must set the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS</a> flag in the <b>MiscFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> structure that describes the buffer. To create the buffer, the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a> method and in this call passes a pointer to <b>D3D11_BUFFER_DESC</b> in the <i>pDesc</i> parameter.
     * 
     * 
     * @param {ID3D11Buffer} pBufferForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>, which is a buffer containing the GPU generated primitives.
     * @param {Integer} AlignedByteOffsetForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset in <i>pBufferForArgs</i> to the start of the GPU generated primitives.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-drawinstancedindirect
     */
    DrawInstancedIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(40, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * Execute a command list from a thread group.
     * @remarks
     * 
     * You call the <b>Dispatch</b> method to execute commands in a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-compute-shader">compute shader</a>. A compute shader can be run on many threads in parallel, within a thread group. Index a particular thread, within a thread group using a 3D vector 
     *       given by (x,y,z).
     * 
     * In the following illustration, assume a thread group with 50 threads where the size of the group is given by (5,5,2). A single thread is identified from a 
     *       thread group with 50 threads in it, using the vector (4,1,1).
     * 
     * <img alt="Illustration of a single thread within a thread group of 50 threads" src="./images/d3d11_thread_group_1.png"/>
     * 
     * The following illustration shows the relationship between the parameters passed to <b>ID3D11DeviceContext::Dispatch</b>, Dispatch(5,3,2), the values specified in the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-attributes-numthreads">numthreads</a> attribute, numthreads(10,8,3), and values that will passed to the compute shader for the thread-related system values 
     * (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff471569(v=vs.85)">SV_GroupIndex</a>,<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-dispatchthreadid">SV_DispatchThreadID</a>,<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupthreadid">SV_GroupThreadID</a>,<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupid">SV_GroupID</a>).
     * 
     * <img alt="Illustration of the relationship between Dispatch, thread groups, and threads" src="./images/ThreadGroupIDs.png"/>
     * 
     * 
     * @param {Integer} ThreadGroupCountX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the x direction. <i>ThreadGroupCountX</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
     * @param {Integer} ThreadGroupCountY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the y direction. <i>ThreadGroupCountY</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
     * @param {Integer} ThreadGroupCountZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of groups dispatched in the z direction.  <i>ThreadGroupCountZ</i> must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535). 
     *         In feature level 10 the value for <i>ThreadGroupCountZ</i> must be 1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dispatch
     */
    Dispatch(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(41, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }

    /**
     * Execute a command list over one or more thread groups.
     * @remarks
     * 
     * You call the <b>DispatchIndirect</b> method to execute commands in a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-compute-shader">compute shader</a>.
     * 
     * When an application creates a buffer that is associated with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> interface that  <i>pBufferForArgs</i> points to, the application must set the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS</a> flag in the <b>MiscFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> structure that describes the buffer. To create the buffer, the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a> method and in this call passes a pointer to <b>D3D11_BUFFER_DESC</b> in the <i>pDesc</i> parameter.
     * 
     * 
     * @param {ID3D11Buffer} pBufferForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>, which must be loaded with data that matches the argument list for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">ID3D11DeviceContext::Dispatch</a>.
     * @param {Integer} AlignedByteOffsetForArgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A byte-aligned offset between the start of the buffer and the arguments.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dispatchindirect
     */
    DispatchIndirect(pBufferForArgs, AlignedByteOffsetForArgs) {
        ComCall(42, this, "ptr", pBufferForArgs, "uint", AlignedByteOffsetForArgs)
    }

    /**
     * Set the rasterizer state for the rasterizer stage of the pipeline.
     * @remarks
     * 
     * To create a rasterizer state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate">ID3D11Device::CreateRasterizerState</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {ID3D11RasterizerState} pRasterizerState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>*</b>
     * 
     * Pointer to a rasterizer-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>) to bind to the pipeline.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rssetstate
     */
    RSSetState(pRasterizerState) {
        ComCall(43, this, "ptr", pRasterizerState)
    }

    /**
     * Bind an array of viewports to the rasterizer stage of the pipeline.
     * @remarks
     * 
     * All viewports must be set atomically as one operation. Any viewports not defined by the call are disabled.
     * 
     * Which viewport to use is determined by the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">SV_ViewportArrayIndex</a> semantic output by a geometry shader; if a geometry shader does not specify the semantic, Direct3D will use the first viewport in the array.
     * 
     * <div class="alert"><b>Note</b>  Even though you specify float values to the members of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_viewport">D3D11_VIEWPORT</a> structure for the <i>pViewports</i> array in a call to  <b>ID3D11DeviceContext::RSSetViewports</b> for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9_x, <b>RSSetViewports</b> uses DWORDs internally. Because of this behavior, when you use a negative top left corner for the viewport, the call to  <b>RSSetViewports</b> for feature levels 9_x fails. This failure occurs because <b>RSSetViewports</b> for 9_x casts the floating point values into unsigned integers without validation, which results in integer overflow. </div>
     * <div> </div>
     * 
     * 
     * @param {Integer} NumViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of viewports to bind.
     * @param {Pointer<D3D11_VIEWPORT>} pViewports Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_viewport">D3D11_VIEWPORT</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_viewport">D3D11_VIEWPORT</a> structures to bind to the device. See the structure page for details about how the viewport size is dependent on the device feature level which has changed between Direct3D 11 and Direct3D 10.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rssetviewports
     */
    RSSetViewports(NumViewports, pViewports) {
        ComCall(44, this, "uint", NumViewports, "ptr", pViewports)
    }

    /**
     * Bind an array of scissor rectangles to the rasterizer stage.
     * @remarks
     * 
     * All scissor rects must be set atomically as one operation. Any scissor rects not defined by the call are disabled.
     * 
     * The scissor rectangles will only be used if ScissorEnable is set to true in the rasterizer state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>).
     *         
     * 
     * Which scissor rectangle to use is determined by the SV_ViewportArrayIndex semantic output by a geometry shader (see shader semantic syntax). If a geometry shader does not make use of the SV_ViewportArrayIndex semantic then Direct3D will use the first scissor rectangle in the array.
     * 
     * Each scissor rectangle in the array corresponds to a viewport in an array of viewports (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetviewports">ID3D11DeviceContext::RSSetViewports</a>).
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of scissor rectangles to bind.
     * @param {Pointer<RECT>} pRects Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a>*</b>
     * 
     * An array of scissor rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rssetscissorrects
     */
    RSSetScissorRects(NumRects, pRects) {
        ComCall(45, this, "uint", NumRects, "ptr", pRects)
    }

    /**
     * Copy a region from a source resource to a destination resource.
     * @remarks
     * 
     * The source box must be within the size of the source resource. The destination offsets, (x, y, and z), allow the source box to be offset when writing into the destination resource; however, the dimensions of the source box and the offsets must be within the size of the resource. If you try and copy outside the destination resource or specify a source box that is larger than the source resource, the behavior of <b>CopySubresourceRegion</b> is undefined. If you created a device that supports the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a>, the debug output reports an error on this invalid <b>CopySubresourceRegion</b> call. Invalid parameters to <b>CopySubresourceRegion</b> cause undefined behavior and might result in incorrect rendering, clipping, no copy, or even the removal of the rendering device.
     * 
     * If the resources are buffers, all coordinates are in bytes; if the resources are textures, all coordinates are in texels. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a> is a helper function for calculating subresource indexes.
     * 
     * <b>CopySubresourceRegion</b> performs the copy on the GPU (similar to a memcpy by the CPU). As a consequence, the source and destination resources:
     * 
     * <ul>
     * <li>Must be different subresources (although they can be from the same resource).</li>
     * <li>Must be the same type.</li>
     * <li>Must have compatible DXGI formats (identical or from the same type group). For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. <b>CopySubresourceRegion</b> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.</li>
     * <li>May not be currently mapped.</li>
     * </ul>
     * **CopySubresourceRegion** only supports copy; it doesn't support any stretch, color key, or blend. **CopySubresourceRegion** can reinterpret the resource data between a few format types. For more info, see [Format conversion using Direct3D 10.1](/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#format-conversion-using-direct3d-101).
     * 
     * If your app needs to copy an entire resource, we recommend to use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">ID3D11DeviceContext::CopyResource</a> instead.
     *         
     * 
     * <b>CopySubresourceRegion</b> is an asynchronous call, which may be added to the command-buffer queue, this attempts to remove pipeline stalls that may occur when copying data. For more information about pipeline stalls, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">performance considerations</a>.
     * 
     * <div class="alert"><b>Note</b>  <b>Applies only to feature level 9_x hardware</b> If you use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">ID3D11DeviceContext::UpdateSubresource</a> or <b>CopySubresourceRegion</b> to copy from a staging resource to a default resource, you can corrupt the destination contents. This occurs if you pass a <b>NULL</b> source box and if the source resource has different dimensions from those of the destination resource or if you use destination offsets, (x, y, and z). In this situation, always pass a source box that is the full size of the source resource.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  <b>Applies only to feature level 9_x hardware</b> You can't use <b>CopySubresourceRegion</b> to copy mipmapped volume textures. </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  <b>Applies only to feature levels 9_x</b> Subresources created with the D3D11_BIND_DEPTH_STENCIL flag can only be used as a source for <b>CopySubresourceRegion</b>.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If you use <b>CopySubresourceRegion</b> with a depth-stencil buffer or a multisampled resource, you must copy the whole subresource. In this situation, you must pass 0 to the <i>DstX</i>, <i>DstY</i>, and <i>DstZ</i> parameters and <b>NULL</b> to the <i>pSrcBox</i> parameter. In addition, source and destination resources, which are represented by the <i>pSrcResource</i> and <i>pDstResource</i> parameters, should have identical sample count values.</div>
     * <div> </div>
     * <h3><a id="Example"></a><a id="example"></a><a id="EXAMPLE"></a>Example</h3>
     * The following code snippet copies a box (located at (120,100),(200,220)) from a source texture into a reqion (10,20),(90,140) in a destination texture.
     *           
     * 
     * 
     * ```
     * D3D11_BOX sourceRegion;
     * sourceRegion.left = 120;
     * sourceRegion.right = 200;
     * sourceRegion.top = 100;
     * sourceRegion.bottom = 220;
     * sourceRegion.front = 0;
     * sourceRegion.back = 1;
     * 
     * pd3dDeviceContext->CopySubresourceRegion( pDestTexture, 0, 10, 20, 0, pSourceTexture, 0, &sourceRegion );
     * 
     * ```
     * 
     * 
     * Notice, that for a 2D texture, front and back are set to 0 and 1 respectively.
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>).
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Destination subresource index.
     * @param {Integer} DstX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x-coordinate of the upper left corner of the destination region.
     * @param {Integer} DstY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y-coordinate of the upper left corner of the destination region. For a 1D subresource, this must be zero.
     * @param {Integer} DstZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z-coordinate of the upper left corner of the destination region. For a 1D or 2D subresource, this must be zero.
     * @param {ID3D11Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the source resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>).
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Source subresource index.
     * @param {Pointer<D3D11_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a 3D box (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>) that defines the source subresource that can be copied. If <b>NULL</b>, the entire source subresource is copied. The box must fit within the source resource.
     * 
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value. When the box is empty, <b>CopySubresourceRegion</b> doesn't perform a copy operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion
     */
    CopySubresourceRegion(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox) {
        ComCall(46, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }

    /**
     * Copy the entire contents of the source resource to the destination resource using the GPU.
     * @remarks
     * 
     * This method is unusual in that it causes the GPU to perform the copy operation (similar to a memcpy by the CPU). As a result, it has a few restrictions designed for improving performance. For instance, the source and destination resources:
     * 
     * <ul>
     * <li>Must be different resources.</li>
     * <li>Must be the same type.</li>
     * <li>Must have identical dimensions (including width, height, depth, and size as appropriate).</li>
     * <li>Must have compatible <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI formats</a>, which means the formats must be identical or at least from the same type group. For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">CopyResource</a> can copy between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.</li>
     * <li>Can't be currently mapped.</li>
     * </ul>
     * <b>CopyResource</b> only supports copy; it doesn't support any stretch, color key, or blend. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">CopyResource</a> can reinterpret the resource data between a few format types. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">Format Conversion using Direct3D 10.1</a>.
     * 
     * You can't use an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">Immutable</a> resource as a destination. You can use a   <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">depth-stencil</a> resource as either a source or a destination provided that the feature level is D3D_FEATURE_LEVEL_10_1 or greater. For feature levels 9_x, resources created with the D3D11_BIND_DEPTH_STENCIL flag can only be used as a source for <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">CopyResource</a>.  Resources created with multisampling capability (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a>) can be used as source and destination only if both source and destination have identical multisampled count and quality. If source and destination differ in multisampled count and quality or if one is multisampled and the other is not multisampled, the call to <b>ID3D11DeviceContext::CopyResource</b> fails. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource">ID3D11DeviceContext::ResolveSubresource</a> to resolve a multisampled resource to a resource that is not multisampled.
     * 
     * The method is an asynchronous call, which may be added to the command-buffer queue. This attempts to remove pipeline stalls that may occur when copying data. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">performance considerations</a>.
     * 
     * We recommend to use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a> instead if you only need to copy a portion of the data in a resource.
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface that represents the destination resource.
     * @param {ID3D11Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface that represents the source resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-copyresource
     */
    CopyResource(pDstResource, pSrcResource) {
        ComCall(47, this, "ptr", pDstResource, "ptr", pSrcResource)
    }

    /**
     * The CPU copies data from memory to a subresource created in non-mappable memory.
     * @remarks
     * 
     * For a shader-constant buffer; set <i>pDstBox</i> to <b>NULL</b>. It is not possible to use this method to partially update a shader-constant buffer.
     * 
     * A resource cannot be used as a destination if:
     * 
     * <ul>
     * <li>the resource is created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">immutable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">dynamic</a> usage.</li>
     * <li>the resource is created as a depth-stencil resource.</li>
     * <li>the resource is created with multisampling capability (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a>).</li>
     * </ul>
     * When <b>UpdateSubresource</b> returns, the application is free to change or even free the data pointed to by <i>pSrcData</i> because the method has already copied/snapped away the original contents.
     * 
     * The performance of <b>UpdateSubresource</b> depends on whether or not there is contention for the destination resource. For example, contention for a vertex buffer resource occurs when the application executes a <b>Draw</b> call and later calls <b>UpdateSubresource</b> on the same vertex buffer before the <b>Draw</b> call is actually executed by the GPU.
     * 
     * <ul>
     * <li>When there is contention for the resource, <b>UpdateSubresource</b> will perform 2 copies of the source data. First, the data is copied by the CPU to a temporary storage space accessible by the command buffer. This copy happens before the method returns.  A second copy is then performed by the GPU to copy the source data into non-mappable memory. This second copy happens asynchronously because it is executed by GPU when the command buffer is flushed.</li>
     * <li>When there is no resource contention, the behavior of <b>UpdateSubresource</b> is dependent on which is faster (from the CPU's perspective): copying the data to the command buffer and then having a second copy execute when the command buffer is flushed, or having the CPU copy the data to the final resource location. This is dependent on the architecture of the underlying system.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  <b>Applies only to feature level 9_x hardware</b> If you use <b>UpdateSubresource</b> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a> to copy from a staging resource to a default resource, you can corrupt the destination contents. This occurs if you pass a <b>NULL</b> source box and if the source resource has different dimensions from those of the destination resource or if you use destination offsets, (x, y, and z). In this situation, always pass a source box that is the full size of the source resource.</div>
     * <div> </div>
     * To better understand the source row pitch and source depth pitch parameters, the following illustration shows a 3D volume texture.
     * 
     * <img alt="Illustration of a 3D volume texture" src="./images/D3D10_pitches_conceptual.png"/>
     * 
     * Each block in this visual represents an element of data, and the size of each element is dependent on the resource's format. For example, if the resource format is DXGI_FORMAT_R32G32B32A32_FLOAT, the size of each element would be 128 bits, or 16 bytes. This 3D volume texture has a width of two, a height of three, and a depth of four.
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
     * <img alt="Illustration of a 3D volume texture laid out in memory" src="./images/D3D10_pitches.png"/>
     * 
     * For example, the following code snippet shows how to specify a destination region in a 2D texture. Assume the destination texture is 512x512 and the operation will copy the data pointed to by <i>pData</i> to  [(120,100)..(200,220)] in the destination texture. Also assume that <i>rowPitch</i> has been initialized with the proper value (as explained above). <b>front</b> and <b>back</b> are set to 0 and 1 respectively, because by having <b>front</b> equal to <b>back</b>, the box is technically empty.
     * 
     * 
     * ```
     * 
     * D3D11_BOX destRegion;
     * destRegion.left = 120;
     * destRegion.right = 200;
     * destRegion.top = 100;
     * destRegion.bottom = 220;
     * destRegion.front = 0;
     * destRegion.back = 1;
     * 
     * pd3dDeviceContext->UpdateSubresource( pDestTexture, 0, &destRegion, pData, rowPitch, 0 );
     * 
     * ```
     * 
     * 
     * The 1D case is similar. The following snippet shows how to specify a destination region in a 1D texture. Use the same assumptions as above, except that the texture is 512 in length.
     * 
     * 
     * ```
     * 
     * D3D11_BOX destRegion;
     * destRegion.left = 120;
     * destRegion.right = 200;
     * destRegion.top = 0;
     * destRegion.bottom = 1;
     * destRegion.front = 0;
     * destRegion.back = 1;
     * 
     * pd3dDeviceContext->UpdateSubresource( pDestTexture, 0, &destRegion, pData, rowPitch, 0 );
     * 
     * ```
     * 
     * 
     * For info about various resource types and how <b>UpdateSubresource</b> might work with each resource type, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Introduction to a Resource in Direct3D 11</a>. 
     * 
     * <h3><a id="Calling_UpdateSubresource_on_a_Deferred_Context"></a><a id="calling_updatesubresource_on_a_deferred_context"></a><a id="CALLING_UPDATESUBRESOURCE_ON_A_DEFERRED_CONTEXT"></a>Calling UpdateSubresource on a Deferred Context</h3>
     * If your application calls <b>UpdateSubresource</b> on a deferred context with a destination box—to which <i>pDstBox</i> points—that has a non-(0,0,0) offset, and if the driver does not support command lists, <b>UpdateSubresource</b> inappropriately applies that destination-box offset to the <i>pSrcData</i> parameter. To work around this behavior, use the following code:
     * 
     * 
     * ```
     * 
     * HRESULT UpdateSubresource_Workaround(
     *   ID3D11Device *pDevice,
     *   ID3D11DeviceContext *pDeviceContext,
     *   ID3D11Resource *pDstResource,
     *   UINT dstSubresource,
     *   const D3D11_BOX *pDstBox,
     *   const void *pSrcData,
     *   UINT srcBytesPerElement,
     *   UINT srcRowPitch,
     *   UINT srcDepthPitch,
     *   bool* pDidWorkAround )
     * {
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( pDstBox && (D3D11_DEVICE_CONTEXT_DEFERRED == contextType) )
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) )
     *           {
     *                if( !threadingCaps.DriverCommandLists )
     *                {
     *                     needWorkaround = true;
     *                }
     *           }
     *      }
     * 
     *      const void* pAdjustedSrcData = pSrcData;
     * 
     *      if( needWorkaround )
     *      {
     *           D3D11_BOX alignedBox = *pDstBox;
     * 		
     *           // convert from pixels to blocks
     *           if( m_bBC )
     *           {
     *                alignedBox.left     /= 4;
     *                alignedBox.right    /= 4;
     *                alignedBox.top      /= 4;
     *                alignedBox.bottom   /= 4;
     *           }
     * 
     *           pAdjustedSrcData = ((const BYTE*)pSrcData) - (alignedBox.front * srcDepthPitch) - (alignedBox.top * srcRowPitch) - (alignedBox.left * srcBytesPerElement);
     *      }
     * 
     *      pDeviceContext->UpdateSubresource( pDstResource, dstSubresource, pDstBox, pAdjustedSrcData, srcRowPitch, srcDepthPitch );
     * 
     *      if( pDidWorkAround )
     *      {
     *           *pDidWorkAround = needWorkaround;
     *      }
     * 
     *      return hr;
     * }
     * 
     * ```
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>).
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a> for more details.
     * @param {Pointer<D3D11_BOX>} pDstBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data into. Coordinates are in bytes for buffers and in texels for textures. If <b>NULL</b>, the data is written to the destination subresource with no offset. The dimensions of the source must fit the destination (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>).
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-updatesubresource
     */
    UpdateSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(48, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * Copies data from a buffer holding variable length data.
     * @param {ID3D11Buffer} pDstBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>.  This can be any buffer resource that other copy commands, 
     *         such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">ID3D11DeviceContext::CopyResource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a>, are able to write to.
     * @param {Integer} DstAlignedByteOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from the start of <i>pDstBuffer</i> to write 32-bit UINT structure (vertex) count from <i>pSrcView</i>.
     * @param {ID3D11UnorderedAccessView} pSrcView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> of a Structured Buffer resource created with either 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_buffer_uav_flag">D3D11_BUFFER_UAV_FLAG_APPEND</a> or <b>D3D11_BUFFER_UAV_FLAG_COUNTER</b> specified 
     *         when the UAV was created.   These types of resources have hidden counters tracking "how many" records have 
     *         been written.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-copystructurecount
     */
    CopyStructureCount(pDstBuffer, DstAlignedByteOffset, pSrcView) {
        ComCall(49, this, "ptr", pDstBuffer, "uint", DstAlignedByteOffset, "ptr", pSrcView)
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
     * Differences between Direct3D 9 and Direct3D 11/10:
     * 
     * Unlike Direct3D 9, the full extent of the resource view is always cleared. Viewport and scissor settings are not applied.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When using <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_9_x</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-clearrendertargetview">ClearRenderTargetView</a> only clears the first array slice in the render target view. This can impact (for example) cube map rendering scenarios. Applications should create a render target view for each face or array slice, then clear each view individually.
     * 
     * 
     * @param {ID3D11RenderTargetView} pRenderTargetView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>*</b>
     * 
     * Pointer to the render target.
     * @param {Pointer<Float>} ColorRGBA Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>[4]</b>
     * 
     * A 4-component array that represents the color to fill the render target with.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-clearrendertargetview
     */
    ClearRenderTargetView(pRenderTargetView, ColorRGBA) {
        ColorRGBAMarshal := ColorRGBA is VarRef ? "float*" : "ptr"

        ComCall(50, this, "ptr", pRenderTargetView, ColorRGBAMarshal, ColorRGBA)
    }

    /**
     * Clears an unordered access resource with bit-precise values.
     * @remarks
     * 
     * This API copies the lower n<sub>i</sub> bits from each array element i to the corresponding channel, where n<sub>i</sub> is the number of bits in 
     *       the ith channel of the resource format (for example, R8G8B8_FLOAT has 8 bits for the first 3 channels). This works on any UAV with no format conversion. 
     *       For a raw or structured buffer view, only the first array element value is used.
     * 
     * 
     * @param {ID3D11UnorderedAccessView} pUnorderedAccessView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> to clear.
     * @param {Pointer<Integer>} Values Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>[4]</b>
     * 
     * Values to copy to corresponding channels, see remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewuint
     */
    ClearUnorderedAccessViewUint(pUnorderedAccessView, Values) {
        ValuesMarshal := Values is VarRef ? "uint*" : "ptr"

        ComCall(51, this, "ptr", pUnorderedAccessView, ValuesMarshal, Values)
    }

    /**
     * Clears an unordered access resource with a float value.
     * @remarks
     * 
     * This API works on FLOAT, UNORM, and SNORM unordered access views (UAVs), with format conversion from FLOAT to *NORM where appropriate. On other UAVs, the operation is invalid and the call will not reach the driver.
     * 
     * 
     * @param {ID3D11UnorderedAccessView} pUnorderedAccessView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> to clear.
     * @param {Pointer<Float>} Values Type: <b>const FLOAT[4]</b>
     * 
     * Values to copy to corresponding channels, see remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewfloat
     */
    ClearUnorderedAccessViewFloat(pUnorderedAccessView, Values) {
        ValuesMarshal := Values is VarRef ? "float*" : "ptr"

        ComCall(52, this, "ptr", pUnorderedAccessView, ValuesMarshal, Values)
    }

    /**
     * Clears the depth-stencil resource.
     * @remarks
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 11/10:
     * 
     * Unlike Direct3D 9, the full extent of the resource view is always cleared. Viewport and scissor settings are not applied.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D11DepthStencilView} pDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>*</b>
     * 
     * Pointer to the depth stencil to be cleared.
     * @param {Integer} ClearFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identify the type of data to clear (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_clear_flag">D3D11_CLEAR_FLAG</a>).
     * @param {Float} Depth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Clear the depth buffer with this value. This value will be clamped between 0 and 1.
     * @param {Integer} Stencil Type: <b>UINT8</b>
     * 
     * Clear the stencil buffer with this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview
     */
    ClearDepthStencilView(pDepthStencilView, ClearFlags, Depth, Stencil) {
        ComCall(53, this, "ptr", pDepthStencilView, "uint", ClearFlags, "float", Depth, "char", Stencil)
    }

    /**
     * Generates mipmaps for the given shader resource.
     * @remarks
     * 
     * You can call <b>GenerateMips</b> on any shader-resource view to generate the lower mipmap levels for the shader resource. <b>GenerateMips</b> uses the largest mipmap level of the view to recursively generate the lower levels of the mip and stops with the smallest level that is specified by the view. If the base resource wasn't created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_RENDER_TARGET</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_SHADER_RESOURCE</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_GENERATE_MIPS</a>, the call to <b>GenerateMips</b> has no effect.
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">Feature levels</a> 9.1, 9.2, and 9.3 can't support automatic generation of mipmaps for 3D (volume) textures.
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
     * For all other unsupported formats, <b>GenerateMips</b> will silently fail.
     * 
     * 
     * @param {ID3D11ShaderResourceView} pShaderResourceView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a> interface that represents the shader resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-generatemips
     */
    GenerateMips(pShaderResourceView) {
        ComCall(54, this, "ptr", pShaderResourceView)
    }

    /**
     * Sets the minimum level-of-detail (LOD) for a resource.
     * @remarks
     * 
     * To use a resource with <b>SetResourceMinLOD</b>, you must set the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_RESOURCE_CLAMP</a> flag when you create that resource.
     * 
     * For Direct3D 10 and Direct3D 10.1, when sampling from a texture resource in a shader, the sampler can define a minimum LOD clamp to force sampling from less detailed mip levels.  For Direct3D 11, this functionality is extended from the sampler to the entire resource. Therefore, the application can specify the highest-resolution mip level of a resource that is available for access. This restricts the set of mip levels that are required to be resident in GPU memory, thereby saving memory.
     * 
     * The set of mip levels resident per-resource in GPU memory can be specified by the user.
     * 
     * Minimum LOD affects all of the resident mip levels. Therefore, only the resident mip levels can be updated and read from.
     * 
     * All methods that access texture resources must adhere to minimum LOD clamps.
     * 
     * Empty-set accesses are handled as out-of-bounds cases.
     * 
     * 
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents the resource.
     * @param {Float} MinLOD Type: <b>FLOAT</b>
     * 
     * The level-of-detail, which ranges between 0 and the maximum number of mipmap levels of the resource. For example, the maximum number of mipmap levels of a 1D texture is specified in the  <b>MipLevels</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-setresourceminlod
     */
    SetResourceMinLOD(pResource, MinLOD) {
        ComCall(55, this, "ptr", pResource, "float", MinLOD)
    }

    /**
     * Gets the minimum level-of-detail (LOD).
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> which represents the resource.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * Returns the minimum LOD.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-getresourceminlod
     */
    GetResourceMinLOD(pResource) {
        result := ComCall(56, this, "ptr", pResource, "float")
        return result
    }

    /**
     * Copy a multisampled resource into a non-multisampled resource.
     * @remarks
     * 
     * This API is most useful when re-using the resulting rendertarget of one render pass as an input to a second render pass.
     * 
     * The source and destination resources must be the same resource type and have the same dimensions. In addition, they must have compatible formats. There are three scenarios for this:
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
     * <td>Both the source and desintation must have the same typeless format (i.e. both must have DXGI_FORMAT_R32_TYPELESS), and the Format parameter must specify a format that is compatible with the source and destination (i.e. if both are DXGI_FORMAT_R32_TYPELESS then DXGI_FORMAT_R32_FLOAT could be specified in the Format parameter).
     * 
     * For example, given the DXGI_FORMAT_R16G16B16A16_TYPELESS format:
     * 
     * <ul>
     * <li>The source (or dest) format could be DXGI_FORMAT_R16G16B16A16_UNORM</li>
     * <li>The dest (or source) format could be DXGI_FORMAT_R16G16B16A16_FLOAT</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Destination resource. Must be a created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a> flag and be single-sampled. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a> to calculate the index.
     * @param {ID3D11Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Source resource. Must be multisampled.
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The source subresource of the source resource.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> that indicates how the multisampled resource will be resolved to a single-sampled resource. 
     *       See remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource
     */
    ResolveSubresource(pDstResource, DstSubresource, pSrcResource, SrcSubresource, Format) {
        ComCall(57, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pSrcResource, "uint", SrcSubresource, "int", Format)
    }

    /**
     * Queues commands from a command list onto a device.
     * @remarks
     * 
     * Use this method to play back a command list that was recorded by a deferred context on any thread.
     * 
     * A call to <b>ExecuteCommandList</b> of a command list from a deferred context onto the immediate context is required for the recorded commands to be executed on the graphics processing unit (GPU). A call to <b>ExecuteCommandList</b> of a command list from a deferred context onto another deferred context can be used to merge recorded lists. But to run the commands from the merged deferred command list on the GPU, you need to execute them on the immediate context.
     *         
     * 
     * This method performs some runtime validation related to queries. Queries that are begun in a device context cannot be manipulated indirectly by executing a command list (that is, Begin or End was invoked against the same query by the deferred context which generated the command list). If such a condition occurs, the ExecuteCommandList method does not execute the command list. However, the state of the device context is still maintained, as would be expected (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate">ID3D11DeviceContext::ClearState</a> is performed, unless the application indicates to preserve the device context state).
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11CommandList} pCommandList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface that encapsulates a command list.
     * @param {BOOL} RestoreContextState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean flag that determines whether the target context state is saved prior to and restored after the execution of a command list. Use <b>TRUE</b> to indicate that the runtime needs to save and restore the state. Use <b>FALSE</b> to indicate that no state shall be saved or restored, which causes the target context to  return to its default state after the command list executes. Applications should typically use <b>FALSE</b> unless they will restore the state to be nearly equivalent to the state that the runtime would restore if <b>TRUE</b> were passed. When applications use <b>FALSE</b>, they can avoid unnecessary and inefficient state transitions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-executecommandlist
     */
    ExecuteCommandList(pCommandList, RestoreContextState) {
        ComCall(58, this, "ptr", pCommandList, "int", RestoreContextState)
    }

    /**
     * Bind an array of shader resources to the hull-shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a render target, then the method will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hssetshaderresources
     */
    HSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(59, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Set a hull shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * 
     * @param {ID3D11HullShader} pHullShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a>*</b>
     * 
     * Pointer to a hull shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hssetshader
     */
    HSSetShader(pHullShader, ppClassInstances, NumClassInstances) {
        ComCall(60, this, "ptr", pHullShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * Set an array of sampler states to the hull-shader stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * 
     * ```
     * 
     * //Default sampler state:
     * D3D11_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D11_COMPARISON_NEVER;
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hssetsamplers
     */
    HSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(61, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Set the constant buffers used by the hull-shader stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader than the maximum constant buffer size that is supported by shaders (4096 constants – 4*32-bit components each).  When you bind such a large buffer, the shader can access only the first 4096 4*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.  
     * 
     * If the application wants the shader to access other parts of the buffer, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-hssetconstantbuffers1">HSSetConstantBuffers1</a> method instead.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hssetconstantbuffers
     */
    HSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(62, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an array of shader resources to the domain-shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a render target, then the method will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dssetshaderresources
     */
    DSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(63, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Set a domain shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {ID3D11DomainShader} pDomainShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a>*</b>
     * 
     * Pointer to a domain shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dssetshader
     */
    DSSetShader(pDomainShader, ppClassInstances, NumClassInstances) {
        ComCall(64, this, "ptr", pDomainShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * Set an array of sampler states to the domain-shader stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * 
     * ```
     * 
     * //Default sampler state:
     * D3D11_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D11_COMPARISON_NEVER;
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dssetsamplers
     */
    DSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(65, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Sets the constant buffers used by the domain-shader stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *           This differs from the device state behavior in Direct3D 10.
     *         
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader than the maximum constant buffer size that is supported by shaders (4096 constants – 4*32-bit components each).  When you bind such a large buffer, the shader can access only the first 4096 4*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.
     *         
     * 
     * If the application wants the shader to access other parts of the buffer, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-dssetconstantbuffers1">DSSetConstantBuffers1</a> method instead.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dssetconstantbuffers
     */
    DSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(66, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Bind an array of shader resources to the compute-shader stage.
     * @remarks
     * 
     * If an overlapping resource view is already bound to an output slot, such as a render target, then the method will fill the destination shader resource slot with <b>NULL</b>.
     * 
     * For information about creating shader-resource views, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * The method will hold a reference to the interfaces passed in.
     *   This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to set to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cssetshaderresources
     */
    CSSetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(67, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Sets an array of views for an unordered resource.
     * @remarks
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first element in the zero-based array to begin setting  (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - 1). D3D11_1_UAV_SLOT_COUNT is defined as 64.
     * @param {Integer} NumUAVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of views to set (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointers to be set by the method.
     * @param {Pointer<Integer>} pUAVInitialCounts Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of append and consume buffer offsets. A value of -1 indicates to keep the current offset. Any other values set the hidden counter
     *             for that appendable and consumable UAV. <i>pUAVInitialCounts</i> is only relevant for UAVs that were created with either
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_buffer_uav_flag">D3D11_BUFFER_UAV_FLAG_APPEND</a> or <b>D3D11_BUFFER_UAV_FLAG_COUNTER</b> specified
     *             when the UAV was created; otherwise, the argument is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews
     */
    CSSetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews, pUAVInitialCounts) {
        pUAVInitialCountsMarshal := pUAVInitialCounts is VarRef ? "uint*" : "ptr"

        ComCall(68, this, "uint", StartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews, pUAVInitialCountsMarshal, pUAVInitialCounts)
    }

    /**
     * Set a compute shader to the device.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The maximum number of instances a shader can have is 256.
     * 
     * 
     * @param {ID3D11ComputeShader} pComputeShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a>*</b>
     * 
     * Pointer to a compute shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a>). Passing in <b>NULL</b> disables the shader for this pipeline stage.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>*</b>
     * 
     * A pointer to an array of class-instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>). Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to <b>NULL</b> if the shader does not use any interfaces.
     * @param {Integer} NumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of class-instance interfaces in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cssetshader
     */
    CSSetShader(pComputeShader, ppClassInstances, NumClassInstances) {
        ComCall(69, this, "ptr", pComputeShader, "ptr*", ppClassInstances, "uint", NumClassInstances)
    }

    /**
     * Set an array of sampler states to the compute-shader stage.
     * @remarks
     * 
     * Any sampler may be set to <b>NULL</b>; this invokes the default state, which is defined to be the following.
     * 
     * 
     * ```
     * //Default sampler state:
     * D3D11_SAMPLER_DESC SamplerDesc;
     * SamplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
     * SamplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
     * SamplerDesc.MipLODBias = 0;
     * SamplerDesc.MaxAnisotropy = 1;
     * SamplerDesc.ComparisonFunc = D3D11_COMPARISON_NEVER;
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
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>*</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>). See Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cssetsamplers
     */
    CSSetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(70, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Sets the constant buffers used by the compute-shader stage.
     * @remarks
     * 
     * The method will hold a reference to the interfaces passed in.
     *       This differs from the device state behavior in Direct3D 10.
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, can bind a larger number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources to the shader than the maximum constant buffer size that is supported by shaders (4096 constants – 4*32-bit components each).  When you bind such a large buffer, the shader can access only the first 4096 4*32-bit component constants in the buffer, as if 4096 constants is the full size of the buffer.  
     * 
     * If the application wants the shader to access other parts of the buffer, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-cssetconstantbuffers1">CSSetConstantBuffers1</a> method instead.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the zero-based array to begin setting constant buffers to (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to <b>D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT</b> - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-cssetconstantbuffers
     */
    CSSetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(71, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the constant buffers used by the vertex shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vsgetconstantbuffers
     */
    VSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(72, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the pixel shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-psgetshaderresources
     */
    PSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(73, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get the pixel shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed, to avoid memory leaks.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<ID3D11PixelShader>} ppPixelShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>**</b>
     * 
     * Address of a pointer to a pixel shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-psgetshader
     */
    PSGetShader(ppPixelShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(74, this, "ptr*", ppPixelShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get an array of sampler states from the pixel shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Arry of sampler-state interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>) to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-psgetsamplers
     */
    PSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(75, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the vertex shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11VertexShader>} ppVertexShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>**</b>
     * 
     * Address of a pointer to a vertex shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vsgetshader
     */
    VSGetShader(ppVertexShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(76, this, "ptr*", ppVertexShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get the constant buffers used by the pixel shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-psgetconstantbuffers
     */
    PSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(77, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get a pointer to the input-layout object that is bound to the input-assembler stage.
     * @remarks
     * 
     * For information about creating an input-layout object, see Creating the Input-Layout Object.
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11InputLayout>} ppInputLayout Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>**</b>
     * 
     * A pointer to the input-layout object (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>), which describes the input buffers that will be read by the IA stage.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iagetinputlayout
     */
    IAGetInputLayout(ppInputLayout) {
        ComCall(78, this, "ptr*", ppInputLayout)
    }

    /**
     * Get the vertex buffers bound to the input-assembler stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The input slot of the first vertex buffer to get. The first vertex buffer is explicitly bound to the start slot; this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot. The maximum of 16 or 32 input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available; the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">maximum number of input slots depends on the feature level</a>.
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of vertex buffers to get starting at the offset. The number of buffers (plus the starting slot) cannot exceed the total number of IA-stage input slots.
     * @param {Pointer<ID3D11Buffer>} ppVertexBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * A pointer to an array of vertex buffers returned by the method (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>).
     * @param {Pointer<Integer>} pStrides Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of stride values returned by the method; one stride value for each buffer in the vertex-buffer array. Each stride value is the size (in bytes) of the elements that are to be used from that vertex buffer.
     * @param {Pointer<Integer>} pOffsets Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to an array of offset values returned by the method; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iagetvertexbuffers
     */
    IAGetVertexBuffers(StartSlot, NumBuffers, ppVertexBuffers, pStrides, pOffsets) {
        pStridesMarshal := pStrides is VarRef ? "uint*" : "ptr"
        pOffsetsMarshal := pOffsets is VarRef ? "uint*" : "ptr"

        ComCall(79, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppVertexBuffers, pStridesMarshal, pStrides, pOffsetsMarshal, pOffsets)
    }

    /**
     * Get a pointer to the index buffer that is bound to the input-assembler stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces 
     *       when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11Buffer>} pIndexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * A pointer to an index buffer returned by the method (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>).
     * @param {Pointer<Integer>} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>*</b>
     * 
     * Specifies format of the data in the index buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>). These formats provide the size and type of 
     *           the data in the buffer. The only formats allowed for index buffer data are 16-bit (DXGI_FORMAT_R16_UINT) and 32-bit (DXGI_FORMAT_R32_UINT) 
     *           integers.
     * @param {Pointer<Integer>} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Offset (in bytes) from the start of the index buffer, to the first index to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iagetindexbuffer
     */
    IAGetIndexBuffer(pIndexBuffer, Format, Offset) {
        FormatMarshal := Format is VarRef ? "int*" : "ptr"
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        ComCall(80, this, "ptr*", pIndexBuffer, FormatMarshal, Format, OffsetMarshal, Offset)
    }

    /**
     * Get the constant buffers used by the geometry shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gsgetconstantbuffers
     */
    GSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(81, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the geometry shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11GeometryShader>} ppGeometryShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>**</b>
     * 
     * Address of a pointer to a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gsgetshader
     */
    GSGetShader(ppGeometryShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(82, this, "ptr*", ppGeometryShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get information about the primitive type, and data order that describes input data for the input assembler stage.
     * @param {Pointer<Integer>} pTopology Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff476189(v=vs.85)">D3D11_PRIMITIVE_TOPOLOGY</a>*</b>
     * 
     * A pointer to the type of primitive, and ordering of the primitive data (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff476189(v=vs.85)">D3D11_PRIMITIVE_TOPOLOGY</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-iagetprimitivetopology
     */
    IAGetPrimitiveTopology(pTopology) {
        pTopologyMarshal := pTopology is VarRef ? "int*" : "ptr"

        ComCall(83, this, pTopologyMarshal, pTopology)
    }

    /**
     * Get the vertex shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vsgetshaderresources
     */
    VSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(84, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get an array of sampler states from the vertex shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Arry of sampler-state interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>) to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-vsgetsamplers
     */
    VSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(85, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the rendering predicate state.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11Predicate>} ppPredicate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>**</b>
     * 
     * Address of a pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>). Value stored here will be <b>NULL</b> upon device creation.
     * @param {Pointer<BOOL>} pPredicateValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Address of a boolean to fill with the predicate comparison value. <b>FALSE</b> upon device creation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-getpredication
     */
    GetPredication(ppPredicate, pPredicateValue) {
        pPredicateValueMarshal := pPredicateValue is VarRef ? "int*" : "ptr"

        ComCall(86, this, "ptr*", ppPredicate, pPredicateValueMarshal, pPredicateValue)
    }

    /**
     * Get the geometry shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gsgetshaderresources
     */
    GSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(87, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get an array of sampler state interfaces from the geometry shader pipeline stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gsgetsamplers
     */
    GSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(88, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get pointers to the resources bound to the output-merger stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of render targets to retrieve.
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>**</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>s which represent render target views. Specify <b>NULL</b> for this parameter when retrieval of a render target is not needed.
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>**</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>, which represents a depth-stencil view. Specify <b>NULL</b> for this parameter when retrieval of the depth-stencil view is not needed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargets
     */
    OMGetRenderTargets(NumViews, ppRenderTargetViews, ppDepthStencilView) {
        ComCall(89, this, "uint", NumViews, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView)
    }

    /**
     * Get pointers to the resources bound to the output-merger stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the returned interfaces when they are no longer needed to avoid memory leaks.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} NumRTVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of render-target views to retrieve.
     * @param {Pointer<ID3D11RenderTargetView>} ppRenderTargetViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>**</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>s, which represent render-target views. Specify <b>NULL</b> for this parameter when retrieval of render-target views is not required.
     * @param {Pointer<ID3D11DepthStencilView>} ppDepthStencilView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>**</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>, which represents a depth-stencil view. Specify <b>NULL</b> for this parameter when retrieval of the depth-stencil view is not required.
     * @param {Integer} UAVStartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin retrieving unordered-access views (ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - 1).
     *             For pixel shaders <i>UAVStartSlot</i> should be equal to the number of render-target views that are bound.
     * @param {Integer} NumUAVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of unordered-access views to return in <i>ppUnorderedAccessViews</i>. This number ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - <i>UAVStartSlot</i>.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>s, which represent unordered-access views that are retrieved. Specify <b>NULL</b> for this parameter when retrieval of unordered-access views is not required.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargetsandunorderedaccessviews
     */
    OMGetRenderTargetsAndUnorderedAccessViews(NumRTVs, ppRenderTargetViews, ppDepthStencilView, UAVStartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(90, this, "uint", NumRTVs, "ptr*", ppRenderTargetViews, "ptr*", ppDepthStencilView, "uint", UAVStartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews)
    }

    /**
     * Get the blend state of the output-merger stage.
     * @remarks
     * 
     * The reference count of the returned interface will be incremented by one when the blend state is retrieved. Applications must release returned pointer(s) when they are no longer needed, or else there will be a memory leak.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<ID3D11BlendState>} ppBlendState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>**</b>
     * 
     * Address of a pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>).
     * @param {Pointer<Float>} BlendFactor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>[4]</b>
     * 
     * Array of blend factors, one for each RGBA component.
     * @param {Pointer<Integer>} pSampleMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">sample mask</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omgetblendstate
     */
    OMGetBlendState(ppBlendState, BlendFactor, pSampleMask) {
        BlendFactorMarshal := BlendFactor is VarRef ? "float*" : "ptr"
        pSampleMaskMarshal := pSampleMask is VarRef ? "uint*" : "ptr"

        ComCall(91, this, "ptr*", ppBlendState, BlendFactorMarshal, BlendFactor, pSampleMaskMarshal, pSampleMask)
    }

    /**
     * Gets the depth-stencil state of the output-merger stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<ID3D11DepthStencilState>} ppDepthStencilState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>**</b>
     * 
     * Address of a pointer to a depth-stencil state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>) to be filled with information from the device.
     * @param {Pointer<Integer>} pStencilRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to the stencil reference value used in the depth-stencil test.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-omgetdepthstencilstate
     */
    OMGetDepthStencilState(ppDepthStencilState, pStencilRef) {
        pStencilRefMarshal := pStencilRef is VarRef ? "uint*" : "ptr"

        ComCall(92, this, "ptr*", ppDepthStencilState, pStencilRefMarshal, pStencilRef)
    }

    /**
     * Get the target output buffers for the stream-output stage of the pipeline.
     * @remarks
     * 
     * A maximum of four output buffers can be retrieved.
     * 
     * The offsets to the output buffers pointed to in the returned <i>ppSOTargets</i> array may be assumed to be -1 (append), as defined for use in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">ID3D11DeviceContext::SOSetTargets</a>.
     *         
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to get.
     * @param {Pointer<ID3D11Buffer>} ppSOTargets Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * An array of output buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be retrieved from the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-sogettargets
     */
    SOGetTargets(NumBuffers, ppSOTargets) {
        ComCall(93, this, "uint", NumBuffers, "ptr*", ppSOTargets)
    }

    /**
     * Get the rasterizer state from the rasterizer stage of the pipeline.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11RasterizerState>} ppRasterizerState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>**</b>
     * 
     * Address of a pointer to a rasterizer-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>) to fill with information from the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rsgetstate
     */
    RSGetState(ppRasterizerState) {
        ComCall(94, this, "ptr*", ppRasterizerState)
    }

    /**
     * Gets the array of viewports bound to the rasterizer stage.
     * @remarks
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<Integer>} pNumViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that, on input, specifies the number of viewports (ranges from 0 to <b>D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE</b>)
     *             in the <i>pViewports</i> array; on output, the variable contains the actual number of viewports that are bound to the rasterizer stage.
     *             If <i>pViewports</i> is <b>NULL</b>, <b>RSGetViewports</b> fills the variable with the number of viewports currently bound.
     * 
     * <div class="alert"><b>Note</b>  In some versions of the Windows SDK, a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug device</a> will raise an exception if the input value in the variable to which <i>pNumViewports</i> points is greater than <b>D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE</b> even if <i>pViewports</i> is <b>NULL</b>.  The regular runtime ignores the value in the variable to which <i>pNumViewports</i> points when <i>pViewports</i> is <b>NULL</b>.  This behavior of a debug device might be corrected in a future release of the Windows SDK.
     *             </div>
     * <div> </div>
     * @param {Pointer<D3D11_VIEWPORT>} pViewports Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_viewport">D3D11_VIEWPORT</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_viewport">D3D11_VIEWPORT</a> structures for the viewports that are bound to the rasterizer stage. If the number of viewports (in the variable to which <i>pNumViewports</i> points) is
     *             greater than the actual number of viewports currently bound, unused elements of the array contain 0.
     *             For info about how the viewport size depends on the device <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>, which has changed between Direct3D 11
     *             and Direct3D 10, see <b>D3D11_VIEWPORT</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rsgetviewports
     */
    RSGetViewports(pNumViewports, pViewports) {
        pNumViewportsMarshal := pNumViewports is VarRef ? "uint*" : "ptr"

        ComCall(95, this, pNumViewportsMarshal, pNumViewports, "ptr", pViewports)
    }

    /**
     * Get the array of scissor rectangles bound to the rasterizer stage.
     * @param {Pointer<Integer>} pNumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of scissor rectangles (ranges between 0 and D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE) bound; set <i>pRects</i> to <b>NULL</b> to use <i>pNumRects</i> to see how many rectangles would be returned.
     * @param {Pointer<RECT>} pRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a>*</b>
     * 
     * An array of scissor rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a>). If NumRects is greater than the number of scissor rects currently bound, then unused members of the array will contain 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-rsgetscissorrects
     */
    RSGetScissorRects(pNumRects, pRects) {
        pNumRectsMarshal := pNumRects is VarRef ? "uint*" : "ptr"

        ComCall(96, this, pNumRectsMarshal, pNumRects, "ptr", pRects)
    }

    /**
     * Get the hull-shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hsgetshaderresources
     */
    HSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(97, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get the hull shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11HullShader>} ppHullShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a>**</b>
     * 
     * Address of a pointer to a hull shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hsgetshader
     */
    HSGetShader(ppHullShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(98, this, "ptr*", ppHullShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get an array of sampler state interfaces from the hull-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hsgetsamplers
     */
    HSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(99, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the constant buffers used by the hull-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-hsgetconstantbuffers
     */
    HSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(100, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the domain-shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dsgetshaderresources
     */
    DSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(101, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Get the domain shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11DomainShader>} ppDomainShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a>**</b>
     * 
     * Address of a pointer to a domain shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dsgetshader
     */
    DSGetShader(ppDomainShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(102, this, "ptr*", ppDomainShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get an array of sampler state interfaces from the domain-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dsgetsamplers
     */
    DSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(103, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the constant buffers used by the domain-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-dsgetconstantbuffers
     */
    DSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(104, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Get the compute-shader resources.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
     * @param {Integer} NumViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11ShaderResourceView>} ppShaderResourceViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">shader resource view</a> interfaces to be returned by the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-csgetshaderresources
     */
    CSGetShaderResources(StartSlot, NumViews, ppShaderResourceViews) {
        ComCall(105, this, "uint", StartSlot, "uint", NumViews, "ptr*", ppShaderResourceViews)
    }

    /**
     * Gets an array of views for an unordered resource.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call <b>IUnknown::Release</b> on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first element in the zero-based array to return (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - 1).
     * @param {Integer} NumUAVs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of views to get (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11UnorderedAccessView>} ppUnorderedAccessViews Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * A pointer to an array of interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>) to get.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-csgetunorderedaccessviews
     */
    CSGetUnorderedAccessViews(StartSlot, NumUAVs, ppUnorderedAccessViews) {
        ComCall(106, this, "uint", StartSlot, "uint", NumUAVs, "ptr*", ppUnorderedAccessViews)
    }

    /**
     * Get the compute shader currently set on the device.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Pointer<ID3D11ComputeShader>} ppComputeShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a>**</b>
     * 
     * Address of a pointer to a Compute shader (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a>) to be returned by the method.
     * @param {Pointer<ID3D11ClassInstance>} ppClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>**</b>
     * 
     * Pointer to an array of class instance interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classinstance">ID3D11ClassInstance</a>).
     * @param {Pointer<Integer>} pNumClassInstances Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The number of class-instance elements in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-csgetshader
     */
    CSGetShader(ppComputeShader, ppClassInstances, pNumClassInstances) {
        pNumClassInstancesMarshal := pNumClassInstances is VarRef ? "uint*" : "ptr"

        ComCall(107, this, "ptr*", ppComputeShader, "ptr*", ppClassInstances, pNumClassInstancesMarshal, pNumClassInstances)
    }

    /**
     * Get an array of sampler state interfaces from the compute-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
     * @param {Integer} NumSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11SamplerState>} ppSamplers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Pointer to an array of sampler-state interfaces (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-csgetsamplers
     */
    CSGetSamplers(StartSlot, NumSamplers, ppSamplers) {
        ComCall(108, this, "uint", StartSlot, "uint", NumSamplers, "ptr*", ppSamplers)
    }

    /**
     * Get the constant buffers used by the compute-shader stage.
     * @remarks
     * 
     * Any returned interfaces will have their reference count incremented by one. Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Array of constant buffer interface pointers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) to be returned by the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-csgetconstantbuffers
     */
    CSGetConstantBuffers(StartSlot, NumBuffers, ppConstantBuffers) {
        ComCall(109, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers)
    }

    /**
     * Restore all default settings.
     * @remarks
     * 
     * This method resets any device context to the default settings. This sets all input/output resource slots, shaders, input layouts, predications, scissor rectangles, depth-stencil state, rasterizer state, blend state, sampler state, and viewports to <b>NULL</b>. The primitive topology is set to UNDEFINED.
     * 
     * For a scenario where you would like to clear a list of commands recorded so far, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-finishcommandlist">ID3D11DeviceContext::FinishCommandList</a> and throw away the resulting <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-clearstate
     */
    ClearState() {
        ComCall(110, this)
    }

    /**
     * Sends queued-up commands in the command buffer to the graphics processing unit (GPU).
     * @remarks
     * 
     * Most applications don't need to call this method. If an application calls this method when not necessary, it incurs a performance penalty. 
     *       Each call to <b>Flush</b> incurs a significant amount of overhead.
     * 
     * When Microsoft Direct3D state-setting, present, or draw commands are called by an application, those commands are queued into an internal command buffer. 
     *       <b>Flush</b> sends those commands to the GPU for processing. Typically, the Direct3D runtime sends these commands to the GPU automatically whenever the runtime determines that 
     *       they need to be sent, such as when the command buffer is full or when an application maps a resource. <b>Flush</b> sends the commands manually.
     * 
     * We recommend that you use <b>Flush</b> when the CPU waits for an arbitrary amount of time (such as when 
     *       you call the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleep">Sleep</a> function).
     * 
     * Because <b>Flush</b> operates asynchronously,  it can return either before or after the GPU finishes executing the queued graphics commands. However, the graphics commands eventually always complete. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createquery">ID3D11Device::CreateQuery</a> method with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY_EVENT</a> value to create an event query; you can then use that event query in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> method to determine when the GPU is finished processing the graphics commands.
     * 
     * 
     * Microsoft Direct3D 11 defers the destruction of objects. Therefore, an application can't rely upon objects immediately being destroyed. By calling <b>Flush</b>, you destroy any 
     *       objects whose destruction was deferred.  If an application requires synchronous destruction of an object, we recommend that the application release all its
     *       references, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate">ID3D11DeviceContext::ClearState</a>, and then call <b>Flush</b>.
     * 
     * <h3><a id="Defer_Issues_with_Flip"></a><a id="defer_issues_with_flip"></a><a id="DEFER_ISSUES_WITH_FLIP"></a>Deferred Destruction Issues with Flip Presentation Swap Chains</h3>
     * Direct3D 11 defers the destruction of objects like views and resources until it can efficiently destroy them. This deferred destruction can cause problems with flip presentation model swap chains. Flip presentation model swap chains have the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> flag set. When you create a flip presentation model swap chain, you can associate only one swap chain at a time with an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>, <b>IWindow</b>, or composition surface. If an application attempts to destroy a flip presentation model swap chain and replace it with another swap chain, the original swap chain is not destroyed when the application immediately frees all of the original swap chain's references.
     * 
     * Most applications typically use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-resizebuffers">IDXGISwapChain::ResizeBuffers</a> method for the majority of scenarios where they replace new swap chain buffers for old swap chain buffers. However, if an application must actually destroy an old swap chain and create a new swap chain, the application must force the destruction of all objects that the application freed. To force the destruction, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate">ID3D11DeviceContext::ClearState</a> (or otherwise ensure no views are bound to pipeline state), and then call <b>Flush</b> on the immediate context. You must force destruction before you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> again to create a new swap chain.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-flush
     */
    Flush() {
        ComCall(111, this)
    }

    /**
     * Gets the type of device context.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d3d11/ne-d3d11-d3d11_device_context_type">D3D11_DEVICE_CONTEXT_TYPE</a></b>
     * 
     * A member of <a href="/windows/desktop/api/d3d11/ne-d3d11-d3d11_device_context_type">D3D11_DEVICE_CONTEXT_TYPE</a> that indicates the type of device context.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-gettype
     */
    GetType() {
        result := ComCall(112, this, "int")
        return result
    }

    /**
     * Gets the initialization flags associated with the current deferred context.
     * @remarks
     * 
     * The GetContextFlags method gets the flags that were supplied to the <i>ContextFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdeferredcontext">ID3D11Device::CreateDeferredContext</a>; however, the context flag is reserved for future use.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-getcontextflags
     */
    GetContextFlags() {
        result := ComCall(113, this, "uint")
        return result
    }

    /**
     * Create a command list and record graphics commands into it.
     * @param {BOOL} RestoreDeferredContextState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean flag that determines whether the runtime saves deferred context state before it executes  <b>FinishCommandList</b> and restores it afterwards. Use <b>TRUE</b> to indicate that the runtime needs to save and restore the state. Use <b>FALSE</b> to indicate that the runtime will not save or restore any state. In this case, the deferred context will  return to its default state after the call to  <b>FinishCommandList</b> completes. For information about default state, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate">ID3D11DeviceContext::ClearState</a>. Typically, use <b>FALSE</b> unless you restore the state to be nearly equivalent to the state that the runtime would restore if you passed <b>TRUE</b>. When you use <b>FALSE</b>, you can avoid unnecessary and inefficient state transitions.
     *             
     * 
     * <div class="alert"><b>Note</b>  This parameter does not affect the command list that the current call to <b>FinishCommandList</b> returns. However, this parameter affects the command list of the next call to <b>FinishCommandList</b> on the same deferred context.
     *             </div>
     * <div> </div>
     * @returns {ID3D11CommandList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface pointer is initialized with the recorded command list information. The resulting <b>ID3D11CommandList</b> object is immutable and can only be used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-executecommandlist">ID3D11DeviceContext::ExecuteCommandList</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11devicecontext-finishcommandlist
     */
    FinishCommandList(RestoreDeferredContextState) {
        result := ComCall(114, this, "int", RestoreDeferredContextState, "ptr*", &ppCommandList := 0, "HRESULT")
        return ID3D11CommandList(ppCommandList)
    }
}
