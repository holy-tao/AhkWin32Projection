#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionmatrixtransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionMatrixTransform extends IDCompositionTransform{
    /**
     * The interface identifier for IDCompositionMatrixTransform
     * @type {Guid}
     */
    static IID => Guid("{16cdff07-c503-419c-83f2-0965c7af1fa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix 
     * @returns {HRESULT} 
     */
    SetMatrix(matrix) {
        result := ComCall(3, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetMatrixElement(row, column, animation) {
        result := ComCall(4, this, "int", row, "int", column, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetMatrixElement(row, column, value) {
        result := ComCall(5, this, "int", row, "int", column, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
