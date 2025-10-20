#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects the skew of a visual along the x-axis and y-axis. The coordinate system is skewed around the specified center point.
 * @remarks
 * 
  * A skew transform represents the following 3-by-3 matrix: 
  * 
  * <img alt="Three-by-three skew matrix" src="./images/skew_transform_3x3matrix.png"/>
  * 
  * The effect is to slant the coordinate system along the x-axis and y-axis such that a rectangle becomes a parallelogram, and to apply the corresponding translation such that the center point does not move.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionskewtransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSkewTransform extends IDCompositionTransform{
    /**
     * The interface identifier for IDCompositionSkewTransform
     * @type {Guid}
     */
    static IID => Guid("{e57aa735-dcdb-4c72-9c61-0591f58889ee}")

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
    SetAngleX(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angleX 
     * @returns {HRESULT} 
     */
    SetAngleX(angleX) {
        result := ComCall(4, this, "float", angleX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetAngleY(animation) {
        result := ComCall(5, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angleY 
     * @returns {HRESULT} 
     */
    SetAngleY(angleY) {
        result := ComCall(6, this, "float", angleY, "int")
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
