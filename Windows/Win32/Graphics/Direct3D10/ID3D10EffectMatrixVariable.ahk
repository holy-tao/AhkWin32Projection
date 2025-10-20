#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A matrix-variable interface accesses a matrix.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectmatrixvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectMatrixVariable extends ID3D10EffectVariable{
    /**
     * The interface identifier for ID3D10EffectMatrixVariable
     * @type {Guid}
     */
    static IID => Guid("{50666c24-b82f-4eed-a172-5b6e7e8522e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @returns {HRESULT} 
     */
    SetMatrix(pData) {
        result := ComCall(25, this, "float*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @returns {HRESULT} 
     */
    GetMatrix(pData) {
        result := ComCall(26, this, "float*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetMatrixArray(pData, Offset, Count) {
        result := ComCall(27, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetMatrixArray(pData, Offset, Count) {
        result := ComCall(28, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @returns {HRESULT} 
     */
    SetMatrixTranspose(pData) {
        result := ComCall(29, this, "float*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @returns {HRESULT} 
     */
    GetMatrixTranspose(pData) {
        result := ComCall(30, this, "float*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetMatrixTransposeArray(pData, Offset, Count) {
        result := ComCall(31, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetMatrixTransposeArray(pData, Offset, Count) {
        result := ComCall(32, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
