#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents a 3D transformation that affects the rotation of a visual along an arbitrary axis in 3D space. The coordinate system is rotated around the specified center point.
 * @remarks
 * 
  * A 3D rotate transform represents the following 4-by-4 matrix:
  * 
  * <img alt="Four-by-four 3D rotate transformation matrix" src="./images/3D_rotate_transform_4x4matrix.png"/>
  * 
  * where the <i>offsetX</i>, <i>offsetY</i>, and <i>offsetZ</i> values of the matrix are the following: 
  * 
  * <img alt="Values of the four-by-four 3D rotate transformation matrix" src="./images/3D_rotate_transform_matrix_values.png"/>
  * 
  * The effect is to rotate the coordinate system clockwise or counter-clockwise around the specified axis, and to apply the corresponding translation such that the center point does not move.
  * 
  * A new 3D rotation transform object has a default static value of zero for the Angle, CenterX, CenterY, AxisX, and AxisY properties, and a default static value of 1.0 for the AxisZ property.
  * 
  * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionrotatetransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionRotateTransform3D extends IDCompositionTransform3D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionRotateTransform3D
     * @type {Guid}
     */
    static IID => Guid("{d8f5b23f-d429-4a91-b55a-d2f45fd75b18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAngle", "SetAngle1", "SetAxisX", "SetAxisX1", "SetAxisY", "SetAxisY1", "SetAxisZ", "SetAxisZ1", "SetCenterX", "SetCenterX1", "SetCenterY", "SetCenterY1", "SetCenterZ", "SetCenterZ1"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setangle(idcompositionanimation)
     */
    SetAngle(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setangle(idcompositionanimation)
     */
    SetAngle1(angle) {
        result := ComCall(4, this, "float", angle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisx(float)
     */
    SetAxisX(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} axisX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisx(float)
     */
    SetAxisX1(axisX) {
        result := ComCall(6, this, "float", axisX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisy(float)
     */
    SetAxisY(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} axisY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisy(float)
     */
    SetAxisY1(axisY) {
        result := ComCall(8, this, "float", axisY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisz(float)
     */
    SetAxisZ(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} axisZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisz(float)
     */
    SetAxisZ1(axisZ) {
        result := ComCall(10, this, "float", axisZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(12, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(14, this, "float", centerY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ(animation) {
        result := ComCall(15, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} centerZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ1(centerZ) {
        result := ComCall(16, this, "float", centerZ, "HRESULT")
        return result
    }
}
