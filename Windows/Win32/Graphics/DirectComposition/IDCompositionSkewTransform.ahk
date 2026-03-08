#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents a 2D transformation that affects the skew of a visual along the x-axis and y-axis. The coordinate system is skewed around the specified center point.
 * @remarks
 * A skew transform represents the following 3-by-3 matrix: 
 * 
 * <img alt="Three-by-three skew matrix" src="./images/skew_transform_3x3matrix.png"/>
 * 
 * The effect is to slant the coordinate system along the x-axis and y-axis such that a rectangle becomes a parallelogram, and to apply the corresponding translation such that the center point does not move.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionskewtransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSkewTransform extends IDCompositionTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionSkewTransform
     * @type {Guid}
     */
    static IID => Guid("{e57aa735-dcdb-4c72-9c61-0591f58889ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAngleX", "SetAngleX1", "SetAngleY", "SetAngleY1", "SetCenterX", "SetCenterX1", "SetCenterY", "SetCenterY1"]

    /**
     * Changes the value of the AngleX property of a 2D skew transform.
     * @remarks
     * This method fails if the <i>angleX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AngleX property was previously animated, this method removes the animation and sets the AngleX property to the specified static value.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setanglex(float)
     */
    SetAngleX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the AngleX property of a 2D skew transform.
     * @remarks
     * This method fails if the <i>angleX</i> parameter is NaN, positive infinity, or negative infinity.
     * 
     * 
     * 
     * If the AngleX property was previously animated, this method removes the animation and sets the AngleX property to the specified static value.
     * @param {Float} angleX Type: <b>float</b>
     * 
     * The new skew angle of the x-axis, in degrees. A positive value creates a counterclockwise skew, and a negative value creates a clockwise skew. For values less than –360 or greater than 360, the values wrap around and are treated as if the mathematical operation mod(360) was applied.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setanglex(float)
     */
    SetAngleX1(angleX) {
        result := ComCall(4, this, "float", angleX, "HRESULT")
        return result
    }

    /**
     * Animates the value of the AngleY property of a 2D skew transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the AngleY property unless this method is called again. If the AngleY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that represents how the value of the AngleY property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setangley(idcompositionanimation)
     */
    SetAngleY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the AngleY property of a 2D skew transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the AngleY property unless this method is called again. If the AngleY property was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} angleY 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setangley(idcompositionanimation)
     */
    SetAngleY1(angleY) {
        result := ComCall(6, this, "float", angleY, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 2D skew transform.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setcenterx(idcompositionanimation)
     */
    SetCenterX(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterX property of a 2D skew transform.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setcenterx(idcompositionanimation)
     */
    SetCenterX1(centerX) {
        result := ComCall(8, this, "float", centerX, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 2D skew transform.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setcentery(idcompositionanimation)
     */
    SetCenterY(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the CenterY property of a 2D skew transform.
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionskewtransform-setcentery(idcompositionanimation)
     */
    SetCenterY1(centerY) {
        result := ComCall(10, this, "float", centerY, "HRESULT")
        return result
    }
}
