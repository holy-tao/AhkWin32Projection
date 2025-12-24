#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IUIAnimationInterpolator interface that defines methods for creating a custom interpolator. IUIAnimationInterpolator2 supports interpolation in a given dimension.
 * @remarks
 * 
 * Client applications can use the transitions provided in  the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary">IUIAnimationTransitionLibrary</a> or<a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary2">IUIAnimationTransitionLibrary2</a> interfaces, or in a library provided by a third party; however, custom transitions can be created by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> or  <b>IUIAnimationInterpolator2</b> interfaces.
 * 
 * Before Windows Animation can use your custom interpolator, you must wrap it in an object that implements the  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interface (by calling <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition">IUIAnimationTransitionFactory::CreateTransition</a>) or the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition2">IUIAnimationTransition2</a> interface (by calling  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionfactory2">IUIAnimationTransitionFactory2::CreateTransition</a>)  and passing in the custom  interpolator.  After the interpolator wrapper has been created, client applications interact with your interpolator using the <b>IUIAnimationTransition</b> or <b>IUIAnimationTransition2</b> interfaces.
 * 
 * Custom interpolators can be reused across applications, but it is recommended that they be exposed using factory interfaces that return an  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interface or an <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition2">IUIAnimationTransition2</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationinterpolator2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationInterpolator2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationInterpolator2
     * @type {Guid}
     */
    static IID => Guid("{ea76aff8-ea22-4a23-a0ef-a6a966703518}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimension", "SetInitialValueAndVelocity", "SetDuration", "GetDuration", "GetFinalValue", "InterpolateValue", "InterpolateVelocity", "GetPrimitiveInterpolation", "GetDependencies"]

    /**
     * Gets the number of dimensions that require interpolation.
     * @returns {Integer} The number of dimensions.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-getdimension
     */
    GetDimension() {
        result := ComCall(3, this, "uint*", &dimension := 0, "HRESULT")
        return dimension
    }

    /**
     * Sets the initial value and velocity of the transition for the given dimension.
     * @param {Pointer<Float>} initialValue The initial value.
     * @param {Pointer<Float>} initialVelocity The initial velocity.
     * @param {Integer} cDimension The dimension in which to set the initial value or velocity of the transition.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-setinitialvalueandvelocity
     */
    SetInitialValueAndVelocity(initialValue, initialVelocity, cDimension) {
        initialValueMarshal := initialValue is VarRef ? "double*" : "ptr"
        initialVelocityMarshal := initialVelocity is VarRef ? "double*" : "ptr"

        result := ComCall(4, this, initialValueMarshal, initialValue, initialVelocityMarshal, initialVelocity, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the duration of the transition in the given dimension.
     * @param {Float} duration The duration of the transition.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-setduration
     */
    SetDuration(duration) {
        result := ComCall(5, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * Gets the duration of a transition for the given dimension.
     * @returns {Float} The duration of the transition.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-getduration
     */
    GetDuration() {
        result := ComCall(6, this, "double*", &duration := 0, "HRESULT")
        return duration
    }

    /**
     * Gets the final value at the end of the transition for the given dimension.
     * @param {Integer} cDimension The dimension from which to retrieve the final value.
     * @returns {Float} The final value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-getfinalvalue
     */
    GetFinalValue(cDimension) {
        result := ComCall(7, this, "double*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Interpolates the value of an animation variable at the specified offset and for the given dimension.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * This parameter is always greater than or equal to zero and less than the duration of the transition. This method is not called if the duration of the transition is zero.
     * @param {Integer} cDimension The dimension in which to interpolate the value.
     * @returns {Float} The interpolated value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-interpolatevalue
     */
    InterpolateValue(offset, cDimension) {
        result := ComCall(8, this, "double", offset, "double*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Interpolates the velocity, or rate of change, at the specified offset for the given dimension.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * 
     * 
     * The offset is always greater than or equal to zero and less than or equal to the duration of the transition. This method is not called if the duration of the transition is zero.
     * @param {Integer} cDimension The dimension in which to interpolate the velocity.
     * @returns {Float} The interpolated velocity.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-interpolatevelocity
     */
    InterpolateVelocity(offset, cDimension) {
        result := ComCall(9, this, "double", offset, "double*", &velocity := 0, "uint", cDimension, "HRESULT")
        return velocity
    }

    /**
     * Generates a primitive interpolation of the specified animation curve.
     * @param {IUIAnimationPrimitiveInterpolation} interpolation The object that defines the custom animation curve information.
     * @param {Integer} cDimension The dimension in which to apply the new segment.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-getprimitiveinterpolation
     */
    GetPrimitiveInterpolation(interpolation, cDimension) {
        result := ComCall(10, this, "ptr", interpolation, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * For the given dimension, GetDependencies retrieves the aspects of the interpolator that depend on the initial value or velocity that is passed to the IUIAnimationInterpolator2::SetInitialValueAndVelocity method or the duration that is passed to the IUIAnimationInterpolator2::SetDuration method.
     * @param {Pointer<Integer>} initialValueDependencies Aspects of the interpolator that depend on the  initial value passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator2-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} initialVelocityDependencies Aspects of the interpolator that depend on the initial velocity passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator2-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} durationDependencies Aspects of the interpolator that depend on the duration passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator2-setduration">SetDuration</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator2-getdependencies
     */
    GetDependencies(initialValueDependencies, initialVelocityDependencies, durationDependencies) {
        initialValueDependenciesMarshal := initialValueDependencies is VarRef ? "int*" : "ptr"
        initialVelocityDependenciesMarshal := initialVelocityDependencies is VarRef ? "int*" : "ptr"
        durationDependenciesMarshal := durationDependencies is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, initialValueDependenciesMarshal, initialValueDependencies, initialVelocityDependenciesMarshal, initialVelocityDependencies, durationDependenciesMarshal, durationDependencies, "HRESULT")
        return result
    }
}
