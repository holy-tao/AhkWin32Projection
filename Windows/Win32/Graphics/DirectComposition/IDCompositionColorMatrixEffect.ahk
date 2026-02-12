#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The color matrix effect alters the RGBA values of a bitmap.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositioncolormatrixeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionColorMatrixEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMatrix", "SetMatrixElement", "SetMatrixElement1", "SetAlphaMode", "SetClampOutput"]

    /**
     * Sets the matrix used by the effect to multiply the RGBA values of the image.
     * @param {Pointer<D2D_MATRIX_5X4_F>} matrix_ Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-5x4-f">D2D1_MATRIX_5X4_F</a></b>
     * 
     * The matrix used by the effect to multiply the RGBA values of the image. The matrix is column major and is applied as shown in the following equation:
     *           
     * 
     * <img alt="Matrix equation" src="./images/color_matrix_formula.png"/>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrix
     */
    SetMatrix(matrix_) {
        result := ComCall(4, this, "ptr", matrix_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets an element of the color matrix. (overload 2/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} column_ Type: <b>int</b>
     * 
     * The column of the element.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the element value changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement(row, column_, animation) {
        result := ComCall(5, this, "int", row, "int", column_, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets an element of the color matrix. (overload 2/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} column_ Type: <b>int</b>
     * 
     * The column of the element.
     * @param {Float} value 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement1(row, column_, value) {
        result := ComCall(6, this, "int", row, "int", column_, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the alpha mode of the output for the color matrix effect.
     * @param {Integer} mode_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/color-matrix">D2D1_COLORMATRIX_ALPHA_MODE</a></b>
     * 
     * The alpha mode of the output for the color matrix effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setalphamode
     */
    SetAlphaMode(mode_) {
        result := ComCall(7, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies whether the effect clamps color values to between 0 and 1 before the effects passes the values to the next effect in the chain.
     * @param {BOOL} clamp Type: <b>BOOL</b>
     * 
     * A boolean value indicating whether the effect clamps color values to between 0 and 1 before the effects passes the values to the next effect in the chain.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setclampoutput
     */
    SetClampOutput(clamp) {
        result := ComCall(8, this, "int", clamp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
