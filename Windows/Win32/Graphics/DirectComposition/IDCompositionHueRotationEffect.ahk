#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The hue rotate effect alters the hue of an image by applying a color matrix based on the rotation angle.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositionhuerotationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionHueRotationEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAngle", "SetAngle1"]

    /**
     * The IDCompositionHueRotationEffect::SetAngle(IDCompositionAnimation) method sets the angle to rotate the hue.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the angle value changes over time. 
     *           The effect calculates a color matrix based on the rotation angle (θ) according to the following matrix equations:
     *           
     * 
     * <img alt="Matrix equation" src="./images/hue_formula.png"/>
     * This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionhuerotationeffect-setangle(idcompositionanimation)
     */
    SetAngle(animation) {
        result := ComCall(4, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDCompositionHueRotationEffect::SetAngle(IDCompositionAnimation) method sets the angle to rotate the hue.
     * @param {Float} amountDegrees 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionhuerotationeffect-setangle(idcompositionanimation)
     */
    SetAngle1(amountDegrees) {
        result := ComCall(5, this, "float", amountDegrees, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
