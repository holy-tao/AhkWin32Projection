#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The shadow effect is used to generate a shadow from the alpha channel of an image. The shadow is more opaque for higher alpha values and more transparent for lower alpha values. You can set the amount of blur and the color of the shadow.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionshadoweffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionShadowEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionShadowEffect
     * @type {Guid}
     */
    static IID => Guid("{4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     */
    SetStandardDeviation(amount) {
        result := ComCall(5, this, "float", amount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_4F>} color 
     * @returns {HRESULT} 
     */
    SetColor(color) {
        result := ComCall(6, this, "ptr", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetRed(animation) {
        result := ComCall(7, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     */
    SetRed(amount) {
        result := ComCall(8, this, "float", amount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetGreen(animation) {
        result := ComCall(9, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     */
    SetGreen(amount) {
        result := ComCall(10, this, "float", amount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlue(animation) {
        result := ComCall(11, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     */
    SetBlue(amount) {
        result := ComCall(12, this, "float", amount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetAlpha(animation) {
        result := ComCall(13, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     */
    SetAlpha(amount) {
        result := ComCall(14, this, "float", amount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
