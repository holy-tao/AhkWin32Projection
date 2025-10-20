#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The color matrix effect alters the RGBA values of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositioncolormatrixeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionColorMatrixEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionColorMatrixEffect
     * @type {Guid}
     */
    static IID => Guid("{c1170a22-3ce2-4966-90d4-55408bfc84c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<D2D_MATRIX_5X4_F>} matrix 
     * @returns {HRESULT} 
     */
    SetMatrix(matrix) {
        result := ComCall(4, this, "ptr", matrix, "int")
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
        result := ComCall(5, this, "int", row, "int", column, "ptr", animation, "int")
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
        result := ComCall(6, this, "int", row, "int", column, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetAlphaMode(mode) {
        result := ComCall(7, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} clamp 
     * @returns {HRESULT} 
     */
    SetClampOutput(clamp) {
        result := ComCall(8, this, "int", clamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
