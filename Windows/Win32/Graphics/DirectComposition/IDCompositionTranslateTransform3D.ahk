#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents a 3D transformation that affects the offset of a visual along the x-axis, y-axis, and z-axis.
 * @remarks
 * 
  * A 3D translation transform represents the following 4-by-4 matrix:
  *       
  * 
  * <img alt="Four-by-four translation matrix" src="./images/3D_translate_transform_4x4matrix.png"/>
  * 
  * The effect is to offset the blending position of the visual's subtree by <i>x</i>, <i>y</i>, and <i>z</i>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontranslatetransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTranslateTransform3D extends IDCompositionTransform3D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTranslateTransform3D
     * @type {Guid}
     */
    static IID => Guid("{91636d4b-9ba1-4532-aaf7-e3344994d788}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOffsetX", "SetOffsetX1", "SetOffsetY", "SetOffsetY1", "SetOffsetZ", "SetOffsetZ1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsetx(idcompositionanimation)
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsetx(idcompositionanimation)
     */
    SetOffsetX1(offsetX) {
        result := ComCall(4, this, "float", offsetX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsety(idcompositionanimation)
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsety(idcompositionanimation)
     */
    SetOffsetY1(offsetY) {
        result := ComCall(6, this, "float", offsetY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsetz(float)
     */
    SetOffsetZ(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontranslatetransform3d-setoffsetz(float)
     */
    SetOffsetZ1(offsetZ) {
        result := ComCall(8, this, "float", offsetZ, "HRESULT")
        return result
    }
}
