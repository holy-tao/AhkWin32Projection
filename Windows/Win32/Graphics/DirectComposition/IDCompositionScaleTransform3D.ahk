#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents a 3D transformation effect that affects the scale of a visual along the x-axis, y-axis, and z-axis. The coordinate system is scaled from the specified center point.
 * @remarks
 * 
  * A 3D scale transform represents the following 4-by-4 matrix:
  * 
  * <img alt="Four-by-four 3D scale matrix" src="./images/3D_scale_transform_4x4matrix.png"/>
  * 
  * The effect is to scale the blending of the visual's subtree up or down, and apply the corresponding translation such that the center point does not move.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionscaletransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionScaleTransform3D extends IDCompositionTransform3D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionScaleTransform3D
     * @type {Guid}
     */
    static IID => Guid("{2a9e9ead-364b-4b15-a7c4-a1997f78b389}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScaleX", "SetScaleX1", "SetScaleY", "SetScaleY1", "SetScaleZ", "SetScaleZ1", "SetCenterX", "SetCenterX1", "SetCenterY", "SetCenterY1", "SetCenterZ", "SetCenterZ1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscalex(idcompositionanimation)
     */
    SetScaleX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} scaleX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscalex(idcompositionanimation)
     */
    SetScaleX1(scaleX) {
        result := ComCall(4, this, "float", scaleX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscaley(float)
     */
    SetScaleY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} scaleY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscaley(float)
     */
    SetScaleY1(scaleY) {
        result := ComCall(6, this, "float", scaleY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscalez(idcompositionanimation)
     */
    SetScaleZ(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} scaleZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setscalez(idcompositionanimation)
     */
    SetScaleZ1(scaleZ) {
        result := ComCall(8, this, "float", scaleZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcenterx(float)
     */
    SetCenterX(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcenterx(float)
     */
    SetCenterX1(centerX) {
        result := ComCall(10, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(12, this, "float", centerY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionscaletransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ1(centerZ) {
        result := ComCall(14, this, "float", centerZ, "HRESULT")
        return result
    }
}
