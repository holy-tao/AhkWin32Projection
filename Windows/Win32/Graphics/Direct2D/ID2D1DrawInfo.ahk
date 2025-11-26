#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RenderInfo.ahk

/**
 * This interface is used to describe a GPU rendering pass on a vertex or pixel shader. It is passed to ID2D1DrawTransform.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1drawinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DrawInfo extends ID2D1RenderInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DrawInfo
     * @type {Guid}
     */
    static IID => Guid("{693ce632-7f2f-45de-93fe-18d88b37aa21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPixelShaderConstantBuffer", "SetResourceTexture", "SetVertexShaderConstantBuffer", "SetPixelShader", "SetVertexProcessing"]

    /**
     * Sets the constant buffer for this transform's pixel shader.
     * @param {Pointer<Integer>} buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer.
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshaderconstantbuffer
     */
    SetPixelShaderConstantBuffer(buffer, bufferCount) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, bufferMarshal, buffer, "uint", bufferCount, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(8, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }

    /**
     * Sets the constant buffer for this transform's vertex shader.
     * @param {Pointer<Integer>} buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexshaderconstantbuffer
     */
    SetVertexShaderConstantBuffer(buffer, bufferCount) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, bufferMarshal, buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * Set the shader instructions for this transform.
     * @param {Pointer<Guid>} shaderId Type: <b>REFGUID</b>
     * 
     * The resource id for the  shader.
     * @param {Integer} pixelOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_pixel_options">D2D1_PIXEL_OPTIONS</a></b>
     * 
     * Additional information provided to the renderer to indicate the operations the pixel shader does.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshader
     */
    SetPixelShader(shaderId, pixelOptions) {
        result := ComCall(10, this, "ptr", shaderId, "int", pixelOptions, "HRESULT")
        return result
    }

    /**
     * Sets a vertex buffer, a corresponding vertex shader, and options to control how the vertices are to be handled by the Direct2D context.
     * @param {ID2D1VertexBuffer} vertexBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer">ID2D1VertexBuffer</a>*</b>
     * 
     * The vertex buffer, if this is cleared, the default vertex shader and mapping to the transform rectangles will be used.
     * @param {Integer} vertexOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_options">D2D1_VERTEX_OPTIONS</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexprocessing
     */
    SetVertexProcessing(vertexBuffer, vertexOptions, blendDescription, vertexRange, vertexShader) {
        result := ComCall(11, this, "ptr", vertexBuffer, "int", vertexOptions, "ptr", blendDescription, "ptr", vertexRange, "ptr", vertexShader, "HRESULT")
        return result
    }
}
