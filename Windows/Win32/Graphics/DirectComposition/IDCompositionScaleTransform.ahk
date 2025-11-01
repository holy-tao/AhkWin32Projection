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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScaleX", "SetScaleX1", "SetScaleY", "SetScaleY1", "SetCenterX", "SetCenterX1", "SetCenterY", "SetCenterY1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscalex(float)
     */
    SetScaleX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} scaleX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscalex(float)
     */
    SetScaleX1(scaleX) {
        result := ComCall(4, this, "float", scaleX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscaley(float)
     */
    SetScaleY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} scaleY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setscaley(float)
     */
    SetScaleY1(scaleY) {
        result := ComCall(6, this, "float", scaleY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(8, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(10, this, "float", centerY, "HRESULT")
        return result
    }
}
