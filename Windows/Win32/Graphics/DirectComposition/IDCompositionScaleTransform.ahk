#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects the scale of a visual along the x-axis and y-axis. The coordinate system is scaled from the specified center point.
 * @remarks
 * 
  * A scale transform represents the following 3-by-3 matrix:
  * 
  * <img alt="Three-by-three scale matrix" src="./images/scale_transform_3x3matrix.png"/>
  * 
  * The effect is to scale the coordinate system up or down and apply the corresponding translation such that the center point does not move.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionscaletransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionScaleTransform extends IDCompositionTransform{
    /**
     * The interface identifier for IDCompositionScaleTransform
     * @type {Guid}
     */
    static IID => Guid("{71fde914-40ef-45ef-bd51-68b037c339f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetScaleX(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} scaleX 
     * @returns {HRESULT} 
     */
    SetScaleX(scaleX) {
        result := ComCall(4, this, "float", scaleX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetScaleY(animation) {
        result := ComCall(5, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} scaleY 
     * @returns {HRESULT} 
     */
    SetScaleY(scaleY) {
        result := ComCall(6, this, "float", scaleY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCenterX(animation) {
        result := ComCall(7, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} centerX 
     * @returns {HRESULT} 
     */
    SetCenterX(centerX) {
        result := ComCall(8, this, "float", centerX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetCenterY(animation) {
        result := ComCall(9, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} centerY 
     * @returns {HRESULT} 
     */
    SetCenterY(centerY) {
        result := ComCall(10, this, "float", centerY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
