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
 * A device is created using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>.
 *           
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11device
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
     * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
     * @remarks
     * For example code, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-vertex-how-to">How to: Create a Vertex Buffer</a>,
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-index-how-to">How to: Create an Index Buffer</a> or 
     *           <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-constant-how-to">How to: Create a Constant Buffer</a>.
     *         
     * 
     * For a constant buffer (<b>BindFlags</b> of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> set to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_CONSTANT_BUFFER</a>), 
     *           you must set the <b>ByteWidth</b> value of  <b>D3D11_BUFFER_DESC</b> in multiples of 16, and less than or equal to <b>D3D11_REQ_CONSTANT_BUFFER_ELEMENT_COUNT</b>.
     *         
     * 
     * The Direct3D 11.1 runtime, which is available on Windows 8 and later operating systems, provides the following new functionality for <b>CreateBuffer</b>:
     *         
     * 
     * You can create a constant buffer that is larger than the maximum constant buffer size that a shader can access (4096 32-bit*4-component constants – 64KB).
     *           When you bind the constant buffer to the pipeline (for example, via <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers">PSSetConstantBuffers</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1">PSSetConstantBuffers1</a>), 
     *           you can define a range of the buffer that the shader can access that fits within the 4096 constant limit.
     *         
     * The Direct3D 11.1 runtime (available in Windows 8 and later operating systems) emulates this feature for [feature level](/windows/win32/direct3d11/overviews-direct3d-11-devices-downlevel-intro) 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.
     * 
     * This feature is always available on new drivers for feature level 10 and higher.
     * 
     * On runtimes older than Direct3D 11.1, a call to **CreateBuffer** to request a constant buffer that is larger than 4096 fails.
     * @param {Pointer<D3D11_BUFFER_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> structure that describes the buffer.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structure that describes  the initialization data;
     *             use <b>NULL</b> to allocate space only (with the exception that it cannot be <b>NULL</b> if the usage flag is <b>D3D11_USAGE_IMMUTABLE</b>).
     *             
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the buffer is undefined.
     *               In this case, you need to write the buffer content some other way before the resource is read.
     * @returns {ID3D11Buffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>**</b>
     * 
     * Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> interface for the buffer object created.
     *             Set this parameter to <b>NULL</b> to validate the other input parameters (<b>S_FALSE</b> indicates a pass).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3D11Buffer(ppBuffer)
    }

    /**
     * Creates an array of 1D textures.
     * @remarks
     * <b>CreateTexture1D</b> creates a 1D texture resource, which can contain a number of 1D subresources. The number of textures is specified in the texture description. All textures in a resource must have the same format, size, and number of mipmap levels.
     * 
     * All resources are made up of one or more subresources. To load data into the texture, applications can supply the data initially as an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures pointed to by <i>pInitialData</i>, or they can use one of the D3DX texture functions such as <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3dx11createtexturefromfile">D3DX11CreateTextureFromFile</a>.
     * 
     * For a 32 width texture with a full mipmap chain, the <i>pInitialData</i> array has the following 6 elements:
     * 
     * 
     * <ul>
     * <li>pInitialData[0] = 32x1</li>
     * <li>pInitialData[1] = 16x1</li>
     * <li>pInitialData[2] = 8x1</li>
     * <li>pInitialData[3] = 4x1
     * </li>
     * <li>pInitialData[4] = 2x1
     * </li>
     * <li>pInitialData[5] = 1x1
     * </li>
     * </ul>
     * @param {Pointer<D3D11_TEXTURE1D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a> structure that describes a 1D texture resource. To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures that describe subresources for the 1D texture resource. Applications can't specify <b>NULL</b> for <i>pInitialData</i> when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>). If the resource is multisampled, <i>pInitialData</i> must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created. 
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the resource is undefined. In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from values in the <b>MipLevels</b> and <b>ArraySize</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a> structure to which <i>pDesc</i> points by using the following calculation:
     * 
     * MipLevels * ArraySize
     * 
     * For more information about this array size, see Remarks.
     * @returns {ID3D11Texture1D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture1d">ID3D11Texture1D</a>**</b>
     * 
     * A pointer to a buffer that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture1d">ID3D11Texture1D</a> interface for the created texture. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture1D := 0, "HRESULT")
        return ID3D11Texture1D(ppTexture1D)
    }

    /**
     * Create an array of 2D textures.
     * @remarks
     * <b>CreateTexture2D</b> creates a 2D texture resource, which can contain a number of 2D subresources. The number of textures is specified in the texture description. All textures in a resource must have the same format, size, and number of mipmap levels.
     * 
     * All resources are made up of one or more subresources. To load data into the texture, applications can supply the data initially as an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures pointed to by <i>pInitialData</i>, or it may use one of the D3DX texture functions such as <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3dx11createtexturefromfile">D3DX11CreateTextureFromFile</a>.
     * 
     * For a 32 x 32 texture with a full mipmap chain, the <i>pInitialData</i> array has the following 6 elements:
     * 
     * 
     * <ul>
     * <li>pInitialData[0] = 32x32</li>
     * <li>pInitialData[1] = 16x16</li>
     * <li>pInitialData[2] = 8x8</li>
     * <li>pInitialData[3] = 4x4
     * </li>
     * <li>pInitialData[4] = 2x2
     * </li>
     * <li>pInitialData[5] = 1x1
     * </li>
     * </ul>
     * @param {Pointer<D3D11_TEXTURE2D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure that describes a 2D texture resource. To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     *  A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures that describe subresources for the 2D texture resource. Applications can't specify <b>NULL</b> for <i>pInitialData</i> when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>). If the resource is multisampled, <i>pInitialData</i> must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created.
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the resource is undefined. In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from values in the <b>MipLevels</b> and <b>ArraySize</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure to which <i>pDesc</i> points by using the following calculation:
     * 
     * MipLevels * ArraySize
     * 
     * For more information about this array size, see Remarks.
     * @returns {ID3D11Texture2D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>**</b>
     * 
     * A pointer to a buffer that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a> interface for the created texture. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData) {
        result := ComCall(5, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D11Texture2D(ppTexture2D)
    }

    /**
     * Create a single 3D texture.
     * @remarks
     * <b>CreateTexture3D</b> creates a 3D texture resource, which can contain a number of 3D subresources. The number of textures is specified in the texture description. All textures in a resource must have the same format, size, and number of mipmap levels.
     * 
     * All resources are made up of one or more subresources. To load data into the texture, applications can supply the data initially as an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures pointed to by <i>pInitialData</i>, or they can use one of the D3DX texture functions such as <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3dx11createtexturefromfile">D3DX11CreateTextureFromFile</a>.
     * 
     * Each element of <i>pInitialData</i> provides all of the slices that are defined for a given miplevel. For example, for a 32 x 32 x 4 volume texture with a full mipmap chain, the array has the following 6 elements:
     * 
     * <ul>
     * <li>pInitialData[0] = 32x32 with 4 slices</li>
     * <li>pInitialData[1] = 16x16 with 2 slices</li>
     * <li>pInitialData[2] = 8x8 with 1 slice</li>
     * <li>pInitialData[3] = 4x4
     * with 1 slice</li>
     * <li>pInitialData[4] = 2x2
     * with 1 slice</li>
     * <li>pInitialData[5] = 1x1
     * with 1 slice</li>
     * </ul>
     * @param {Pointer<D3D11_TEXTURE3D_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a> structure that describes a 3D texture resource. To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures that describe subresources for the 3D texture resource. Applications cannot specify <b>NULL</b> for <i>pInitialData</i> when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>). If the resource is multisampled, <i>pInitialData</i> must be <b>NULL</b> because multisampled resources cannot be initialized with data when they are created.
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the resource is undefined. In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from the value in the <b>MipLevels</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a> structure to which <i>pDesc</i> points. Arrays of 3D volume textures are not supported.
     * 
     * For more information about this array size, see Remarks.
     * @returns {ID3D11Texture3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture3d">ID3D11Texture3D</a>**</b>
     * 
     * A pointer to a buffer that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture3d">ID3D11Texture3D</a> interface for the created texture. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData) {
        result := ComCall(6, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D11Texture3D(ppTexture3D)
    }

    /**
     * Create a shader-resource view for accessing data in a resource. (ID3D11Device.CreateShaderResourceView)
     * @remarks
     * A resource is made up of one or more subresources; a view identifies which subresources to allow the pipeline to access. In addition, each resource is
     *           bound to the pipeline using a view. A shader-resource view is designed to bind any buffer or texture resource to the shader stages using the following
     *           API methods: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">ID3D11DeviceContext::GSSetShaderResources</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">ID3D11DeviceContext::PSSetShaderResources</a>.
     *         
     * 
     * Because a view is fully typed, this means that typeless resources become fully typed when bound to the pipeline.
     * 
     * <div class="alert"><b>Note</b>  To successfully create a shader-resource view from a typeless buffer (for example, <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32G32B32A32_TYPELESS</a>), you must set the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS</a> flag when you create the buffer.
     *         </div>
     * <div> </div>
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, allows you to use <b>CreateShaderResourceView</b> for the following new purpose.
     *         
     * 
     * You can create shader-resource views of video resources so that Direct3D shaders can process those shader-resource views. These video resources are either <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2darray">Texture2DArray</a>. The value in the <b>ViewDimension</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a> structure for a created shader-resource view must match the type of video resource, D3D11_SRV_DIMENSION_TEXTURE2D          for Texture2D and D3D11_SRV_DIMENSION_TEXTURE2DARRAY for Texture2DArray. Additionally, the format of the underlying video resource restricts the formats that the view can use. The video resource format values on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> reference page specify the format values that views are restricted to.
     *         
     * 
     * The runtime read+write conflict prevention logic (which stops a resource from being bound as an SRV and RTV or UAV at the same time) treats views of different parts of the same video surface as conflicting for simplicity.  Therefore, the runtime does not allow an application to read from luma while the application simultaneously renders to chroma in the same surface even though the hardware might allow these simultaneous operations.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to the resource that will serve as input to a shader. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_SHADER_RESOURCE
     *             </a> flag.
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a>*</b>
     * 
     * Pointer to a shader-resource view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a
     *             view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D11ShaderResourceView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>. Set this parameter to <b>NULL</b> to validate the
     *             other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D11ShaderResourceView(ppSRView)
    }

    /**
     * Creates a view for accessing an unordered access resource. (ID3D11Device.CreateUnorderedAccessView)
     * @remarks
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, allows you to use <b>CreateUnorderedAccessView</b> for the following new purpose. 
     * 
     * You can create unordered-access views of video resources so that Direct3D shaders can process those unordered-access views. These video resources are either <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2darray">Texture2DArray</a>. The value in the <b>ViewDimension</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a> structure for a created unordered-access view must match the type of video resource, D3D11_UAV_DIMENSION_TEXTURE2D          for Texture2D and D3D11_UAV_DIMENSION_TEXTURE2DARRAY for Texture2DArray. Additionally, the format of the underlying video resource restricts the formats that the view can use. The video resource format values on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> reference page specify the format values that views are restricted to.
     * 
     * The runtime read+write conflict prevention logic (which stops a resource from being bound as an SRV and RTV or UAV at the same time) treats views of different parts of the same video surface as conflicting for simplicity.  Therefore, the runtime does not allow an application to read from luma while the application simultaneously renders to chroma in the same surface even though the hardware might allow these simultaneous operations.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a resources that will serve as an input to a shader.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a> that represents a shader-resource view description. Set this parameter to <b>NULL</b> to create a view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D11UnorderedAccessView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> that represents an unordered-access view. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pDesc) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppUAView := 0, "HRESULT")
        return ID3D11UnorderedAccessView(ppUAView)
    }

    /**
     * Creates a render-target view for accessing resource data. (ID3D11Device.CreateRenderTargetView)
     * @remarks
     * A render-target view can be bound to the output-merger stage by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, allows you to use <b>CreateRenderTargetView</b> for the following new purpose. 
     * 
     * You can create render-target views of video resources so that Direct3D shaders can process those render-target views. These video resources are either <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2darray">Texture2DArray</a>. The value in the <b>ViewDimension</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a> structure for a created render-target view must match the type of video resource, D3D11_RTV_DIMENSION_TEXTURE2D          for Texture2D and D3D11_RTV_DIMENSION_TEXTURE2DARRAY for Texture2DArray. Additionally, the format of the underlying video resource restricts the formats that the view can use. The video resource format values on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> reference page specify the format values that views are restricted to.
     * 
     * The runtime read+write conflict prevention logic (which stops a resource from being bound as an SRV and RTV or UAV at the same time) treats views of different parts of the same video surface as conflicting for simplicity.  Therefore, the runtime does not allow an application to read from luma while the application simultaneously renders to chroma in the same surface even though the hardware might allow these simultaneous operations.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a render target. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_RENDER_TARGET</a> flag.
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a> that represents a render-target view description. Set this parameter to <b>NULL</b> to create a view that accesses all of the subresources in mipmap level 0.
     * @returns {ID3D11RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppRTView := 0, "HRESULT")
        return ID3D11RenderTargetView(ppRTView)
    }

    /**
     * Create a depth-stencil view for accessing resource data. (ID3D11Device.CreateDepthStencilView)
     * @remarks
     * A depth-stencil view can be bound to the output-merger stage by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to the resource that will serve as the depth-stencil surface. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_DEPTH_STENCIL</a> flag.
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a view that accesses mipmap level 0 of the entire resource (using the format the resource was created with).
     * @returns {ID3D11DepthStencilView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc) {
        result := ComCall(10, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppDepthStencilView := 0, "HRESULT")
        return ID3D11DepthStencilView(ppDepthStencilView)
    }

    /**
     * Create an input-layout object to describe the input-buffer data for the input-assembler stage. (ID3D11Device.CreateInputLayout)
     * @remarks
     * After creating an input layout object, it must be bound to the input-assembler stage before calling a draw API.
     * 
     * Once an input-layout object is created from a shader signature, the input-layout object can be reused with any other shader that has an identical input signature (semantics included). This can simplify the creation of input-layout objects when you are working with many shaders with identical inputs.
     * 
     * If a data type in the input-layout declaration does not match the data type in a shader-input signature, CreateInputLayout will generate a warning during compilation. The warning is simply to call attention to the fact that the data may be reinterpreted when read from a register. You may either disregard this warning (if reinterpretation is intentional) or make the data types match in both declarations to eliminate the warning.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<D3D11_INPUT_ELEMENT_DESC>} pInputElementDescs Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_input_element_desc">D3D11_INPUT_ELEMENT_DESC</a>*</b>
     * 
     * An array of the input-assembler stage input data types; each type is described by an element description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_input_element_desc">D3D11_INPUT_ELEMENT_DESC</a>).
     * @param {Integer} NumElements Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of input-data types in the array of input-elements.
     * @param {Pointer<Void>} pShaderBytecodeWithInputSignature Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.  The compiled shader code contains a input signature which is validated against the array of elements. See remarks.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled shader.
     * @returns {ID3D11InputLayout} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>**</b>
     * 
     * A pointer to the input-layout object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11inputlayout">ID3D11InputLayout</a>). To validate the other input parameters, set this pointer to be <b>NULL</b> and verify that the method returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength) {
        pShaderBytecodeWithInputSignatureMarshal := pShaderBytecodeWithInputSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", pInputElementDescs, "uint", NumElements, pShaderBytecodeWithInputSignatureMarshal, pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", &ppInputLayout := 0, "HRESULT")
        return ID3D11InputLayout(ppInputLayout)
    }

    /**
     * Create a vertex-shader object from a compiled shader. (ID3D11Device.CreateVertexShader)
     * @remarks
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, provides the following new functionality for <b>CreateVertexShader</b>.
     * 
     * The following shader model 5.0 instructions are available to just pixel shaders and compute shaders in the Direct3D 11.0 runtime. For the Direct3D 11.1 runtime, because unordered access views (UAV) are available at all shader stages, you can use these instructions in all shader stages.
     * 
     * Therefore, if you use the following shader model 5.0 instructions in a vertex shader, you can successfully pass the compiled vertex shader to <i>pShaderBytecode</i>. That is, the call to <b>CreateVertexShader</b> succeeds.
     * 
     * If you pass a compiled shader to <i>pShaderBytecode</i> that uses any of the following instructions on a device that doesn’t support UAVs at every shader stage (including existing drivers that are not implemented to support UAVs at every shader stage), <b>CreateVertexShader</b> fails.  <b>CreateVertexShader</b> also fails if the shader tries to use a UAV slot beyond the set of UAV slots that the hardware supports.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-typed--sm5---asm-">dcl_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-raw--sm5---asm-">dcl_uav_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-structured--sm5---asm-">dcl_uav_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-raw--sm5---asm-">ld_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-structured--sm5---asm-">ld_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-uav-typed--sm5---asm-">ld_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-raw--sm5---asm-">store_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-structured--sm5---asm-">store_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-uav-typed--sm5---asm-">store_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sync--sm5---asm-">sync_uglobal</a>
     * </li>
     * <li>All atomics and immediate atomics (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/atomic-and--sm5---asm-">atomic_and</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/imm-atomic-and--sm5---asm-">imm_atomic_and</a>)</li>
     * </ul>
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled vertex shader.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11VertexShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a> interface. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return <b>S_FALSE</b> instead of <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppVertexShader := 0, "HRESULT")
        return ID3D11VertexShader(ppVertexShader)
    }

    /**
     * Create a geometry shader. (ID3D11Device.CreateGeometryShader)
     * @remarks
     * After it is created, the shader can be set to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshader">ID3D11DeviceContext::GSSetShader</a>.
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, provides the following new functionality for <b>CreateGeometryShader</b>.
     * 
     * The following shader model 5.0 instructions are available to just pixel shaders and compute shaders in the Direct3D 11.0 runtime. For the Direct3D 11.1 runtime, because unordered access views (UAV) are available at all shader stages, you can use these instructions in all shader stages.
     * 
     * Therefore, if you use the following shader model 5.0 instructions in a geometry shader, you can successfully pass the compiled geometry shader to <i>pShaderBytecode</i>. That is, the call to <b>CreateGeometryShader</b> succeeds.
     * 
     * If you pass a compiled shader to <i>pShaderBytecode</i> that uses any of the following instructions on a device that doesn’t support UAVs at every shader stage (including existing drivers that are not implemented to support UAVs at every shader stage), <b>CreateGeometryShader</b> fails.  <b>CreateGeometryShader</b> also fails if the shader tries to use a UAV slot beyond the set of UAV slots that the hardware supports.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-typed--sm5---asm-">dcl_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-raw--sm5---asm-">dcl_uav_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-structured--sm5---asm-">dcl_uav_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-raw--sm5---asm-">ld_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-structured--sm5---asm-">ld_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-uav-typed--sm5---asm-">ld_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-raw--sm5---asm-">store_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-structured--sm5---asm-">store_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-uav-typed--sm5---asm-">store_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sync--sm5---asm-">sync_uglobal</a>
     * </li>
     * <li>All atomics and immediate atomics (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/atomic-and--sm5---asm-">atomic_and</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/imm-atomic-and--sm5---asm-">imm_atomic_and</a>)</li>
     * </ul>
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled geometry shader.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11GeometryShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a> interface. If this is <b>NULL</b>, all other parameters will be validated, and if all
     *         parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
    }

    /**
     * Creates a geometry shader that can write to streaming output buffers. (ID3D11Device.CreateGeometryShaderWithStreamOutput)
     * @remarks
     * For more info about using <b>CreateGeometryShaderWithStreamOutput</b>, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage-getting-started">Create a Geometry-Shader Object with Stream Output</a>.
     *         
     * 
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, provides the following new functionality for <b>CreateGeometryShaderWithStreamOutput</b>.
     *         
     * 
     * The following shader model 5.0 instructions are available to just pixel shaders and compute shaders in the Direct3D 11.0 runtime. For the Direct3D 11.1 runtime, because unordered access views (UAV) are available at all shader stages, you can use these instructions in all shader stages.
     * 
     * Therefore, if you use the following shader model 5.0 instructions in a geometry shader, you can successfully pass the compiled geometry shader to <i>pShaderBytecode</i>. That is, the call to <b>CreateGeometryShaderWithStreamOutput</b> succeeds.
     *         
     * 
     * If you pass a compiled shader to <i>pShaderBytecode</i> that uses any of the following instructions on a device that doesn’t support UAVs at every shader stage (including existing drivers that are not implemented to support UAVs at every shader stage), <b>CreateGeometryShaderWithStreamOutput</b> fails.  <b>CreateGeometryShaderWithStreamOutput</b> also fails if the shader tries to use a UAV slot beyond the set of UAV slots that the hardware supports.
     *         
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-typed--sm5---asm-">dcl_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-raw--sm5---asm-">dcl_uav_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-structured--sm5---asm-">dcl_uav_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-raw--sm5---asm-">ld_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-structured--sm5---asm-">ld_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-uav-typed--sm5---asm-">ld_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-raw--sm5---asm-">store_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-structured--sm5---asm-">store_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-uav-typed--sm5---asm-">store_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sync--sm5---asm-">sync_uglobal</a>
     * </li>
     * <li>All atomics and immediate atomics (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/atomic-and--sm5---asm-">atomic_and</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/imm-atomic-and--sm5---asm-">imm_atomic_and</a>)
     *           </li>
     * </ul>
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled geometry shader for a standard geometry shader plus stream output. For info on how to get this pointer, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * 
     * To create the stream output without using a geometry shader, pass a pointer to the output signature for the prior stage. To obtain this output signature, call the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dgetoutputsignatureblob">D3DGetOutputSignatureBlob</a> compiler function. You can also pass a pointer to the compiled shader for the prior stage (for example, the <a href="https://docs.microsoft.com/previous-versions/bb205146(v=vs.85)">vertex-shader stage</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-tessellation">domain-shader stage</a>). This compiled shader provides the output signature for the data.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled geometry shader.
     * @param {Pointer<D3D11_SO_DECLARATION_ENTRY>} pSODeclaration Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_so_declaration_entry">D3D11_SO_DECLARATION_ENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_so_declaration_entry">D3D11_SO_DECLARATION_ENTRY</a> array. Cannot be <b>NULL</b> if NumEntries &gt; 0.
     * @param {Integer} NumEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the stream output declaration ( ranges from 0 to D3D11_SO_STREAM_COUNT * D3D11_SO_OUTPUT_COMPONENT_COUNT ).
     * @param {Pointer<Integer>} pBufferStrides Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of buffer strides; each stride is the size of an element for that buffer.
     * @param {Integer} NumStrides Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of strides (or buffers) in <i>pBufferStrides</i> (ranges from 0 to D3D11_SO_BUFFER_SLOT_COUNT).
     * @param {Integer} RasterizedStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index number of the stream to be sent to the rasterizer stage (ranges from 0 to D3D11_SO_STREAM_COUNT - 1).
     *               Set to D3D11_SO_NO_RASTERIZED_STREAM if no stream is to be rasterized.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11GeometryShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11geometryshader">ID3D11GeometryShader</a> interface, representing the geometry shader that was created.
     *             Set this to <b>NULL</b> to validate the other parameters; if validation passes, the method will return S_FALSE instead of S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, pBufferStrides, NumStrides, RasterizedStream, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"
        pBufferStridesMarshal := pBufferStrides is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, pBufferStridesMarshal, pBufferStrides, "uint", NumStrides, "uint", RasterizedStream, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
    }

    /**
     * Create a pixel shader. (ID3D11Device.CreatePixelShader)
     * @remarks
     * After creating the pixel shader, you can set it to the device using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshader">ID3D11DeviceContext::PSSetShader</a>.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled pixel shader.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11PixelShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a> interface. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return S_FALSE instead of S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppPixelShader := 0, "HRESULT")
        return ID3D11PixelShader(ppPixelShader)
    }

    /**
     * Create a hull shader.
     * @remarks
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, provides the following new functionality for <b>CreateHullShader</b>.
     * 
     * The following shader model 5.0 instructions are available to just pixel shaders and compute shaders in the Direct3D 11.0 runtime. For the Direct3D 11.1 runtime, because unordered access views (UAV) are available at all shader stages, you can use these instructions in all shader stages.
     * 
     * Therefore, if you use the following shader model 5.0 instructions in a hull shader, you can successfully pass the compiled hull shader to <i>pShaderBytecode</i>. That is, the call to <b>CreateHullShader</b> succeeds.
     * 
     * If you pass a compiled shader to <i>pShaderBytecode</i> that uses any of the following instructions on a device that doesn’t support UAVs at every shader stage (including existing drivers that are not implemented to support UAVs at every shader stage), <b>CreateHullShader</b> fails.  <b>CreateHullShader</b> also fails if the shader tries to use a UAV slot beyond the set of UAV slots that the hardware supports.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-typed--sm5---asm-">dcl_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-raw--sm5---asm-">dcl_uav_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-structured--sm5---asm-">dcl_uav_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-raw--sm5---asm-">ld_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-structured--sm5---asm-">ld_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-uav-typed--sm5---asm-">ld_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-raw--sm5---asm-">store_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-structured--sm5---asm-">store_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-uav-typed--sm5---asm-">store_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sync--sm5---asm-">sync_uglobal</a>
     * </li>
     * <li>All atomics and immediate atomics (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/atomic-and--sm5---asm-">atomic_and</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/imm-atomic-and--sm5---asm-">imm_atomic_and</a>)</li>
     * </ul>
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to a compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled shader.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11HullShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11hullshader">ID3D11HullShader</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createhullshader
     */
    CreateHullShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppHullShader := 0, "HRESULT")
        return ID3D11HullShader(ppHullShader)
    }

    /**
     * Create a domain shader.
     * @remarks
     * The Direct3D 11.1 runtime, which is available starting with Windows 8, provides the following new functionality for <b>CreateDomainShader</b>.
     * 
     * The following shader model 5.0 instructions are available to just pixel shaders and compute shaders in the Direct3D 11.0 runtime. For the Direct3D 11.1 runtime, because unordered access views (UAV) are available at all shader stages, you can use these instructions in all shader stages.
     * 
     * Therefore, if you use the following shader model 5.0 instructions in a domain shader, you can successfully pass the compiled domain shader to <i>pShaderBytecode</i>. That is, the call to <b>CreateDomainShader</b> succeeds.
     * 
     * If you pass a compiled shader to <i>pShaderBytecode</i> that uses any of the following instructions on a device that doesn’t support UAVs at every shader stage (including existing drivers that are not implemented to support UAVs at every shader stage), <b>CreateDomainShader</b> fails.  <b>CreateDomainShader</b> also fails if the shader tries to use a UAV slot beyond the set of UAV slots that the hardware supports.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-typed--sm5---asm-">dcl_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-raw--sm5---asm-">dcl_uav_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dcl-uav-structured--sm5---asm-">dcl_uav_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-raw--sm5---asm-">ld_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-structured--sm5---asm-">ld_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ld-uav-typed--sm5---asm-">ld_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-raw--sm5---asm-">store_raw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-structured--sm5---asm-">store_structured</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/store-uav-typed--sm5---asm-">store_uav_typed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sync--sm5---asm-">sync_uglobal</a>
     * </li>
     * <li>All atomics and immediate atomics (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/atomic-and--sm5---asm-">atomic_and</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/imm-atomic-and--sm5---asm-">imm_atomic_and</a>)</li>
     * </ul>
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to a compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled shader.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a class linkage interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>); the value can be <b>NULL</b>.
     * @returns {ID3D11DomainShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11domainshader">ID3D11DomainShader</a> interface. If this is <b>NULL</b>, all other parameters will be validated, and if all parameters pass validation this API will return <b>S_FALSE</b> instead of <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdomainshader
     */
    CreateDomainShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppDomainShader := 0, "HRESULT")
        return ID3D11DomainShader(ppDomainShader)
    }

    /**
     * Create a compute shader.
     * @remarks
     * For an example, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-compute-create">How To: Create a Compute Shader</a> and <a href="https://msdn.microsoft.com/library/Ee416569(v=VS.85).aspx">HDRToneMappingCS11 Sample</a>.
     * @param {Pointer<Void>} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to a compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of the compiled shader in <i>pShaderBytecode</i>.
     * @param {ID3D11ClassLinkage} pClassLinkage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>, which represents  class linkage interface; the value can be <b>NULL</b>.
     * @returns {ID3D11ComputeShader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11computeshader">ID3D11ComputeShader</a> interface. If this is <b>NULL</b>, 
     *         all other parameters will be validated; if validation passes, CreateComputeShader returns S_FALSE instead of S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcomputeshader
     */
    CreateComputeShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppComputeShader := 0, "HRESULT")
        return ID3D11ComputeShader(ppComputeShader)
    }

    /**
     * Creates class linkage libraries to enable dynamic shader linkage.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a> interface returned in <i>ppLinkage</i> is associated with a shader by passing it as a parameter to one of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> create shader methods such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createpixelshader">ID3D11Device::CreatePixelShader</a>.
     * @returns {ID3D11ClassLinkage} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>**</b>
     * 
     * A pointer to a class-linkage interface pointer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createclasslinkage
     */
    CreateClassLinkage() {
        result := ComCall(19, this, "ptr*", &ppLinkage := 0, "HRESULT")
        return ID3D11ClassLinkage(ppLinkage)
    }

    /**
     * Create a blend-state object that encapsulates blend state for the output-merger stage. (ID3D11Device.CreateBlendState)
     * @remarks
     * An application can create up to 4096 unique blend-state objects. For each object created, the runtime checks to see if a previous object
     *           has the same state. If such a previous object exists, the runtime will return a pointer to previous instance instead of creating a duplicate object.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<D3D11_BLEND_DESC>} pBlendStateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a>*</b>
     * 
     * Pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a>).
     * @returns {ID3D11BlendState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>**</b>
     * 
     * Address of a pointer to the blend-state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createblendstate
     */
    CreateBlendState(pBlendStateDesc) {
        result := ComCall(20, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D11BlendState(ppBlendState)
    }

    /**
     * Create a depth-stencil state object that encapsulates depth-stencil test information for the output-merger stage. (ID3D11Device.CreateDepthStencilState)
     * @remarks
     * 4096 unique depth-stencil state objects can be created on a device at a time.
     * 
     * If an application attempts to create a depth-stencil-state interface with the same state as an existing interface, the same interface will be returned and the total number of unique depth-stencil state objects will stay the same.
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDepthStencilDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>).
     * @returns {ID3D11DepthStencilState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>**</b>
     * 
     * Address of a pointer to the depth-stencil state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc) {
        result := ComCall(21, this, "ptr", pDepthStencilDesc, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D11DepthStencilState(ppDepthStencilState)
    }

    /**
     * Create a rasterizer state object that tells the rasterizer stage how to behave. (ID3D11Device.CreateRasterizerState)
     * @remarks
     * 4096 unique rasterizer state objects can be created on a device at a time.
     * 
     * If an application attempts to create a rasterizer-state interface with the same state as an existing interface, the same interface will be returned and the total number of unique rasterizer state objects will stay the same.
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pRasterizerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>*</b>
     * 
     * Pointer to a rasterizer state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>).
     * @returns {ID3D11RasterizerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>**</b>
     * 
     * Address of a pointer to the rasterizer state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc) {
        result := ComCall(22, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState(ppRasterizerState)
    }

    /**
     * Create a sampler-state object that encapsulates sampling information for a texture. (ID3D11Device.CreateSamplerState)
     * @remarks
     * 4096 unique sampler state objects can be created on a device at a time.
     * 
     * If an application attempts to create a sampler-state interface with the same state as an existing interface, the same interface will be returned and the total number of unique sampler state objects will stay the same.
     * @param {Pointer<D3D11_SAMPLER_DESC>} pSamplerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a>*</b>
     * 
     * Pointer to a sampler state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a>).
     * @returns {ID3D11SamplerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Address of a pointer to the sampler state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc) {
        result := ComCall(23, this, "ptr", pSamplerDesc, "ptr*", &ppSamplerState := 0, "HRESULT")
        return ID3D11SamplerState(ppSamplerState)
    }

    /**
     * This interface encapsulates methods for querying information from the GPU. (ID3D11Device.CreateQuery)
     * @param {Pointer<D3D11_QUERY_DESC>} pQueryDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
     * @returns {ID3D11Query} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a>**</b>
     * 
     * Address of a pointer to the query object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createquery
     */
    CreateQuery(pQueryDesc) {
        result := ComCall(24, this, "ptr", pQueryDesc, "ptr*", &ppQuery := 0, "HRESULT")
        return ID3D11Query(ppQuery)
    }

    /**
     * Creates a predicate. (ID3D11Device.CreatePredicate)
     * @param {Pointer<D3D11_QUERY_DESC>} pPredicateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description where the type of query must be a D3D11_QUERY_SO_OVERFLOW_PREDICATE or D3D11_QUERY_OCCLUSION_PREDICATE (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
     * @returns {ID3D11Predicate} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>**</b>
     * 
     * Address of a pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createpredicate
     */
    CreatePredicate(pPredicateDesc) {
        result := ComCall(25, this, "ptr", pPredicateDesc, "ptr*", &ppPredicate := 0, "HRESULT")
        return ID3D11Predicate(ppPredicate)
    }

    /**
     * Create a counter object for measuring GPU performance. (ID3D11Device.CreateCounter)
     * @param {Pointer<D3D11_COUNTER_DESC>} pCounterDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>*</b>
     * 
     * Pointer to a counter description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>).
     * @returns {ID3D11Counter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a>**</b>
     * 
     * Address of a pointer to a counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createcounter
     */
    CreateCounter(pCounterDesc) {
        result := ComCall(26, this, "ptr", pCounterDesc, "ptr*", &ppCounter := 0, "HRESULT")
        return ID3D11Counter(ppCounter)
    }

    /**
     * Creates a deferred context, which can record command lists. (ID3D11Device.CreateDeferredContext)
     * @remarks
     * A deferred context is a thread-safe context that you can use to record graphics commands on a thread other than the main rendering thread.
     *           Using a deferred context, you can record graphics commands into a command list that is encapsulated by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface.
     *           After all scene items are recorded, you can then submit them to the main render thread for final rendering.
     *           In this manner, you can perform rendering tasks concurrently across multiple threads and potentially improve performance in multi-core CPU scenarios.
     *         
     * 
     * You can create multiple deferred contexts.
     *         
     * 
     * <div class="alert"><b>Note</b>  If you use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_SINGLETHREADED</a> value to create the device that is represented by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>, the <b>CreateDeferredContext</b> method will fail, and you will not be able to create a deferred context.
     *         </div>
     * <div> </div>
     * For more information about deferred contexts, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-render">Immediate and Deferred Rendering</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Integer} ContextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved for future use.
     *             Pass 0.
     * @returns {ID3D11DeviceContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface pointer is initialized.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createdeferredcontext
     */
    CreateDeferredContext(ContextFlags) {
        result := ComCall(27, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext(ppDeferredContext)
    }

    /**
     * Give a device access to a shared resource created on a different device.
     * @remarks
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D11Buffer) will get the GUID of the interface to a buffer resource.
     * 
     * The unique handle of the resource is obtained differently depending on the type of device that originally created the resource.
     * 
     * To share a resource between two Direct3D 11 devices the resource must have been created with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED</a> flag, if it was created using the ID3D11Device interface. 
     *       If it was created using a DXGI device interface, then the resource is always shared.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. 
     *       For example, __uuidof(ID3D11Buffer) will get the GUID of the interface to a buffer resource.
     * 
     * When sharing a resource between two Direct3D 10/11 devices the unique handle of the resource can be obtained by querying the resource for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interface and then calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiresource-getsharedhandle">GetSharedHandle</a>.
     * 
     * 
     * ```
     * 
     * IDXGIResource* pOtherResource(NULL);
     * hr = pOtherDeviceResource->QueryInterface( __uuidof(IDXGIResource), (void**)&pOtherResource );
     * HANDLE sharedHandle;
     * pOtherResource->GetSharedHandle(&sharedHandle);
     *       
     * ```
     * 
     * 
     * The only resources that can be shared are 2D non-mipmapped textures.
     * 
     * To share a resource between a Direct3D 9 device and a Direct3D 11 device the texture must have been created using 
     *       the <i>pSharedHandle</i> argument of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">CreateTexture</a>.  
     *       The shared Direct3D 9 handle is then passed to OpenSharedResource in the <i>hResource</i> argument.
     * 
     * The following code illustrates the method calls involved.
     * 
     * 
     * ```
     * 
     * sharedHandle = NULL; // must be set to NULL to create, can use a valid handle here to open in D3D9 
     * pDevice9->CreateTexture(..., pTex2D_9, &sharedHandle); 
     * ... 
     * pDevice11->OpenSharedResource(sharedHandle, __uuidof(ID3D11Resource), (void**)(&tempResource11)); 
     * tempResource11->QueryInterface(__uuidof(ID3D11Texture2D), (void**)(&pTex2D_11)); 
     * tempResource11->Release(); 
     * // now use pTex2D_11 with pDevice11   
     *       
     * ```
     * 
     * 
     * Textures being shared from D3D9 to D3D11 have the following restrictions.
     * 
     * <ul>
     * <li>Textures must be 2D</li>
     * <li>Only 1 mip level is allowed</li>
     * <li>Texture must have default usage</li>
     * <li>Texture must be write only</li>
     * <li>MSAA textures are not allowed</li>
     * <li>Bind flags must have SHADER_RESOURCE and RENDER_TARGET set</li>
     * <li>Only R10G10B10A2_UNORM, R16G16B16A16_FLOAT and R8G8B8A8_UNORM formats are allowed</li>
     * </ul>
     * If a shared texture is updated on one device <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">ID3D11DeviceContext::Flush</a> must be called on that device.
     * @param {HANDLE} _hResource 
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) for the resource interface. See remarks.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Address of a pointer to the resource we are gaining access to.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-opensharedresource
     */
    OpenSharedResource(_hResource, ReturnedInterface) {
        _hResource := _hResource is Win32Handle ? NumGet(_hResource, "ptr") : _hResource

        result := ComCall(28, this, "ptr", _hResource, "ptr", ReturnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }

    /**
     * Get the support of a given format on the installed video device. (ID3D11Device.CheckFormatSupport)
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> enumeration that describes a format for which to check for support.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A bitfield of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_format_support">D3D11_FORMAT_SUPPORT</a> enumeration values describing how the specified format is supported on the installed device. 
     *         The values are ORed together.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkformatsupport
     */
    CheckFormatSupport(Format) {
        result := ComCall(29, this, "int", Format, "uint*", &pFormatSupport := 0, "HRESULT")
        return pFormatSupport
    }

    /**
     * Get the number of quality levels available during multisampling. (ID3D11Device.CheckMultisampleQualityLevels)
     * @remarks
     * When multisampling a texture, the number of quality levels available for an adapter is dependent on the texture format used and the number of samples requested. The maximum number of quality levels is defined by **D3D11_MAX_MULTISAMPLE_SAMPLE_COUNT** in `D3D11.h`. If this method returns 0 (S_OK), and the output parameter `pNumQualityLevels` receives a positive value, then the format and sample count combination is supported for the device. When the combination is not supported, this method returns a failure **HRESULT** code (that is, a negative integer), or sets `pNumQualityLevels` output parameter to zero, or both.
     * 
     * Furthermore, the definition of a quality level is left to each hardware vendor to define; however no facility is provided by Direct3D to help discover this information.
     * 
     * Note that FEATURE_LEVEL_10_1 devices are required to support 4x MSAA for all render targets except R32G32B32A32 and R32G32B32. FEATURE_LEVEL_11_0 devices are required to support 4x MSAA for all render target formats, and 8x MSAA for all render target formats except R32G32B32A32 formats.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The texture format. See <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     * @param {Integer} SampleCount Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of samples during multisampling.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of quality levels supported by the adapter. See **Remarks**.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount) {
        result := ComCall(30, this, "int", Format, "uint", SampleCount, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
    }

    /**
     * Get a counter's information. (ID3D11Device.CheckCounterInfo)
     * @param {Pointer<D3D11_COUNTER_INFO>} pCounterInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_info">D3D11_COUNTER_INFO</a>*</b>
     * 
     * Pointer to counter information (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_info">D3D11_COUNTER_INFO</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkcounterinfo
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(31, this, "ptr", pCounterInfo)
    }

    /**
     * Get the type, name, units of measure, and a description of an existing counter. (ID3D11Device.CheckCounter)
     * @remarks
     * Length parameters can be <b>NULL</b>, which indicates the application is not interested in the length nor the corresponding string value. When a length parameter is non-<b>NULL</b> and the corresponding string is <b>NULL</b>, the input value of the length parameter is ignored, and the length of the corresponding string (including terminating <b>NULL</b>) will be returned through the length parameter. When length and the corresponding parameter are both non-<b>NULL</b>, the input value of length is checked to ensure there is enough room, and then the length of the string (including terminating <b>NULL</b> character) is passed out through the length parameter.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<D3D11_COUNTER_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>*</b>
     * 
     * Pointer to a counter description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>). Specifies which counter information is to be retrieved about.
     * @param {Pointer<Integer>} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_counter_type">D3D11_COUNTER_TYPE</a>*</b>
     * 
     * Pointer to the data type of a counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_counter_type">D3D11_COUNTER_TYPE</a>). Specifies the data type of the counter being retrieved.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
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
     * Gets information about the features that are supported by the current graphics driver. (ID3D11Device.CheckFeatureSupport)
     * @remarks
     * To query for multi-threading support, pass the <b>D3D11_FEATURE_THREADING</b> value to the <i>Feature</i> parameter, pass 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_threading">D3D11_FEATURE_DATA_THREADING</a> structure to the  <i>pFeatureSupportData</i> parameter, and pass the size of 
     *       the <b>D3D11_FEATURE_DATA_THREADING</b> structure to the <i>FeatureSupportDataSize</i> parameter.
     * 
     * Calling CheckFeatureSupport with <i>Feature</i> set to D3D11_FEATURE_FORMAT_SUPPORT causes the method to return the same information that would be returned 
     *       by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkformatsupport">ID3D11Device::CheckFormatSupport</a>.
     * @param {Integer} Feature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a> enumerated type that describes which feature to query for support.
     * @param {Pointer} pFeatureSupportData Type: <b>void*</b>
     * 
     * Upon completion of the method, the passed structure is filled with data that describes the feature support.
     * @param {Integer} FeatureSupportDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the structure passed to the <i>pFeatureSupportData</i> parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns E_INVALIDARG if an unsupported data type is passed to the <i>pFeatureSupportData</i> parameter 
     *       or a size mismatch is detected for the <i>FeatureSupportDataSize</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(33, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * Get application-defined data from a device.
     * @remarks
     * If the data returned is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or one of its derivative classes, which was previously set by SetPrivateDataInterface, that interface will have its reference count incremented before the private data is returned.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>pData</i> points to, and on output contains the size, in bytes, of the amount of data that <b>GetPrivateData</b> retrieved.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to a buffer that <b>GetPrivateData</b>  fills with data from the device if <i>pDataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set data to a device and associate that data with a guid. (ID3D11Device.SetPrivateData)
     * @remarks
     * The data stored in the device with this method can be retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-getprivatedata">ID3D11Device::GetPrivateData</a>.
     * 
     * The data and guid set with this method will typically be application-defined.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> reports memory leaks by outputting a list of object interface pointers along with their friendly names. The default friendly name is "&lt;unnamed&gt;". You can set the friendly name so that you can determine if the corresponding object interface pointer caused the leak. To set the friendly name, use the <b>SetPrivateData</b> method and the <b>WKPDID_D3DDebugObjectName</b> GUID that is in D3Dcommon.h. For example, to give pContext a friendly name of <i>My name</i>, use the following code:
     * 
     * 
     * ```
     * 
     * static const char c_szName[] = "My name";
     * hr = pContext->SetPrivateData( WKPDID_D3DDebugObjectName, sizeof( c_szName ) - 1, c_szName );
     * 
     * ```
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Pointer to the data to be stored with this device. If pData is <b>NULL</b>, DataSize must also be 0, and any data previously associated with the guid will be destroyed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(35, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid. (ID3D11Device.SetPrivateDataInterface)
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the interface.
     * @param {IUnknown} pData Type: <b>const IUnknown*</b>
     * 
     * Pointer to an IUnknown-derived interface to be associated with the device child.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(36, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the feature level of the hardware device. (ID3D11Device.GetFeatureLevel)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">Feature levels</a> determine the capabilities of your device.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> enumerated type that describes the feature level of the hardware device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getfeaturelevel
     */
    GetFeatureLevel() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * Get the flags used during the call to create the device with D3D11CreateDevice.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A bitfield containing the flags used to create the device. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(38, this, "uint")
        return result
    }

    /**
     * Get the reason why the device was removed. (ID3D11Device.GetDeviceRemovedReason)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
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
     * For more detail on these return codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * Gets an immediate context, which can play back command lists. (ID3D11Device.GetImmediateContext)
     * @remarks
     * The <b>GetImmediateContext</b> method returns an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> object that represents an immediate context which is used to perform rendering that you want immediately submitted to a device. For most applications, an immediate context is the primary object that is used to draw your scene.
     * 
     * The <b>GetImmediateContext</b> method increments the reference count of the immediate context by one. Therefore, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getimmediatecontext
     */
    GetImmediateContext(ppImmediateContext) {
        ComCall(40, this, "ptr*", ppImmediateContext)
    }

    /**
     * Get the exception-mode flags. (ID3D11Device.SetExceptionMode)
     * @remarks
     * Set an exception-mode flag to elevate an error condition to a non-continuable exception. 
     * 
     * Whenever an error occurs, a Direct3D device enters the DEVICEREMOVED state and if the appropriate exception flag has been set, an exception is raised. A raised exception is designed to terminate an application. Before termination, the last chance an application has to persist data is by using an UnhandledExceptionFilter (see <a href="https://docs.microsoft.com/windows/desktop/Debug/structured-exception-handling">Structured Exception Handling</a>). In general, UnhandledExceptionFilters are leveraged to try to persist data when an application is crashing (to disk, for example). Any code that executes during an UnhandledExceptionFilter is not guaranteed to reliably execute (due to possible process corruption). Any data that the UnhandledExceptionFilter manages to persist, before the UnhandledExceptionFilter crashes again, should be treated as suspect, and therefore inspected by a new, non-corrupted process to see if it is usable.
     * @param {Integer} RaiseFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_raise_flag">D3D11_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-setexceptionmode
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(41, this, "uint", RaiseFlags, "HRESULT")
        return result
    }

    /**
     * Get the exception-mode flags. (ID3D11Device.GetExceptionMode)
     * @remarks
     * An exception-mode flag is used to elevate an error condition to a non-continuable exception.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_raise_flag">D3D11_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-getexceptionmode
     */
    GetExceptionMode() {
        result := ComCall(42, this, "uint")
        return result
    }
}
