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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInterpolationMode", "SetBorderMode", "SetTransformMatrix", "SetTransformMatrixElement", "SetTransformMatrixElement1", "SetSharpness", "SetSharpness1"]

    /**
     * Sets the interpolation mode of the effect.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/2d-affine-transform">D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE</a></b>
     * 
     * Specifies the interpolation mode of the effect.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setinterpolationmode
     */
    SetInterpolationMode(interpolationMode) {
        result := ComCall(4, this, "int", interpolationMode, "HRESULT")
        return result
    }

    /**
     * Sets the border mode to use with the effect.
     * @param {Integer} borderMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/2d-affine-transform">D2D1_BORDER_MODE</a></b>
     * 
     * Specifies the border mode to use with the effect.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setbordermode
     */
    SetBorderMode(borderMode) {
        result := ComCall(5, this, "int", borderMode, "HRESULT")
        return result
    }

    /**
     * Sets the transform matrix of the effect.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transformMatrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * Specifies the transform matrix for the effect to use.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrix
     */
    SetTransformMatrix(transformMatrix) {
        result := ComCall(6, this, "ptr", transformMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrixelement(int_int_idcompositionanimation)
     */
    SetTransformMatrixElement(row, column, animation) {
        result := ComCall(7, this, "int", row, "int", column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrixelement(int_int_idcompositionanimation)
     */
    SetTransformMatrixElement1(row, column, value) {
        result := ComCall(8, this, "int", row, "int", column, "float", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setsharpness(float)
     */
    SetSharpness(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} sharpness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setsharpness(float)
     */
    SetSharpness1(sharpness) {
        result := ComCall(10, this, "float", sharpness, "HRESULT")
        return result
    }
}
