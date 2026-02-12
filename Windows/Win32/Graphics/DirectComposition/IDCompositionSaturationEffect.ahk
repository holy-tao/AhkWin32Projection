#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * This effect is used to alter the saturation of an image. The saturation effect is a specialization of the color matrix effect.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositionsaturationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSaturationEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionSaturationEffect
     * @type {Guid}
     */
    static IID => Guid("{a08debda-3258-4fa4-9f16-9174d3fe93b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSaturation", "SetSaturation1"]

    /**
     * Sets the saturation of the image. (overload 1/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the saturation of the image changes over time. This parameter must not be NULL. You can set the saturation to a value between 0 and 1. If you set it to 1 the output image is fully saturated. If you set it to 0 the output image is monochrome. The saturation value is unitless. The effect calculates a color matrix based on the saturation value (s in the equation here) using the following equation:
     *             
     * <img alt="Matrix equation" src="./images/saturation_formula.png"/>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(idcompositionanimation)
     */
    SetSaturation(animation) {
        result := ComCall(4, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the saturation of the image. (overload 1/2)
     * @param {Float} ratio 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(idcompositionanimation)
     */
    SetSaturation1(ratio) {
        result := ComCall(5, this, "float", ratio, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
