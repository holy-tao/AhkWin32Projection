#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_BLEND_DESCRIPTION.ahk" { D2D1_BLEND_DESCRIPTION }
#Import ".\ID2D1VertexBuffer.ahk" { ID2D1VertexBuffer }
#Import ".\D2D1_VERTEX_OPTIONS.ahk" { D2D1_VERTEX_OPTIONS }
#Import ".\ID2D1RenderInfo.ahk" { ID2D1RenderInfo }
#Import ".\ID2D1ResourceTexture.ahk" { ID2D1ResourceTexture }
#Import ".\D2D1_VERTEX_RANGE.ahk" { D2D1_VERTEX_RANGE }
#Import ".\D2D1_PIXEL_OPTIONS.ahk" { D2D1_PIXEL_OPTIONS }

/**
 * This interface is used to describe a GPU rendering pass on a vertex or pixel shader. It is passed to ID2D1DrawTransform.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DrawInfo extends ID2D1RenderInfo {
    /**
     * The interface identifier for ID2D1DrawInfo
     * @type {Guid}
     */
    static IID := Guid("{693ce632-7f2f-45de-93fe-18d88b37aa21}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DrawInfo interfaces
    */
    struct Vtbl extends ID2D1RenderInfo.Vtbl {
        SetPixelShaderConstantBuffer  : IntPtr
        SetResourceTexture            : IntPtr
        SetVertexShaderConstantBuffer : IntPtr
        SetPixelShader                : IntPtr
        SetVertexProcessing           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DrawInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the constant buffer for this transform's pixel shader.
     * @param {Pointer<Integer>} _buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer.
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshaderconstantbuffer
     */
    SetPixelShaderConstantBuffer(_buffer, bufferCount) {
        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, _bufferMarshal, _buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * Sets the resource texture corresponding to the given shader texture index.
     * @param {Integer} textureIndex Type: <b>UINT32</b>
     * 
     * The index of the texture to be bound to the pixel shader.
     * @param {ID2D1ResourceTexture} resourceTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture">ID2D1ResourceTexture</a>*</b>
     * 
     * The created resource texture.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(8, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }

    /**
     * Sets the constant buffer for this transform's vertex shader.
     * @param {Pointer<Integer>} _buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexshaderconstantbuffer
     */
    SetVertexShaderConstantBuffer(_buffer, bufferCount) {
        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, _bufferMarshal, _buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * Set the shader instructions for this transform.
     * @remarks
     * If this call fails, the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a> instance is placed into an error state and will fail to Draw, it will place the context into an error state which can be retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1DeviceContext::EndDraw</a> call.
     * 
     * 
     * 
     * Specifying <i>pixelOptions</i> other than D2D1_PIXEL_OPTIONS_NONE can enable the renderer to perform certain optimizations such as combining various parts of the effect graph together. If this information does not accurately describe the shader, indeterminate rendering artifacts can result.
     * @param {Pointer<Guid>} shaderId Type: <b>REFGUID</b>
     * 
     * The resource id for the  shader.
     * @param {D2D1_PIXEL_OPTIONS} pixelOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_pixel_options">D2D1_PIXEL_OPTIONS</a></b>
     * 
     * Additional information provided to the renderer to indicate the operations the pixel shader does.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshader
     */
    SetPixelShader(shaderId, pixelOptions) {
        result := ComCall(10, this, Guid.Ptr, shaderId, D2D1_PIXEL_OPTIONS, pixelOptions, "HRESULT")
        return result
    }

    /**
     * Sets a vertex buffer, a corresponding vertex shader, and options to control how the vertices are to be handled by the Direct2D context.
     * @remarks
     * The vertex shaders associated with the vertex buffer through the vertex shader GUID must have been loaded through the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadvertexshader">ID2D1EffectContext::LoadVertexShader</a> method before this call is made.
     * 
     * If you pass the vertex option <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_options">D2D1_VERTEX_OPTIONS_DO_NOT_CLEAR</a>, then the method fails unless the blend description is exactly this:
     * 
     * 
     * 
     * 
     * ```cpp
     * D2D1_BLEND_DESCRIPTION blendDesc = 
     *         {
     *             D2D1_BLEND_ONE,
     *             D2D1_BLEND_ZERO,
     *             D2D1_BLEND_OPERATION_ADD,
     * 
     *             D2D1_BLEND_ONE,
     *             D2D1_BLEND_ZERO,
     *             D2D1_BLEND_OPERATION_ADD,
     * 
     *             { 1.0f, 1.0f, 1.0f, 1.0f }
     *         };
     * ```
     * 
     * 
     * If this call fails, the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a> instance is placed into an error state and fails to draw.
     * 
     *   If blendDescription is NULL, a foreground-over blend mode is used.
     * @param {ID2D1VertexBuffer} vertexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer">ID2D1VertexBuffer</a>*</b>
     * 
     * The vertex buffer, if this is cleared, the default vertex shader and mapping to the transform rectangles will be used.
     * @param {D2D1_VERTEX_OPTIONS} vertexOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_options">D2D1_VERTEX_OPTIONS</a></b>
     * 
     * Options that influence how the renderer will interact with the vertex shader.
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} blendDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description">D2D1_BLEND_DESCRIPTION</a>*</b>
     * 
     * How the vertices will be blended with the output texture.
     * @param {Pointer<D2D1_VERTEX_RANGE>} vertexRange Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_range">D2D1_VERTEX_RANGE</a>*</b>
     * 
     * The set of vertices to use from the buffer.
     * @param {Pointer<Guid>} vertexShader Type: <b>GUID*</b>
     * 
     * The GUID of the vertex shader.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexprocessing
     */
    SetVertexProcessing(vertexBuffer, vertexOptions, blendDescription, vertexRange, vertexShader) {
        result := ComCall(11, this, "ptr", vertexBuffer, D2D1_VERTEX_OPTIONS, vertexOptions, D2D1_BLEND_DESCRIPTION.Ptr, blendDescription, D2D1_VERTEX_RANGE.Ptr, vertexRange, Guid.Ptr, vertexShader, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1DrawInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPixelShaderConstantBuffer := CallbackCreate(GetMethod(implObj, "SetPixelShaderConstantBuffer"), flags, 3)
        this.vtbl.SetResourceTexture := CallbackCreate(GetMethod(implObj, "SetResourceTexture"), flags, 3)
        this.vtbl.SetVertexShaderConstantBuffer := CallbackCreate(GetMethod(implObj, "SetVertexShaderConstantBuffer"), flags, 3)
        this.vtbl.SetPixelShader := CallbackCreate(GetMethod(implObj, "SetPixelShader"), flags, 3)
        this.vtbl.SetVertexProcessing := CallbackCreate(GetMethod(implObj, "SetVertexProcessing"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPixelShaderConstantBuffer)
        CallbackFree(this.vtbl.SetResourceTexture)
        CallbackFree(this.vtbl.SetVertexShaderConstantBuffer)
        CallbackFree(this.vtbl.SetPixelShader)
        CallbackFree(this.vtbl.SetVertexProcessing)
    }
}
