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
     * 
     * @param {Pointer<Integer>} buffer 
     * @param {Integer} bufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshaderconstantbuffer
     */
    SetPixelShaderConstantBuffer(buffer, bufferCount) {
        result := ComCall(7, this, "char*", buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textureIndex 
     * @param {ID2D1ResourceTexture} resourceTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(8, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} buffer 
     * @param {Integer} bufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexshaderconstantbuffer
     */
    SetVertexShaderConstantBuffer(buffer, bufferCount) {
        result := ComCall(9, this, "char*", buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @param {Integer} pixelOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setpixelshader
     */
    SetPixelShader(shaderId, pixelOptions) {
        result := ComCall(10, this, "ptr", shaderId, "int", pixelOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1VertexBuffer} vertexBuffer 
     * @param {Integer} vertexOptions 
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} blendDescription 
     * @param {Pointer<D2D1_VERTEX_RANGE>} vertexRange 
     * @param {Pointer<Guid>} vertexShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawinfo-setvertexprocessing
     */
    SetVertexProcessing(vertexBuffer, vertexOptions, blendDescription, vertexRange, vertexShader) {
        result := ComCall(11, this, "ptr", vertexBuffer, "int", vertexOptions, "ptr", blendDescription, "ptr", vertexRange, "ptr", vertexShader, "HRESULT")
        return result
    }
}
