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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMatrix", "GetMatrix", "SetMatrixArray", "GetMatrixArray", "SetMatrixTranspose", "GetMatrixTranspose", "SetMatrixTransposeArray", "GetMatrixTransposeArray"]

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrix
     */
    SetMatrix(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(25, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrix
     */
    GetMatrix(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(26, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixarray
     */
    SetMatrixArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixarray
     */
    GetMatrixArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(28, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixtranspose
     */
    SetMatrixTranspose(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(29, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixtranspose
     */
    GetMatrixTranspose(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(30, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixtransposearray
     */
    SetMatrixTransposeArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixtransposearray
     */
    GetMatrixTransposeArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(32, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }
}
