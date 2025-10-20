#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The brightness effect controls the brightness of the image.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionbrightnesseffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionBrightnessEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionBrightnessEffect
     * @type {Guid}
     */
    static IID => Guid("{6027496e-cb3a-49ab-934f-d798da4f7da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} whitePoint 
     * @returns {HRESULT} 
     */
    SetWhitePoint(whitePoint) {
        result := ComCall(4, this, "ptr", whitePoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} blackPoint 
     * @returns {HRESULT} 
     */
    SetBlackPoint(blackPoint) {
        result := ComCall(5, this, "ptr", blackPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetWhitePointX(animation) {
        result := ComCall(6, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} whitePointX 
     * @returns {HRESULT} 
     */
    SetWhitePointX(whitePointX) {
        result := ComCall(7, this, "float", whitePointX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetWhitePointY(animation) {
        result := ComCall(8, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} whitePointY 
     * @returns {HRESULT} 
     */
    SetWhitePointY(whitePointY) {
        result := ComCall(9, this, "float", whitePointY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlackPointX(animation) {
        result := ComCall(10, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} blackPointX 
     * @returns {HRESULT} 
     */
    SetBlackPointX(blackPointX) {
        result := ComCall(11, this, "float", blackPointX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetBlackPointY(animation) {
        result := ComCall(12, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} blackPointY 
     * @returns {HRESULT} 
     */
    SetBlackPointY(blackPointY) {
        result := ComCall(13, this, "float", blackPointY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
