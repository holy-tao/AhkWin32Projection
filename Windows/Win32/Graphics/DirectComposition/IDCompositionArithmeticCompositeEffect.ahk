#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The arithmetic composite effect is used to combine 2 images using a weighted sum of pixels from the input images.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionArithmeticCompositeEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionArithmeticCompositeEffect
     * @type {Guid}
     */
    static IID => Guid("{3b67dfa8-e3dd-4e61-b640-46c2f3d739dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCoefficients", "SetClampOutput", "SetCoefficient1", "SetCoefficient11", "SetCoefficient2", "SetCoefficient21", "SetCoefficient3", "SetCoefficient31", "SetCoefficient4", "SetCoefficient41"]

    /**
     * 
     * @param {Pointer<D2D_VECTOR_4F>} coefficients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficients
     */
    SetCoefficients(coefficients) {
        result := ComCall(4, this, "ptr", coefficients, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} clampoutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setclampoutput
     */
    SetClampOutput(clampoutput) {
        result := ComCall(5, this, "int", clampoutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient1(float)
     */
    SetCoefficient1(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Coeffcient1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient1(float)
     */
    SetCoefficient11(Coeffcient1) {
        result := ComCall(7, this, "float", Coeffcient1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient2(idcompositionanimation)
     */
    SetCoefficient2(animation) {
        result := ComCall(8, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Coefficient2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient2(idcompositionanimation)
     */
    SetCoefficient21(Coefficient2) {
        result := ComCall(9, this, "float", Coefficient2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient3(float)
     */
    SetCoefficient3(animation) {
        result := ComCall(10, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Coefficient3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient3(float)
     */
    SetCoefficient31(Coefficient3) {
        result := ComCall(11, this, "float", Coefficient3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient4(float)
     */
    SetCoefficient4(animation) {
        result := ComCall(12, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Coefficient4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionarithmeticcompositeeffect-setcoefficient4(float)
     */
    SetCoefficient41(Coefficient4) {
        result := ComCall(13, this, "float", Coefficient4, "HRESULT")
        return result
    }
}
