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
     * 
     * @param {Pointer<D2D_VECTOR_2F>} whitePoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepoint
     */
    SetWhitePoint(whitePoint) {
        result := ComCall(4, this, "ptr", whitePoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} blackPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpoint
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
