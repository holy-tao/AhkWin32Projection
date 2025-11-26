#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Texture2D1.ahk
#Include .\ID3D11Texture3D1.ahk
#Include .\ID3D11RasterizerState2.ahk
#Include .\ID3D11ShaderResourceView1.ahk
#Include .\ID3D11UnorderedAccessView1.ahk
#Include .\ID3D11RenderTargetView1.ahk
#Include .\ID3D11Query1.ahk
#Include .\ID3D11DeviceContext3.ahk
#Include .\ID3D11Device2.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device3 adds new methods to those in ID3D11Device2.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11device3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device3 extends ID3D11Device2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device3
     * @type {Guid}
     */
    static IID => Guid("{a05c8c37-d2c6-4732-b3a0-9ce0b0dc9ae6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 54

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTexture2D1", "CreateTexture3D1", "CreateRasterizerState2", "CreateShaderResourceView1", "CreateUnorderedAccessView1", "CreateRenderTargetView1", "CreateQuery1", "GetImmediateContext3", "CreateDeferredContext3", "WriteToSubresource", "ReadFromSubresource"]

    /**
     * Creates a 2D texture.
     * @param {Pointer<D3D11_TEXTURE2D_DESC1>} pDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture2d_desc1">D3D11_TEXTURE2D_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture2d_desc1">D3D11_TEXTURE2D_DESC1</a> structure that describes a 2D texture resource. To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     *  A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures that describe subresources for the 2D texture resource. Applications can't specify <b>NULL</b> for <i>pInitialData</i> when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>). If the resource is multisampled, <i>pInitialData</i> must be <b>NULL</b> because multisampled resources can't be initialized with data when they're created.
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the resource is undefined. In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from values in the <b>MipLevels</b> and <b>ArraySize</b> members of the <b>D3D11_TEXTURE2D_DESC1</b> structure to which <i>pDesc1</i> points by using the following calculation:
     * 
     * MipLevels * ArraySize
     * 
     * For more info about this array size, see Remarks.
     * @returns {ID3D11Texture2D1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11texture2d1">ID3D11Texture2D1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11texture2d1">ID3D11Texture2D1</a> interface for the created texture. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createtexture2d1
     */
    CreateTexture2D1(pDesc1, pInitialData) {
        result := ComCall(54, this, "ptr", pDesc1, "ptr", pInitialData, "ptr*", &ppTexture2D := 0, "HRESULT")
        return ID3D11Texture2D1(ppTexture2D)
    }

    /**
     * Creates a 3D texture.
     * @param {Pointer<D3D11_TEXTURE3D_DESC1>} pDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture3d_desc1">D3D11_TEXTURE3D_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture3d_desc1">D3D11_TEXTURE3D_DESC1</a> structure that describes a 3D texture resource. To create a typeless resource that can be interpreted at runtime into different, compatible formats, specify a typeless format in the texture description. To generate mipmap levels automatically, set the number of mipmap levels to 0.
     * @param {Pointer<D3D11_SUBRESOURCE_DATA>} pInitialData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_subresource_data">D3D11_SUBRESOURCE_DATA</a> structures that describe subresources for the 3D texture resource. Applications can't specify <b>NULL</b> for <i>pInitialData</i> when creating IMMUTABLE resources (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>). If the resource is multisampled, <i>pInitialData</i> must be <b>NULL</b> because multisampled resources can't be initialized with data when they are created.
     * 
     * If you don't pass anything to <i>pInitialData</i>, the initial content of the memory for the resource is undefined. In this case, you need to write the resource content some other way before the resource is read.
     * 
     * You can determine the size of this array from the value in the <b>MipLevels</b> member of the <b>D3D11_TEXTURE3D_DESC1</b> structure to which <i>pDesc1</i> points. Arrays of 3D volume textures aren't supported.
     * 
     * For more information about this array size, see Remarks.
     * @returns {ID3D11Texture3D1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11texture3d1">ID3D11Texture3D1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11texture3d1">ID3D11Texture3D1</a> interface for the created texture. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createtexture3d1
     */
    CreateTexture3D1(pDesc1, pInitialData) {
        result := ComCall(55, this, "ptr", pDesc1, "ptr", pInitialData, "ptr*", &ppTexture3D := 0, "HRESULT")
        return ID3D11Texture3D1(ppTexture3D)
    }

    /**
     * Creates a rasterizer state object that informs the rasterizer stage how to behave and forces the sample count while UAV rendering or rasterizing.
     * @param {Pointer<D3D11_RASTERIZER_DESC2>} pRasterizerDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_rasterizer_desc2">D3D11_RASTERIZER_DESC2</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_rasterizer_desc2">D3D11_RASTERIZER_DESC2</a> structure that describes the  rasterizer state.
     * @returns {ID3D11RasterizerState2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11rasterizerstate2">ID3D11RasterizerState2</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11rasterizerstate2">ID3D11RasterizerState2</a> interface for the created rasterizer state object. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2
     */
    CreateRasterizerState2(pRasterizerDesc) {
        result := ComCall(56, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState2(ppRasterizerState)
    }

    /**
     * Creates a shader-resource view for accessing data in a resource.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to the resource that will serve as input to a shader. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_SHADER_RESOURCE</a> flag.
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC1>} pDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_shader_resource_view_desc1">D3D11_SHADER_RESOURCE_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_shader_resource_view_desc1">D3D11_SHADER_RESOURCE_VIEW_DESC1</a> structure that describes a shader-resource view. Set this parameter to <b>NULL</b> to create a 
     *         view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D11ShaderResourceView1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11shaderresourceview1">ID3D11ShaderResourceView1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11shaderresourceview1">ID3D11ShaderResourceView1</a> interface for the created shader-resource view. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1
     */
    CreateShaderResourceView1(pResource, pDesc1) {
        result := ComCall(57, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppSRView1 := 0, "HRESULT")
        return ID3D11ShaderResourceView1(ppSRView1)
    }

    /**
     * Creates a view for accessing an unordered access resource.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a resources that will serve as an input to a shader.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC1>} pDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a> structure that represents an unordered-access view description. Set this parameter to <b>NULL</b> to create a view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D11UnorderedAccessView1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11unorderedaccessview1">ID3D11UnorderedAccessView1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11unorderedaccessview1">ID3D11UnorderedAccessView1</a> interface for the created unordered-access view. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1
     */
    CreateUnorderedAccessView1(pResource, pDesc1) {
        result := ComCall(58, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppUAView1 := 0, "HRESULT")
        return ID3D11UnorderedAccessView1(ppUAView1)
    }

    /**
     * Creates a render-target view for accessing resource data.
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> that represents a render target. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_RENDER_TARGET</a> flag.
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC1>} pDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1">D3D11_RENDER_TARGET_VIEW_DESC1</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1">D3D11_RENDER_TARGET_VIEW_DESC1</a> that represents a render-target view description. Set this parameter to <b>NULL</b> to create a view that accesses all of the subresources in mipmap level 0.
     * @returns {ID3D11RenderTargetView1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11rendertargetview1">ID3D11RenderTargetView1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11rendertargetview1">ID3D11RenderTargetView1</a> interface for the created render-target view. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1
     */
    CreateRenderTargetView1(pResource, pDesc1) {
        result := ComCall(59, this, "ptr", pResource, "ptr", pDesc1, "ptr*", &ppRTView1 := 0, "HRESULT")
        return ID3D11RenderTargetView1(ppRTView1)
    }

    /**
     * Creates a query object for querying information from the graphics processing unit (GPU).
     * @param {Pointer<D3D11_QUERY_DESC1>} pQueryDesc1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_query_desc1">D3D11_QUERY_DESC1</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_query_desc1">D3D11_QUERY_DESC1</a> structure that represents a query description.
     * @returns {ID3D11Query1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11query1">ID3D11Query1</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11query1">ID3D11Query1</a> interface for the created query object. Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return <b>S_FALSE</b> if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createquery1
     */
    CreateQuery1(pQueryDesc1) {
        result := ComCall(60, this, "ptr", pQueryDesc1, "ptr*", &ppQuery1 := 0, "HRESULT")
        return ID3D11Query1(ppQuery1)
    }

    /**
     * Gets an immediate context, which can play back command lists.
     * @remarks
     * 
     * The
     *           <b>GetImmediateContext3</b>method outputs an
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11devicecontext3">ID3D11DeviceContext3</a>object that represents an immediate context, which is used to perform rendering that you want immediately submitted to a device.
     *           For most apps, an immediate context is the primary object that is used to draw your scene.
     *         
     * 
     * The <b>GetImmediateContext3</b> method increments the reference count of the immediate context by one.
     *           Therefore, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * 
     * 
     * @param {Pointer<ID3D11DeviceContext3>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11devicecontext3">ID3D11DeviceContext3</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11devicecontext3">ID3D11DeviceContext3</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-getimmediatecontext3
     */
    GetImmediateContext3(ppImmediateContext) {
        ComCall(61, this, "ptr*", ppImmediateContext)
    }

    /**
     * Creates a deferred context, which can record command lists.
     * @param {Integer} ContextFlags Type: <b>UINT</b>
     * 
     * Reserved for future use.  Pass 0.
     * @returns {ID3D11DeviceContext3} Type: <b>ID3D11DeviceContext3**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11devicecontext3">ID3D11DeviceContext3</a> interface pointer is initialized.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-createdeferredcontext3
     */
    CreateDeferredContext3(ContextFlags) {
        result := ComCall(62, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext3(ppDeferredContext)
    }

    /**
     * Copies data into a D3D11_USAGE_DEFAULTtexture which was mapped using ID3D11DeviceContext3::Mapwhile providing a NULL D3D11_MAPPED_SUBRESOURCEparameter.
     * @remarks
     * 
     * The provided resource must be a
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a>texture which was mapped for writing by a previous call to
     *           ID3D11DeviceContext3::<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">Map</a>while providing a NULL
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_mapped_subresource">D3D11_MAPPED_SUBRESOURCE</a>parameter.
     *         
     * 
     * This API is intended for calling at high frequency.
     *           Callers can reduce memory by making iterative calls that update progressive regions of the texture, while provide a small buffer during each call.
     *           It is most efficient to specify large enough regions, though, because this enables D3D to fill whole cache lines in the texture before returning.
     *         
     * 
     * For efficiency, ensure the bounds and alignment of the extents within the box are ( 64 / [bytes per pixel] ) pixels horizontally.
     *           Vertical bounds and alignment should be 2 rows, except when 1-byte-per-pixel formats are used, in which case 4 rows are recommended.
     *           Single depth slices per call are handled efficiently.
     *           It is recommended but not necessary to provide pointers and strides which are 128-byte aligned.
     *         
     * 
     * When writing to sub mipmap levels, it is recommended to use larger width and heights than described above.
     *           This is because small mipmap levels may actually be stored within a larger block of memory, with an opaque amount of offsetting which can interfere with alignment to cache lines.
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination resource (an
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>).
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource.
     *             For more details, see
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a>.
     * @param {Pointer<D3D11_BOX>} pDstBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data into.
     *               If NULL, the data is written to the destination subresource with no offset.
     *               The dimensions of the source must fit the destination (see
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>).
     *             
     * 
     * An empty box results in a no-op.
     *               A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value.
     *               When the box is empty, this method doesn't perform any operation.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-writetosubresource
     */
    WriteToSubresource(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(63, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch)
    }

    /**
     * Copies data from a D3D11_USAGE_DEFAULTtexture which was mapped using ID3D11DeviceContext3::Mapwhile providing a NULL D3D11_MAPPED_SUBRESOURCEparameter.
     * @remarks
     * 
     * The provided resource must be a
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a>texture which was mapped for writing by a previous call to
     *           ID3D11DeviceContext3::<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">Map</a>while providing a NULL
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_mapped_subresource">D3D11_MAPPED_SUBRESOURCE</a>parameter.
     *         
     * 
     * This API is intended for calling at high frequency.
     *           Callers can reduce memory by making iterative calls that update progressive regions of the texture, while provide a small buffer during each call.
     *           It is most efficient to specify large enough regions, though, because this enables D3D to fill whole cache lines in the texture before returning.
     *         
     * 
     * For efficiency, ensure the bounds and alignment of the extents within the box are ( 64 / [Bytes per pixel] ) pixels horizontally.
     *           Vertical bounds and alignment should be 2 rows, except when 1-byte-per-pixel formats are used, in which case 4 rows are recommended.
     *           Single depth slices per call are handled efficiently.
     *           It is recommended but not necessary to provide pointers and strides which are 128-byte aligned.
     *         
     * 
     * When reading from sub mipmap levels, it is recommended to use larger width and heights than described above.
     *           This is because small mipmap levels may actually be stored within a larger block of memory, with an opaque amount of offseting which can interfere with alignment to cache lines.
     * 
     * 
     * @param {Pointer<Void>} pDstData Type: <b>void*</b>
     * 
     * A pointer to the destination data in memory.
     * @param {Integer} DstRowPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one row of the destination data.
     * @param {Integer} DstDepthPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one depth slice of destination data.
     * @param {ID3D11Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the source resource (see
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>).
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index, that identifies the destination subresource.
     *             For more details, see
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a>.
     * @param {Pointer<D3D11_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data from.
     *               If NULL, the data is read from the destination subresource with no offset.
     *               The dimensions of the destination must fit the destination (see
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>).
     *             
     * 
     * An empty box results in a no-op.
     *               A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value.
     *               When the box is empty, this method doesn't perform any operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11device3-readfromsubresource
     */
    ReadFromSubresource(pDstData, DstRowPitch, DstDepthPitch, pSrcResource, SrcSubresource, pSrcBox) {
        pDstDataMarshal := pDstData is VarRef ? "ptr" : "ptr"

        ComCall(64, this, pDstDataMarshal, pDstData, "uint", DstRowPitch, "uint", DstDepthPitch, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox)
    }
}
