#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The color matrix effect alters the RGBA values of a bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect
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
     * @param {Pointer<D2D_MATRIX_5X4_F>} _matrix 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrix
     */
    SetMatrix(_matrix) {
        result := ComCall(4, this, "ptr", _matrix, "HRESULT")
        return result
    }

    /**
     * Sets an element of the color matrix. (overload 1/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_float)
     */
    SetMatrixElement(row, _column, animation) {
        result := ComCall(5, this, "int", row, "int", _column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets an element of the color matrix. (overload 1/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column 
     * @param {Float} value Type: <b>float</b>
     * 
     * The new value of the element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_float)
     */
    SetMatrixElement1(row, _column, value) {
        result := ComCall(6, this, "int", row, "int", _column, "float", value, "HRESULT")
        return result
    }

    /**
     * Sets the alpha mode of the output for the color matrix effect.
     * @param {Integer} _mode 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setalphamode
     */
    SetAlphaMode(_mode) {
        result := ComCall(7, this, "int", _mode, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setclampoutput
     */
    SetClampOutput(clamp) {
        result := ComCall(8, this, "int", clamp, "HRESULT")
        return result
    }
}
