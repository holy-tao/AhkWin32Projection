#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The hue rotate effect alters the hue of an image by applying a color matrix based on the rotation angle.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionhuerotationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionHueRotationEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionHueRotationEffect
     * @type {Guid}
     */
    static IID => Guid("{6db9f920-0770-4781-b0c6-381912f9d167}")

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
    SetAngle(animation) {
        result := ComCall(4, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} amountDegrees 
     * @returns {HRESULT} 
     */
    SetAngle(amountDegrees) {
        result := ComCall(5, this, "float", amountDegrees, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
