#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The arithmetic composite effect is used to combine 2 images using a weighted sum of pixels from the input images.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionaffinetransform2deffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionAffineTransform2DEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionAffineTransform2DEffect
     * @type {Guid}
     */
    static IID => Guid("{0b74b9e8-cdd6-492f-bbbc-5ed32157026d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {HRESULT} 
     */
    SetInterpolationMode(interpolationMode) {
        result := ComCall(4, this, "int", interpolationMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} borderMode 
     * @returns {HRESULT} 
     */
    SetBorderMode(borderMode) {
        result := ComCall(5, this, "int", borderMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transformMatrix 
     * @returns {HRESULT} 
     */
    SetTransformMatrix(transformMatrix) {
        result := ComCall(6, this, "ptr", transformMatrix, "int")
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
    SetTransformMatrixElement(row, column, animation) {
        result := ComCall(7, this, "int", row, "int", column, "ptr", animation, "int")
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
    SetTransformMatrixElement(row, column, value) {
        result := ComCall(8, this, "int", row, "int", column, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetSharpness(animation) {
        result := ComCall(9, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} sharpness 
     * @returns {HRESULT} 
     */
    SetSharpness(sharpness) {
        result := ComCall(10, this, "float", sharpness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
