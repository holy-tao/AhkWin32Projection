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
     * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createbuffer
     */
    CreateBuffer(pDesc, pInitialData) {
        result := ComCall(3, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3D11Buffer(ppBuffer)
    }

    /**
     * Creates an array of 1D textures.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createtexture1d
     */
    CreateTexture1D(pDesc, pInitialData) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture1D := 0, "HRESULT")
        return ID3D11Texture1D(ppTexture1D)
    }

    /**
     * Create an array of 2D textures.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createtexture2d
     */
    CreateTexture2D(pDesc, pInitialData) {
        result := ComCall(5, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D11Texture2D(ppTexture2D)
    }

    /**
     * Create a single 3D texture.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createtexture3d
     */
    CreateTexture3D(pDesc, pInitialData) {
        result := ComCall(6, this, "ptr", pDesc, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D11Texture3D(ppTexture3D)
    }

    /**
     * Create a shader-resource view for accessing data in a resource.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D11ShaderResourceView(ppSRView)
    }

    /**
     * Creates a view for accessing an unordered access resource.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a resources that will serve as an input to a shader.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a> that represents a shader-resource view description. Set this parameter to <b>NULL</b> to create a view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D11UnorderedAccessView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> that represents an unordered-access view. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pDesc) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppUAView := 0, "HRESULT")
        return ID3D11UnorderedAccessView(ppUAView)
    }

    /**
     * Creates a render-target view for accessing resource data.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a render target. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_RENDER_TARGET</a> flag.
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a> that represents a render-target view description. Set this parameter to <b>NULL</b> to create a view that accesses all of the subresources in mipmap level 0.
     * @returns {ID3D11RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppRTView := 0, "HRESULT")
        return ID3D11RenderTargetView(ppRTView)
    }

    /**
     * Create a depth-stencil view for accessing resource data.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to the resource that will serve as the depth-stencil surface. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_DEPTH_STENCIL</a> flag.
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>). Set this parameter to <b>NULL</b> to create a view that accesses mipmap level 0 of the entire resource (using the format the resource was created with).
     * @returns {ID3D11DepthStencilView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilview">ID3D11DepthStencilView</a>. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc) {
        result := ComCall(10, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppDepthStencilView := 0, "HRESULT")
        return ID3D11DepthStencilView(ppDepthStencilView)
    }

    /**
     * Create an input-layout object to describe the input-buffer data for the input-assembler stage.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createinputlayout
     */
    CreateInputLayout(pInputElementDescs, NumElements, pShaderBytecodeWithInputSignature, BytecodeLength) {
        pShaderBytecodeWithInputSignatureMarshal := pShaderBytecodeWithInputSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", pInputElementDescs, "uint", NumElements, pShaderBytecodeWithInputSignatureMarshal, pShaderBytecodeWithInputSignature, "ptr", BytecodeLength, "ptr*", &ppInputLayout := 0, "HRESULT")
        return ID3D11InputLayout(ppInputLayout)
    }

    /**
     * Create a vertex-shader object from a compiled shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createvertexshader
     */
    CreateVertexShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppVertexShader := 0, "HRESULT")
        return ID3D11VertexShader(ppVertexShader)
    }

    /**
     * Create a geometry shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-creategeometryshader
     */
    CreateGeometryShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
    }

    /**
     * Creates a geometry shader that can write to streaming output buffers.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-creategeometryshaderwithstreamoutput
     */
    CreateGeometryShaderWithStreamOutput(pShaderBytecode, BytecodeLength, pSODeclaration, NumEntries, pBufferStrides, NumStrides, RasterizedStream, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"
        pBufferStridesMarshal := pBufferStrides is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pSODeclaration, "uint", NumEntries, pBufferStridesMarshal, pBufferStrides, "uint", NumStrides, "uint", RasterizedStream, "ptr", pClassLinkage, "ptr*", &ppGeometryShader := 0, "HRESULT")
        return ID3D11GeometryShader(ppGeometryShader)
    }

    /**
     * Create a pixel shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createpixelshader
     */
    CreatePixelShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppPixelShader := 0, "HRESULT")
        return ID3D11PixelShader(ppPixelShader)
    }

    /**
     * Create a hull shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createhullshader
     */
    CreateHullShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppHullShader := 0, "HRESULT")
        return ID3D11HullShader(ppHullShader)
    }

    /**
     * Create a domain shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createdomainshader
     */
    CreateDomainShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppDomainShader := 0, "HRESULT")
        return ID3D11DomainShader(ppDomainShader)
    }

    /**
     * Create a compute shader.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createcomputeshader
     */
    CreateComputeShader(pShaderBytecode, BytecodeLength, pClassLinkage) {
        pShaderBytecodeMarshal := pShaderBytecode is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pShaderBytecodeMarshal, pShaderBytecode, "ptr", BytecodeLength, "ptr", pClassLinkage, "ptr*", &ppComputeShader := 0, "HRESULT")
        return ID3D11ComputeShader(ppComputeShader)
    }

    /**
     * Creates class linkage libraries to enable dynamic shader linkage.
     * @returns {ID3D11ClassLinkage} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>**</b>
     * 
     * A pointer to a class-linkage interface pointer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11classlinkage">ID3D11ClassLinkage</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createclasslinkage
     */
    CreateClassLinkage() {
        result := ComCall(19, this, "ptr*", &ppLinkage := 0, "HRESULT")
        return ID3D11ClassLinkage(ppLinkage)
    }

    /**
     * Create a blend-state object that encapsules blend state for the output-merger stage.
     * @param {Pointer<D3D11_BLEND_DESC>} pBlendStateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a>*</b>
     * 
     * Pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a>).
     * @returns {ID3D11BlendState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>**</b>
     * 
     * Address of a pointer to the blend-state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createblendstate
     */
    CreateBlendState(pBlendStateDesc) {
        result := ComCall(20, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D11BlendState(ppBlendState)
    }

    /**
     * Create a depth-stencil state object that encapsulates depth-stencil test information for the output-merger stage.
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDepthStencilDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>).
     * @returns {ID3D11DepthStencilState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>**</b>
     * 
     * Address of a pointer to the depth-stencil state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11depthstencilstate">ID3D11DepthStencilState</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createdepthstencilstate
     */
    CreateDepthStencilState(pDepthStencilDesc) {
        result := ComCall(21, this, "ptr", pDepthStencilDesc, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D11DepthStencilState(ppDepthStencilState)
    }

    /**
     * Create a rasterizer state object that tells the rasterizer stage how to behave.
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pRasterizerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>*</b>
     * 
     * Pointer to a rasterizer state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>).
     * @returns {ID3D11RasterizerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>**</b>
     * 
     * Address of a pointer to the rasterizer state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rasterizerstate">ID3D11RasterizerState</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createrasterizerstate
     */
    CreateRasterizerState(pRasterizerDesc) {
        result := ComCall(22, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState(ppRasterizerState)
    }

    /**
     * Create a sampler-state object that encapsulates sampling information for a texture.
     * @param {Pointer<D3D11_SAMPLER_DESC>} pSamplerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a>*</b>
     * 
     * Pointer to a sampler state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a>).
     * @returns {ID3D11SamplerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>**</b>
     * 
     * Address of a pointer to the sampler state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11samplerstate">ID3D11SamplerState</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createsamplerstate
     */
    CreateSamplerState(pSamplerDesc) {
        result := ComCall(23, this, "ptr", pSamplerDesc, "ptr*", &ppSamplerState := 0, "HRESULT")
        return ID3D11SamplerState(ppSamplerState)
    }

    /**
     * This interface encapsulates methods for querying information from the GPU.
     * @param {Pointer<D3D11_QUERY_DESC>} pQueryDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
     * @returns {ID3D11Query} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a>**</b>
     * 
     * Address of a pointer to the query object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createquery
     */
    CreateQuery(pQueryDesc) {
        result := ComCall(24, this, "ptr", pQueryDesc, "ptr*", &ppQuery := 0, "HRESULT")
        return ID3D11Query(ppQuery)
    }

    /**
     * Creates a predicate.
     * @param {Pointer<D3D11_QUERY_DESC>} pPredicateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description where the type of query must be a D3D11_QUERY_SO_OVERFLOW_PREDICATE or D3D11_QUERY_OCCLUSION_PREDICATE (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
     * @returns {ID3D11Predicate} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>**</b>
     * 
     * Address of a pointer to a predicate (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createpredicate
     */
    CreatePredicate(pPredicateDesc) {
        result := ComCall(25, this, "ptr", pPredicateDesc, "ptr*", &ppPredicate := 0, "HRESULT")
        return ID3D11Predicate(ppPredicate)
    }

    /**
     * Create a counter object for measuring GPU performance.
     * @param {Pointer<D3D11_COUNTER_DESC>} pCounterDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>*</b>
     * 
     * Pointer to a counter description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a>).
     * @returns {ID3D11Counter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a>**</b>
     * 
     * Address of a pointer to a counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createcounter
     */
    CreateCounter(pCounterDesc) {
        result := ComCall(26, this, "ptr", pCounterDesc, "ptr*", &ppCounter := 0, "HRESULT")
        return ID3D11Counter(ppCounter)
    }

    /**
     * Creates a deferred context, which can record command lists.
     * @param {Integer} ContextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved for future use.
     *             Pass 0.
     * @returns {ID3D11DeviceContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface pointer is initialized.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-createdeferredcontext
     */
    CreateDeferredContext(ContextFlags) {
        result := ComCall(27, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext(ppDeferredContext)
    }

    /**
     * Give a device access to a shared resource created on a different device.
     * @param {HANDLE} hResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A resource handle. See remarks.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) for the resource interface. See remarks.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Address of a pointer to the resource we are gaining access to.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-opensharedresource
     */
    OpenSharedResource(hResource, ReturnedInterface) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(28, this, "ptr", hResource, "ptr", ReturnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }

    /**
     * Get the support of a given format on the installed video device.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> enumeration that describes a format for which to check for support.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A bitfield of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_format_support">D3D11_FORMAT_SUPPORT</a> enumeration values describing how the specified format is supported on the installed device. 
     *         The values are ORed together.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-checkformatsupport
     */
    CheckFormatSupport(Format) {
        result := ComCall(29, this, "int", Format, "uint*", &pFormatSupport := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-checkmultisamplequalitylevels
     */
    CheckMultisampleQualityLevels(Format, SampleCount) {
        result := ComCall(30, this, "int", Format, "uint", SampleCount, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
    }

    /**
     * Get a counter's information.
     * @param {Pointer<D3D11_COUNTER_INFO>} pCounterInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_info">D3D11_COUNTER_INFO</a>*</b>
     * 
     * Pointer to counter information (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_info">D3D11_COUNTER_INFO</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-checkcounterinfo
     */
    CheckCounterInfo(pCounterInfo) {
        ComCall(31, this, "ptr", pCounterInfo)
    }

    /**
     * Get the type, name, units of measure, and a description of an existing counter.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-checkcounter
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
     * Gets information about the features that are supported by the current graphics driver.
     * @param {Integer} Feature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a> enumerated type that describes which feature to query for support.
     * @param {Pointer} pFeatureSupportData Type: <b>void*</b>
     * 
     * Upon completion of the method, the passed structure is filled with data that describes the feature support.
     * @param {Integer} FeatureSupportDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the structure passed to the <i>pFeatureSupportData</i> parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns E_INVALIDARG if an unsupported data type is passed to the <i>pFeatureSupportData</i> parameter 
     *       or a size mismatch is detected for the <i>FeatureSupportDataSize</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(33, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * Get application-defined data from a device.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>pData</i> points to, and on output contains the size, in bytes, of the amount of data that <b>GetPrivateData</b> retrieved.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to a buffer that <b>GetPrivateData</b>  fills with data from the device if <i>pDataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
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
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(35, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the interface.
     * @param {IUnknown} pData Type: <b>const IUnknown*</b>
     * 
     * Pointer to an IUnknown-derived interface to be associated with the device child.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(36, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the feature level of the hardware device.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a></b>
     * 
     * A member of the <a href="/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> enumerated type that describes the feature level of the hardware device.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getfeaturelevel
     */
    GetFeatureLevel() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * Get the flags used during the call to create the device with D3D11CreateDevice.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A bitfield containing the flags used to create the device. See <a href="/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(38, this, "uint")
        return result
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * Gets an immediate context, which can play back command lists.
     * @remarks
     * 
     * The <b>GetImmediateContext</b> method returns an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> object that represents an immediate context which is used to perform rendering that you want immediately submitted to a device. For most applications, an immediate context is the primary object that is used to draw your scene.
     * 
     * The <b>GetImmediateContext</b> method increments the reference count of the immediate context by one. Therefore, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * 
     * 
     * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getimmediatecontext
     */
    GetImmediateContext(ppImmediateContext) {
        ComCall(40, this, "ptr*", ppImmediateContext)
    }

    /**
     * Get the exception-mode flags.
     * @param {Integer} RaiseFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_raise_flag">D3D11_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-setexceptionmode
     */
    SetExceptionMode(RaiseFlags) {
        result := ComCall(41, this, "uint", RaiseFlags, "HRESULT")
        return result
    }

    /**
     * Get the exception-mode flags.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that contains one or more exception flags; each flag specifies a condition which will cause an exception to be raised. The flags are listed in <a href="/windows/desktop/api/d3d11/ne-d3d11-d3d11_raise_flag">D3D11_RAISE_FLAG</a>. A default value of 0 means there are no flags.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11device-getexceptionmode
     */
    GetExceptionMode() {
        result := ComCall(42, this, "uint")
        return result
    }
}
