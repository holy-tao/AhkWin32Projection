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
     * 
     * @param {Pointer<D2D_VECTOR_4F>} coefficients 
     * @returns {HRESULT} 
     */
    SetCoefficients(coefficients) {
        result := ComCall(4, this, "ptr", coefficients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} clampoutput 
     * @returns {HRESULT} 
     */
    SetClampOutput(clampoutput) {
        result := ComCall(5, this, "int", clampoutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCoefficient1(animation) {
        result := ComCall(6, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Coeffcient1 
     * @returns {HRESULT} 
     */
    SetCoefficient1(Coeffcient1) {
        result := ComCall(7, this, "float", Coeffcient1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCoefficient2(animation) {
        result := ComCall(8, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Coefficient2 
     * @returns {HRESULT} 
     */
    SetCoefficient2(Coefficient2) {
        result := ComCall(9, this, "float", Coefficient2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCoefficient3(animation) {
        result := ComCall(10, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Coefficient3 
     * @returns {HRESULT} 
     */
    SetCoefficient3(Coefficient3) {
        result := ComCall(11, this, "float", Coefficient3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCoefficient4(animation) {
        result := ComCall(12, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Coefficient4 
     * @returns {HRESULT} 
     */
    SetCoefficient4(Coefficient4) {
        result := ComCall(13, this, "float", Coefficient4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
