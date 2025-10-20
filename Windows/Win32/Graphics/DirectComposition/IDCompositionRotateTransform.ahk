#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects the rotation of a visual around the z-axis. The coordinate system is rotated around the specified center point.
 * @remarks
 * 
  * A rotate transform represents the following 3-by-3 matrix:
  * 
  * <img alt="Three-by-three transformation matrix" src="./images/rotate_transform_3x3matrix.png"/>
  * 
  * The effect is to rotate the coordinate system clockwise or counter-clockwise, and to apply the corresponding translation such that the center point does not move.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionrotatetransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionRotateTransform extends IDCompositionTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionRotateTransform
     * @type {Guid}
     */
    static IID => Guid("{641ed83c-ae96-46c5-90dc-32774cc5c6d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAngle", "SetAngle1", "SetCenterX", "SetCenterX1", "SetCenterY", "SetCenterY1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setangle(idcompositionanimation)
     */
    SetAngle(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setangle(idcompositionanimation)
     */
    SetAngle1(angle) {
        result := ComCall(4, this, "float", angle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(6, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setcentery(float)
     */
    SetCenterY(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform-setcentery(float)
     */
    SetCenterY1(centerY) {
        result := ComCall(8, this, "float", centerY, "HRESULT")
        return result
    }
}
