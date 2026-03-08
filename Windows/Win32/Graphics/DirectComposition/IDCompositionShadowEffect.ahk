#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The shadow effect is used to generate a shadow from the alpha channel of an image. The shadow is more opaque for higher alpha values and more transparent for lower alpha values. You can set the amount of blur and the color of the shadow.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionshadoweffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionShadowEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStandardDeviation", "SetStandardDeviation1", "SetColor", "SetRed", "SetRed1", "SetGreen", "SetGreen1", "SetBlue", "SetBlue1", "SetAlpha", "SetAlpha1"]

    /**
     * Sets the amount of blur to be applied to the alpha channel of the image. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the amount of blur to be applied to the alpha channel of the image. (overload 1/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The amount of blur to be applied to the alpha channel of the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3.
     *             The units of both the standard deviation and blur radius are DIPs.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation1(amount) {
        result := ComCall(5, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets color of the shadow.
     * @param {Pointer<D2D_VECTOR_4F>} color Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a></b>
     * 
     * The color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setcolor
     */
    SetColor(color) {
        result := ComCall(6, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * Sets the red value for the color of the shadow. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the red value for the color of the shadow. (overload 2/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The red value for the color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed1(amount) {
        result := ComCall(8, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the green value for the color of the shadow. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the green value for the color of the shadow. (overload 1/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The green value for the color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen1(amount) {
        result := ComCall(10, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the blue value for the color of the shadow. (overload 2/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the blue value for the color of the shadow changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the blue value for the color of the shadow. (overload 2/2)
     * @param {Float} amount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue1(amount) {
        result := ComCall(12, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the alpha value for the effect. (overload 1/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the alpha value for the effect changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the alpha value for the effect. (overload 1/2)
     * @param {Float} amount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha1(amount) {
        result := ComCall(14, this, "float", amount, "HRESULT")
        return result
    }
}
