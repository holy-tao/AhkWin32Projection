#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\ID2D1Effect.ahk" { ID2D1Effect }
#Import ".\D2D1_COLOR_SPACE.ahk" { D2D1_COLOR_SPACE }
#Import ".\ID2D1VertexBuffer.ahk" { ID2D1VertexBuffer }
#Import ".\D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES.ahk" { D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import ".\ID2D1BoundsAdjustmentTransform.ahk" { ID2D1BoundsAdjustmentTransform }
#Import ".\ID2D1BlendTransform.ahk" { ID2D1BlendTransform }
#Import ".\ID2D1ColorContext.ahk" { ID2D1ColorContext }
#Import ".\D2D1_BLEND_DESCRIPTION.ahk" { D2D1_BLEND_DESCRIPTION }
#Import ".\ID2D1OffsetTransform.ahk" { ID2D1OffsetTransform }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\D2D1_FEATURE.ahk" { D2D1_FEATURE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID2D1BorderTransform.ahk" { ID2D1BorderTransform }
#Import ".\D2D1_RESOURCE_TEXTURE_PROPERTIES.ahk" { D2D1_RESOURCE_TEXTURE_PROPERTIES }
#Import "..\Imaging\IWICColorContext.ahk" { IWICColorContext }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ID2D1TransformNode.ahk" { ID2D1TransformNode }
#Import ".\D2D1_VERTEX_BUFFER_PROPERTIES.ahk" { D2D1_VERTEX_BUFFER_PROPERTIES }
#Import ".\ID2D1ResourceTexture.ahk" { ID2D1ResourceTexture }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Provides factory methods and other state management for effect and transform authors. (ID2D1EffectContext)
 * @remarks
 * This interface  is passed to an effect implementation through the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1EffectImpl::Initialize</a> method. In order to prevent applications casually gaining access to this interface, and to separate reference counts between the public and private interfaces, it is not possible to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> between the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> and the <b>ID2D1EffectContext</b>.
 * 
 * Each call to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1Effect::Initialize</a> will be provided a different <b>ID2D1EffectContext</b> interface. This interface tracks resource allocations for the effect. When the effect is released, the corresponding allocations will also be released.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1effectcontext
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1EffectContext extends IUnknown {
    /**
     * The interface identifier for ID2D1EffectContext
     * @type {Guid}
     */
    static IID := Guid("{3d9f916b-27dc-4ad7-b4f1-64945340f563}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1EffectContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDpi                                : IntPtr
        CreateEffect                          : IntPtr
        GetMaximumSupportedFeatureLevel       : IntPtr
        CreateTransformNodeFromEffect         : IntPtr
        CreateBlendTransform                  : IntPtr
        CreateBorderTransform                 : IntPtr
        CreateOffsetTransform                 : IntPtr
        CreateBoundsAdjustmentTransform       : IntPtr
        LoadPixelShader                       : IntPtr
        LoadVertexShader                      : IntPtr
        LoadComputeShader                     : IntPtr
        IsShaderLoaded                        : IntPtr
        CreateResourceTexture                 : IntPtr
        FindResourceTexture                   : IntPtr
        CreateVertexBuffer                    : IntPtr
        FindVertexBuffer                      : IntPtr
        CreateColorContext                    : IntPtr
        CreateColorContextFromFilename        : IntPtr
        CreateColorContextFromWicColorContext : IntPtr
        CheckFeatureSupport                   : IntPtr
        IsBufferPrecisionSupported            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1EffectContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the unit mapping that an effect will use for properties that could be in either dots per inch (dpi) or pixels.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a> is <b>D2D1_UNIT_MODE_PIXELS</b>, both <i>dpiX</i> and <i>dpiY</i> will be set to 96.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * The dpi on the x-axis.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * The dpi on the y-axis.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(3, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * Creates a Direct2D effect for the specified class ID.
     * @remarks
     * The created effect does not reference count the DLL from which the effect was created. If the caller unregisters an effect while this effect is loaded, the resulting behavior is unpredictable.
     * @param {Pointer<Guid>} effectId Type: <b>REFCLSID</b>
     * 
     * The built-in or registered effect ID to create the effect. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/built-in-effects">Built-in Effects</a> for a list of effect IDs.
     * @returns {ID2D1Effect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the effect.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createeffect
     */
    CreateEffect(effectId) {
        result := ComCall(4, this, Guid.Ptr, effectId, "ptr*", &_effect := 0, "HRESULT")
        return ID2D1Effect(_effect)
    }

    /**
     * This indicates the maximum feature level from the provided list which is supported by the device.
     * @param {Pointer<D3D_FEATURE_LEVEL>} featureLevels Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * The feature levels provided by the application.
     * @param {Integer} featureLevelsCount Type: <b>UINT32</b>
     * 
     * The count of feature levels provided by the application
     * @returns {D3D_FEATURE_LEVEL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * The maximum feature level from the <i>featureLevels</i> list which is supported by the D2D device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-getmaximumsupportedfeaturelevel
     */
    GetMaximumSupportedFeatureLevel(featureLevels, featureLevelsCount) {
        featureLevelsMarshal := featureLevels is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, featureLevelsMarshal, featureLevels, "uint", featureLevelsCount, "int*", &maximumSupportedFeatureLevel := 0, "HRESULT")
        return maximumSupportedFeatureLevel
    }

    /**
     * Wraps an effect graph into a single transform node and then inserted into a transform graph. This allows an effect to aggregate other effects.
     * @param {ID2D1Effect} _effect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The effect to be wrapped in a transform node.
     * @returns {ID2D1TransformNode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode">ID2D1TransformNode</a>**</b>
     * 
     * The returned transform node that encapsulates the effect graph.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createtransformnodefromeffect
     */
    CreateTransformNodeFromEffect(_effect) {
        result := ComCall(6, this, "ptr", _effect, "ptr*", &transformNode := 0, "HRESULT")
        return ID2D1TransformNode(transformNode)
    }

    /**
     * This creates a blend transform that can be inserted into a transform graph.
     * @param {Integer} numInputs Type: <b>UINT32</b>
     * 
     * The number of inputs to the blend transform.
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} blendDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description">D2D1_BLEND_DESCRIPTION</a>*</b>
     * 
     * Describes the blend transform that is to be created.
     * @returns {ID2D1BlendTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1blendtransform">ID2D1BlendTransform</a>**</b>
     * 
     * The returned blend transform.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createblendtransform
     */
    CreateBlendTransform(numInputs, blendDescription) {
        result := ComCall(7, this, "uint", numInputs, D2D1_BLEND_DESCRIPTION.Ptr, blendDescription, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BlendTransform(transform)
    }

    /**
     * Creates a transform that extends its input infinitely in every direction based on the passed in extend mode.
     * @param {D2D1_EXTEND_MODE} extendModeX Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the X-axis direction.
     * @param {D2D1_EXTEND_MODE} extendModeY Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the Y-axis direction.
     * @returns {ID2D1BorderTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1bordertransform">ID2D1BorderTransform</a>**</b>
     * 
     * The returned transform.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createbordertransform
     */
    CreateBorderTransform(extendModeX, extendModeY) {
        result := ComCall(8, this, D2D1_EXTEND_MODE, extendModeX, D2D1_EXTEND_MODE, extendModeY, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BorderTransform(transform)
    }

    /**
     * Creates and returns an offset transform.
     * @remarks
     * An offset transform is used to offset an input bitmap without having to insert a rendering pass. An offset transform is automatically inserted by an Affine transform if the transform evaluates to a pixel-aligned transform.
     * @param {POINT} offset Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847948(v=vs.85)">D2D1_POINT_2L</a></b>
     * 
     * The offset amount.
     * @returns {ID2D1OffsetTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1offsettransform">ID2D1OffsetTransform</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an offset transform object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createoffsettransform
     */
    CreateOffsetTransform(offset) {
        result := ComCall(9, this, POINT, offset, "ptr*", &transform := 0, "HRESULT")
        return ID2D1OffsetTransform(transform)
    }

    /**
     * Creates and returns a bounds adjustment transform.
     * @remarks
     * A support transform can be used for two different reasons.
     * 
     * <ul>
     * <li>To indicate that a region of its input image is already transparent black. This can increase efficiency for rendering bitmaps. <div class="alert"><b>Note</b>  If the indicated region does NOT contain only transparent black pixels, then rendering results are undefined.</div>
     * <div> </div>
     * </li>
     * <li>To increase the size of the input image. The expanded area will be treated as transparent black
     * </li>
     * </ul>
     * @param {Pointer<RECT>} outputRectangle Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The initial output rectangle for the bounds adjustment transform.
     * @returns {ID2D1BoundsAdjustmentTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1boundsadjustmenttransform">ID2D1BoundsAdjustmentTransform</a>**</b>
     * 
     * The returned bounds adjustment transform.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createboundsadjustmenttransform
     */
    CreateBoundsAdjustmentTransform(outputRectangle) {
        result := ComCall(10, this, RECT.Ptr, outputRectangle, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BoundsAdjustmentTransform(transform)
    }

    /**
     * Loads the given shader by its unique ID. (ID2D1EffectContext.LoadPixelShader)
     * @remarks
     * The shader you specify must be compiled,  not  in raw HLSL code.
     * @param {Pointer<Guid>} shaderId Type: <b>REFGUID</b>
     * 
     * The unique id that identifies the shader.
     * @param {Pointer<Integer>} shaderBuffer Type: <b>const BYTE*</b>
     * 
     * The buffer that contains the shader to register.
     * @param {Integer} shaderBufferCount Type: <b>UINT32</b>
     * 
     * The size of the shader buffer in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadpixelshader
     */
    LoadPixelShader(shaderId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, Guid.Ptr, shaderId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * Loads the given shader by its unique ID. (ID2D1EffectContext.LoadVertexShader)
     * @remarks
     * The shader you specify must be compiled,  not  in raw HLSL code.
     * @param {Pointer<Guid>} resourceId Type: <b>REFGUID</b>
     * 
     * The unique id that identifies the shader.
     * @param {Pointer<Integer>} shaderBuffer Type: <b>BYTE*</b>
     * 
     * The buffer that contains the shader to register.
     * @param {Integer} shaderBufferCount Type: <b>UINT32</b>
     * 
     * The size of the shader buffer in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadvertexshader
     */
    LoadVertexShader(resourceId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, Guid.Ptr, resourceId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * Loads the given shader by its unique ID. (ID2D1EffectContext.LoadComputeShader)
     * @remarks
     * The shader you specify must be compiled,  not  in raw HLSL code.
     * @param {Pointer<Guid>} resourceId Type: <b>REFGUID</b>
     * 
     * The unique id that identifies the shader.
     * @param {Pointer<Integer>} shaderBuffer Type: <b>BYTE*</b>
     * 
     * The buffer that contains the shader to register.
     * @param {Integer} shaderBufferCount Type: <b>UINT32</b>
     * 
     * The size of the shader buffer in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadcomputeshader
     */
    LoadComputeShader(resourceId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, Guid.Ptr, resourceId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * This tests to see if the given shader is loaded.
     * @param {Pointer<Guid>} shaderId Type: <b>REFGUID</b>
     * 
     * The unique id that identifies the shader.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Whether the shader is loaded.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-isshaderloaded
     */
    IsShaderLoaded(shaderId) {
        result := ComCall(14, this, Guid.Ptr, shaderId, BOOL)
        return result
    }

    /**
     * Creates or finds the given resource texture, depending on whether a resource id is specified.
     * @param {Pointer<Guid>} resourceId Type: <b>const GUID*</b>
     * 
     * An optional pointer to the unique id that identifies the lookup table.
     * @param {Pointer<D2D1_RESOURCE_TEXTURE_PROPERTIES>} resourceTextureProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_resource_texture_properties">D2D1_RESOURCE_TEXTURE_PROPERTIES</a>*</b>
     * 
     * The properties used to create the resource texture.
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * The optional data to be loaded into the resource texture.
     * @param {Pointer<Integer>} strides Type: <b>const UINT32*</b>
     * 
     * An optional pointer to the stride to advance through the resource texture, according to dimension.
     * @param {Integer} dataSize Type: <b>UINT32</b>
     * 
     * The size, in bytes, of the data.
     * @returns {ID2D1ResourceTexture} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture">ID2D1ResourceTexture</a>**</b>
     * 
     * The returned texture that can be used as a resource in a Direct2D effect.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createresourcetexture
     */
    CreateResourceTexture(resourceId, resourceTextureProperties, data, strides, dataSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, Guid.Ptr, resourceId, D2D1_RESOURCE_TEXTURE_PROPERTIES.Ptr, resourceTextureProperties, dataMarshal, data, stridesMarshal, strides, "uint", dataSize, "ptr*", &resourceTexture := 0, "HRESULT")
        return ID2D1ResourceTexture(resourceTexture)
    }

    /**
     * Finds the given resource texture if it has already been created with ID2D1EffectContext::CreateResourceTexture with the same GUID.
     * @param {Pointer<Guid>} resourceId Type: <b>const GUID*</b>
     * 
     * The unique id that identifies the resource texture.
     * @returns {ID2D1ResourceTexture} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture">ID2D1ResourceTexture</a>**</b>
     * 
     * The returned texture that can be used as a resource in a Direct2D effect.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-findresourcetexture
     */
    FindResourceTexture(resourceId) {
        result := ComCall(16, this, Guid.Ptr, resourceId, "ptr*", &resourceTexture := 0, "HRESULT")
        return ID2D1ResourceTexture(resourceTexture)
    }

    /**
     * Creates a vertex buffer or finds a standard vertex buffer and optionally initializes it with vertices.
     * @param {Pointer<D2D1_VERTEX_BUFFER_PROPERTIES>} vertexBufferProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_buffer_properties">D2D1_VERTEX_BUFFER_PROPERTIES</a>*</b>
     * 
     * The properties used to describe the vertex buffer and vertex shader.
     * @param {Pointer<Guid>} resourceId Type: <b>const GUID*</b>
     * 
     * The unique id that identifies the vertex buffer.
     * @param {Pointer<D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES>} customVertexBufferProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_custom_vertex_buffer_properties">D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES</a>*</b>
     * 
     * The properties used to define a custom vertex buffer. If you use a built-in vertex shader, you don't have to specify this property.
     * @returns {ID2D1VertexBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer">ID2D1VertexBuffer</a>**</b>
     * 
     * The returned vertex buffer.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createvertexbuffer
     */
    CreateVertexBuffer(vertexBufferProperties, resourceId, customVertexBufferProperties) {
        result := ComCall(17, this, D2D1_VERTEX_BUFFER_PROPERTIES.Ptr, vertexBufferProperties, Guid.Ptr, resourceId, D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES.Ptr, customVertexBufferProperties, "ptr*", &_buffer := 0, "HRESULT")
        return ID2D1VertexBuffer(_buffer)
    }

    /**
     * This finds the given vertex buffer if it has already been created with ID2D1EffectContext::CreateVertexBuffer with the same GUID.
     * @param {Pointer<Guid>} resourceId Type: <b>const GUID*</b>
     * 
     * The unique id that identifies the vertex buffer.
     * @returns {ID2D1VertexBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer">ID2D1VertexBuffer</a>**</b>
     * 
     * The returned vertex buffer that can be used as a resource in a <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> effect.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-findvertexbuffer
     */
    FindVertexBuffer(resourceId) {
        result := ComCall(18, this, Guid.Ptr, resourceId, "ptr*", &_buffer := 0, "HRESULT")
        return ID2D1VertexBuffer(_buffer)
    }

    /**
     * Creates a color context from a color space.
     * @param {D2D1_COLOR_SPACE} space Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The space  of color context to create.
     * @param {Pointer<Integer>} _profile Type: <b>const BYTE*</b>
     * 
     * A buffer containing the ICC profile bytes used to initialize the color context when <i>space</i> is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_CUSTOM</a>.  For other types, the parameter is ignored and should be set to <b>NULL</b>.
     * @param {Integer} profileSize Type: <b>UINT32</b>
     * 
     * The size in bytes of <i>Profile</i>.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontext
     */
    CreateColorContext(space, _profile, profileSize) {
        _profileMarshal := _profile is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, D2D1_COLOR_SPACE, space, _profileMarshal, _profile, "uint", profileSize, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context by loading it from the specified filename. The profile bytes are the contents of the file specified by filename.
     * @param {PWSTR} filename Type: <b>PCWSTR</b>
     * 
     * The path to the file containing the profile bytes to initialize the color context with.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontextfromfilename
     */
    CreateColorContextFromFilename(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(20, this, "ptr", filename, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context from an IWICColorContext. The D2D1ColorContext space of the resulting context varies, see Remarks for more info. (ID2D1EffectContext.CreateColorContextFromWicColorContext)
     * @remarks
     * The new color context can be used in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a> to initialize the color context of a created bitmap.  The model field of the profile header is inspected to determine whether this profile is sRGB or scRGB and the color space is updated respectively.  Otherwise the space is  custom.
     * @param {IWICColorContext} wicColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> used to initialize the color context.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontextfromwiccolorcontext
     */
    CreateColorContextFromWicColorContext(wicColorContext) {
        result := ComCall(21, this, "ptr", wicColorContext, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * This indicates whether an optional capability is supported by the D3D device.
     * @param {D2D1_FEATURE} feature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_feature">D2D1_FEATURE</a></b>
     * 
     * The feature to query support for.
     * @param {Integer} featureSupportData Type: <b>void*</b>
     * 
     * A structure indicating information about how or if the feature is supported.
     * @param {Integer} featureSupportDataSize Type: <b>UINT32</b>
     * 
     * The size of the <i>featureSupportData</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport
     */
    CheckFeatureSupport(feature, featureSupportData, featureSupportDataSize) {
        result := ComCall(22, this, D2D1_FEATURE, feature, "ptr", featureSupportData, "uint", featureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * Indicates whether the buffer precision is supported by the underlying Direct2D device.
     * @param {D2D1_BUFFER_PRECISION} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The buffer precision to check.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the buffer precision is supported.  Returns FALSE if the buffer precision is not supported.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-isbufferprecisionsupported
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(23, this, D2D1_BUFFER_PRECISION, bufferPrecision, BOOL)
        return result
    }

    Query(iid) {
        if (ID2D1EffectContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDpi := CallbackCreate(GetMethod(implObj, "GetDpi"), flags, 3)
        this.vtbl.CreateEffect := CallbackCreate(GetMethod(implObj, "CreateEffect"), flags, 3)
        this.vtbl.GetMaximumSupportedFeatureLevel := CallbackCreate(GetMethod(implObj, "GetMaximumSupportedFeatureLevel"), flags, 4)
        this.vtbl.CreateTransformNodeFromEffect := CallbackCreate(GetMethod(implObj, "CreateTransformNodeFromEffect"), flags, 3)
        this.vtbl.CreateBlendTransform := CallbackCreate(GetMethod(implObj, "CreateBlendTransform"), flags, 4)
        this.vtbl.CreateBorderTransform := CallbackCreate(GetMethod(implObj, "CreateBorderTransform"), flags, 4)
        this.vtbl.CreateOffsetTransform := CallbackCreate(GetMethod(implObj, "CreateOffsetTransform"), flags, 3)
        this.vtbl.CreateBoundsAdjustmentTransform := CallbackCreate(GetMethod(implObj, "CreateBoundsAdjustmentTransform"), flags, 3)
        this.vtbl.LoadPixelShader := CallbackCreate(GetMethod(implObj, "LoadPixelShader"), flags, 4)
        this.vtbl.LoadVertexShader := CallbackCreate(GetMethod(implObj, "LoadVertexShader"), flags, 4)
        this.vtbl.LoadComputeShader := CallbackCreate(GetMethod(implObj, "LoadComputeShader"), flags, 4)
        this.vtbl.IsShaderLoaded := CallbackCreate(GetMethod(implObj, "IsShaderLoaded"), flags, 2)
        this.vtbl.CreateResourceTexture := CallbackCreate(GetMethod(implObj, "CreateResourceTexture"), flags, 7)
        this.vtbl.FindResourceTexture := CallbackCreate(GetMethod(implObj, "FindResourceTexture"), flags, 3)
        this.vtbl.CreateVertexBuffer := CallbackCreate(GetMethod(implObj, "CreateVertexBuffer"), flags, 5)
        this.vtbl.FindVertexBuffer := CallbackCreate(GetMethod(implObj, "FindVertexBuffer"), flags, 3)
        this.vtbl.CreateColorContext := CallbackCreate(GetMethod(implObj, "CreateColorContext"), flags, 5)
        this.vtbl.CreateColorContextFromFilename := CallbackCreate(GetMethod(implObj, "CreateColorContextFromFilename"), flags, 3)
        this.vtbl.CreateColorContextFromWicColorContext := CallbackCreate(GetMethod(implObj, "CreateColorContextFromWicColorContext"), flags, 3)
        this.vtbl.CheckFeatureSupport := CallbackCreate(GetMethod(implObj, "CheckFeatureSupport"), flags, 4)
        this.vtbl.IsBufferPrecisionSupported := CallbackCreate(GetMethod(implObj, "IsBufferPrecisionSupported"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDpi)
        CallbackFree(this.vtbl.CreateEffect)
        CallbackFree(this.vtbl.GetMaximumSupportedFeatureLevel)
        CallbackFree(this.vtbl.CreateTransformNodeFromEffect)
        CallbackFree(this.vtbl.CreateBlendTransform)
        CallbackFree(this.vtbl.CreateBorderTransform)
        CallbackFree(this.vtbl.CreateOffsetTransform)
        CallbackFree(this.vtbl.CreateBoundsAdjustmentTransform)
        CallbackFree(this.vtbl.LoadPixelShader)
        CallbackFree(this.vtbl.LoadVertexShader)
        CallbackFree(this.vtbl.LoadComputeShader)
        CallbackFree(this.vtbl.IsShaderLoaded)
        CallbackFree(this.vtbl.CreateResourceTexture)
        CallbackFree(this.vtbl.FindResourceTexture)
        CallbackFree(this.vtbl.CreateVertexBuffer)
        CallbackFree(this.vtbl.FindVertexBuffer)
        CallbackFree(this.vtbl.CreateColorContext)
        CallbackFree(this.vtbl.CreateColorContextFromFilename)
        CallbackFree(this.vtbl.CreateColorContextFromWicColorContext)
        CallbackFree(this.vtbl.CheckFeatureSupport)
        CallbackFree(this.vtbl.IsBufferPrecisionSupported)
    }
}
