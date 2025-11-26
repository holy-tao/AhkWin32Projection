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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWhitePoint", "SetBlackPoint", "SetWhitePointX", "SetWhitePointX1", "SetWhitePointY", "SetWhitePointY1", "SetBlackPointX", "SetBlackPointX1", "SetBlackPointY", "SetBlackPointY1"]

    /**
     * Sets the upper portion of the brightness transfer curve.
     * @param {Pointer<D2D_VECTOR_2F>} whitePoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The upper portion of the brightness transfer curve. The white point adjusts the appearance of the brighter portions of the image. 
     * This vector is for both the x value and the y value, in that order. Each of the values must be between 0 and 1, inclusive.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepoint
     */
    SetWhitePoint(whitePoint) {
        result := ComCall(4, this, "ptr", whitePoint, "HRESULT")
        return result
    }

    /**
     * Specifies the lower portion of the brightness transfer curve for the brightness effect.
     * @param {Pointer<D2D_VECTOR_2F>} blackPoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The lower portion of the brightness transfer curve. The black point adjusts the appearance of the darker portions of the image. The vector is for both the x value and the y value, in that order. Each of the values must be between 0 and 1, inclusive.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpoint
     */
    SetBlackPoint(blackPoint) {
        result := ComCall(5, this, "ptr", blackPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointx(float)
     */
    SetWhitePointX(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} whitePointX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointx(float)
     */
    SetWhitePointX1(whitePointX) {
        result := ComCall(7, this, "float", whitePointX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointy(idcompositionanimation)
     */
    SetWhitePointY(animation) {
        result := ComCall(8, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} whitePointY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointy(idcompositionanimation)
     */
    SetWhitePointY1(whitePointY) {
        result := ComCall(9, this, "float", whitePointY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointx(idcompositionanimation)
     */
    SetBlackPointX(animation) {
        result := ComCall(10, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} blackPointX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointx(idcompositionanimation)
     */
    SetBlackPointX1(blackPointX) {
        result := ComCall(11, this, "float", blackPointX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointy(float)
     */
    SetBlackPointY(animation) {
        result := ComCall(12, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} blackPointY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointy(float)
     */
    SetBlackPointY1(blackPointY) {
        result := ComCall(13, this, "float", blackPointY, "HRESULT")
        return result
    }
}
