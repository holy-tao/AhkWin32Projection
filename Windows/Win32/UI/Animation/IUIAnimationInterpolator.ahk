#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for creating a custom interpolator.
 * @remarks
 * 
 * Client applications can use the transitions provided in  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary">IUIAnimationTransitionLibrary</a> or in a library provided by a third party; however, if you need custom behavior, you can create your own transitions by implementing the <b>IUIAnimationInterpolator</b> interface.
 * 
 * Before Windows Animation can use your custom interpolator, you must wrap it in an object that implements  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition">IUIAnimationTransitionFactory::CreateTransition</a> method and passing in the custom  interpolator.  After the interpolator is wrapped, client applications interact with your interpolator using the <b>IUIAnimationTransition</b> interface.
 * 
 * Custom interpolators can be reused across applications, but it is recommended that they be exposed using factory interfaces that return <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interfaces.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationinterpolator
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationInterpolator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationInterpolator
     * @type {Guid}
     */
    static IID => Guid("{7815cbba-ddf7-478c-a46c-7b6c738b7978}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInitialValueAndVelocity", "SetDuration", "GetDuration", "GetFinalValue", "InterpolateValue", "InterpolateVelocity", "GetDependencies"]

    /**
     * Sets the initial value and velocity at the start of the transition.
     * @param {Float} initialValue The initial value.
     * @param {Float} initialVelocity The initial velocity.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *             
     * See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity
     */
    SetInitialValueAndVelocity(initialValue, initialVelocity) {
        result := ComCall(3, this, "double", initialValue, "double", initialVelocity, "HRESULT")
        return result
    }

    /**
     * Sets the duration of the transition.
     * @param {Float} duration The duration of the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-setduration
     */
    SetDuration(duration) {
        result := ComCall(4, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * Gets the duration of a transition.
     * @returns {Float} The duration of the transition.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-getduration
     */
    GetDuration() {
        result := ComCall(5, this, "double*", &duration := 0, "HRESULT")
        return duration
    }

    /**
     * Gets the final value at the end of the transition.
     * @returns {Float} The final value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-getfinalvalue
     */
    GetFinalValue() {
        result := ComCall(6, this, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Interpolates the value of an animation variable at the specified offset.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * This parameter is always greater than or equal to zero and less than the duration of the transition. This method is not called if the duration of the transition is zero.
     * @returns {Float} The interpolated value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-interpolatevalue
     */
    InterpolateValue(offset) {
        result := ComCall(7, this, "double", offset, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Interpolates the velocity, or rate of change, at the specified offset.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * The offset is always greater than or equal to zero and less than or equal to the duration of the transition. This method is not called if the duration of the transition is zero.
     * @returns {Float} The interpolated velocity.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-interpolatevelocity
     */
    InterpolateVelocity(offset) {
        result := ComCall(8, this, "double", offset, "double*", &velocity := 0, "HRESULT")
        return velocity
    }

    /**
     * Gets the aspects of the interpolator that depend on the initial value or velocity passed to SetInitialValueAndVelocity, or that depend on the duration passed to SetDuration.
     * @param {Pointer<Integer>} initialValueDependencies Aspects of the interpolator that depend on the  initial value passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} initialVelocityDependencies Aspects of the interpolator that depend on the initial velocity passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} durationDependencies Aspects of the interpolator that depend on the duration passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setduration">SetDuration</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationinterpolator-getdependencies
     */
    GetDependencies(initialValueDependencies, initialVelocityDependencies, durationDependencies) {
        initialValueDependenciesMarshal := initialValueDependencies is VarRef ? "int*" : "ptr"
        initialVelocityDependenciesMarshal := initialVelocityDependencies is VarRef ? "int*" : "ptr"
        durationDependenciesMarshal := durationDependencies is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, initialValueDependenciesMarshal, initialValueDependencies, initialVelocityDependenciesMarshal, initialVelocityDependencies, durationDependenciesMarshal, durationDependencies, "HRESULT")
        return result
    }
}
