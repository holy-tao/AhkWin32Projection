#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents a 3D transformation that affects the rotation of a visual along an arbitrary axis in 3D space. The coordinate system is rotated around the specified center point.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionrotatetransform3d
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
     * Animates the value of the Angle property of a 3D rotation transform. The Angle property specifies the rotation angle. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Angle property unless this method is called again. If the Angle property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected 3D transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the Angle property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setangle(idcompositionanimation)
     */
    SetAngle(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the Angle property of a 3D rotation transform. The Angle property specifies the rotation angle. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the Angle property unless this method is called again. If the Angle property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected 3D transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} angle 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setangle(idcompositionanimation)
     */
    SetAngle1(angle) {
        result := ComCall(4, this, "float", angle, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisX property of a 3D rotation transform. The AxisX property specifies the x-coordinate for the axis vector of rotation. The default value is zero.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisX property was previously animated, this method removes the animation and sets the AxisX property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisx(float)
     */
    SetAxisX(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisX property of a 3D rotation transform. The AxisX property specifies the x-coordinate for the axis vector of rotation. The default value is zero.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisX property was previously animated, this method removes the animation and sets the AxisX property to the specified static value.
     * @param {Float} axisX Type: <b>float</b>
     * 
     * The new x-coordinate for the axis vector of rotation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisx(float)
     */
    SetAxisX1(axisX) {
        result := ComCall(6, this, "float", axisX, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisY property of a 3D rotation transform. The AxisY property specifies the y-coordinate for the axis vector of rotation. The default value is zero.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisY property was previously animated, this method removes the animation and sets the AxisY property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisy(float)
     */
    SetAxisY(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisY property of a 3D rotation transform. The AxisY property specifies the y-coordinate for the axis vector of rotation. The default value is zero.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisY</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisY property was previously animated, this method removes the animation and sets the AxisY property to the specified static value.
     * @param {Float} axisY Type: <b>float</b>
     * 
     * The new y-coordinate for the axis vector of rotation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisy(float)
     */
    SetAxisY1(axisY) {
        result := ComCall(8, this, "float", axisY, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisZ property of a 3D rotation transform. The AxisZ property specifies the z-coordinate for the axis vector of rotation. The default value is 1.0.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisZ</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisZ property was previously animated, this method removes the animation and sets the AxisX property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisz(float)
     */
    SetAxisZ(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AxisZ property of a 3D rotation transform. The AxisZ property specifies the z-coordinate for the axis vector of rotation. The default value is 1.0.
     * @remarks
     * When setting the axis to a non-default value, you should always set all three axis properties (AxisX, AxisY, and AxisZ).
     * 
     * This method fails if the <i>axisZ</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AxisZ property was previously animated, this method removes the animation and sets the AxisX property to the specified static value.
     * @param {Float} axisZ Type: <b>float</b>
     * 
     * The new z-coordinate for the axis vector of rotation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setaxisz(float)
     */
    SetAxisZ1(axisZ) {
        result := ComCall(10, this, "float", axisZ, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 3D rotation transform. The CenterX property specifies the x-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterX property unless this method is called again. If the CenterX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the CenterX property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 3D rotation transform. The CenterX property specifies the x-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterX property unless this method is called again. If the CenterX property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} centerX 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(12, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 3D rotation transform. The CenterY property specifies the y-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterY property unless this method is called again. If the CenterY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the CenterY property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 3D rotation transform. The CenterY property specifies the y-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterY property unless this method is called again. If the CenterY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} centerY 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(14, this, "float", centerY, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterZ property of a 3D rotation transform. The CenterZ property specifies the z-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterZ property unless this method is called again. If the CenterZ property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the CenterZ property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ(animation) {
        result := ComCall(15, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterZ property of a 3D rotation transform. The CenterZ property specifies the z-coordinate of the point about which the rotation is performed. The default value is zero.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the CenterZ property unless this method is called again. If the CenterZ property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} centerZ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionrotatetransform3d-setcenterz(idcompositionanimation)
     */
    SetCenterZ1(centerZ) {
        result := ComCall(16, this, "float", centerZ, "HRESULT")
        return result
    }
}
