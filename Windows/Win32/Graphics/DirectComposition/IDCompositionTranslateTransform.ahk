#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects only the offset of a visual along the x-axis and y-axis.
 * @remarks
 * 
  * A translation transform represents the following 3-by-2 matrix:
  * 
  * <img alt="Three-by-two translation matrix" src="./images/translate_transform_3x2matrix.png"/>
  * 
  * The effect is simply to offset the coordinate system by <i>x</i> and <i>y</i>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontranslatetransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTranslateTransform extends IDCompositionTransform{
    /**
     * The interface identifier for IDCompositionTranslateTransform
     * @type {Guid}
     */
    static IID => Guid("{06791122-c6f0-417d-8323-269e987f5954}")

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
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offsetX 
     * @returns {HRESULT} 
     */
    SetOffsetX(offsetX) {
        result := ComCall(4, this, "float", offsetX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offsetY 
     * @returns {HRESULT} 
     */
    SetOffsetY(offsetY) {
        result := ComCall(6, this, "float", offsetY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
