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
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation1(amount) {
        result := ComCall(5, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_4F>} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setcolor
     */
    SetColor(color) {
        result := ComCall(6, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed1(amount) {
        result := ComCall(8, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen1(amount) {
        result := ComCall(10, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue1(amount) {
        result := ComCall(12, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha1(amount) {
        result := ComCall(14, this, "float", amount, "HRESULT")
        return result
    }
}
