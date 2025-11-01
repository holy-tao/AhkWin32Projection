#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RenderInfo.ahk

/**
 * Enables specification of information for a compute-shader rendering pass.
 * @remarks
 * 
  * The transform changes the state on this render information to specify the compute shader and its dependent resources.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ComputeInfo extends ID2D1RenderInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ComputeInfo
     * @type {Guid}
     */
    static IID => Guid("{5598b14b-9fd7-48b7-9bdb-8f0964eb38bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetComputeShaderConstantBuffer", "SetComputeShader", "SetResourceTexture"]

    /**
     * 
     * @param {Pointer<Integer>} buffer 
     * @param {Integer} bufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshaderconstantbuffer
     */
    SetComputeShaderConstantBuffer(buffer, bufferCount) {
        result := ComCall(7, this, "char*", buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshader
     */
    SetComputeShader(shaderId) {
        result := ComCall(8, this, "ptr", shaderId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textureIndex 
     * @param {ID2D1ResourceTexture} resourceTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(9, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }
}
