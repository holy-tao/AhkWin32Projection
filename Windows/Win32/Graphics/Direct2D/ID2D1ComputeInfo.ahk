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
     * 
     * @param {Pointer<Byte>} buffer 
     * @param {Integer} bufferCount 
     * @returns {HRESULT} 
     */
    SetComputeShaderConstantBuffer(buffer, bufferCount) {
        result := ComCall(7, this, "char*", buffer, "uint", bufferCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @returns {HRESULT} 
     */
    SetComputeShader(shaderId) {
        result := ComCall(8, this, "ptr", shaderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textureIndex 
     * @param {Pointer<ID2D1ResourceTexture>} resourceTexture 
     * @returns {HRESULT} 
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(9, this, "uint", textureIndex, "ptr", resourceTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
