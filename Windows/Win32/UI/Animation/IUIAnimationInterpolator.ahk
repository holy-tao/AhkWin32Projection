#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for creating a custom interpolator.
 * @remarks
 * Client applications can use the transitions provided in  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary">IUIAnimationTransitionLibrary</a> or in a library provided by a third party; however, if you need custom behavior, you can create your own transitions by implementing the <b>IUIAnimationInterpolator</b> interface.
 * 
 * Before Windows Animation can use your custom interpolator, you must wrap it in an object that implements  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition">IUIAnimationTransitionFactory::CreateTransition</a> method and passing in the custom  interpolator.  After the interpolator is wrapped, client applications interact with your interpolator using the <b>IUIAnimationTransition</b> interface.
 * 
 * Custom interpolators can be reused across applications, but it is recommended that they be exposed using factory interfaces that return <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationinterpolator
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
     * @remarks
     * Windows Animation always calls <b>SetInitialValueAndVelocity</b> before calling the other methods of  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> at different offsets. However, it can be called multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to these methods reflect the updated state.
     * @param {Float} initialValue The initial value.
     * @param {Float} initialVelocity The initial velocity.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *             
     * See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity
     */
    SetInitialValueAndVelocity(initialValue, initialVelocity) {
        result := ComCall(3, this, "double", initialValue, "double", initialVelocity, "HRESULT")
        return result
    }

    /**
     * Sets the duration of the transition.
     * @remarks
     * Windows Animation calls this method only after calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-getdependencies">GetDependencies</a> method, and only if that call returns <b>UI_ANIMATION_DEPENDENCY_DURATION</b> as one of its <i>durationDependencies</i> flags.
     * 
     * Typically, an interpolator with a duration dependency will have a duration parameter in its associated creation method of <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionfactory">IUIAnimationTransitionFactory</a>.  The interpolator should store its duration when first initialized and overwrite it when <b>SetDuration</b> is called.
     * 
     * Windows Animation always calls the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> method to set the initial value and velocity before calling <b>SetDuration</b>, so a custom interpolator need not check whether the initial value and velocity have been set.
     * 
     * Windows Animation can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> and <b>SetDuration</b> multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to <b>SetDuration</b> reflect the updated state.
     * @param {Float} duration The duration of the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-setduration
     */
    SetDuration(duration) {
        result := ComCall(4, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * Gets the duration of a transition.
     * @remarks
     * Windows Animation always calls the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> method to set the initial value and velocity before calling <b>GetDuration</b>, so a custom interpolator need not check whether the initial value and velocity have been set.
     * 
     * Windows Animation can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to <b>GetDuration</b> reflect the updated state.
     * @returns {Float} The duration of the transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getduration
     */
    GetDuration() {
        result := ComCall(5, this, "double*", &duration := 0, "HRESULT")
        return duration
    }

    /**
     * Gets the final value at the end of the transition.
     * @remarks
     * Windows Animation always calls the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> method to set the initial value and velocity before calling <b>GetFinalValue</b>, so a custom interpolator need not check whether the initial value and velocity have been set.
     * 
     * Windows Animation can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to <b>GetFinalValue</b> reflect the updated state.
     * @returns {Float} The final value.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getfinalvalue
     */
    GetFinalValue() {
        result := ComCall(6, this, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Interpolates the value of an animation variable at the specified offset.
     * @remarks
     * Windows Animation always calls the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> method to set the initial value and velocity before calling <b>InterpolateValue</b>, so a custom interpolator need not check whether the initial value and velocity have been set.
     * 
     * Windows Animation can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to <b>InterpolateValue</b> reflect the updated state.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * This parameter is always greater than or equal to zero and less than the duration of the transition. This method is not called if the duration of the transition is zero.
     * @returns {Float} The interpolated value.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-interpolatevalue
     */
    InterpolateValue(offset) {
        result := ComCall(7, this, "double", offset, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Interpolates the velocity, or rate of change, at the specified offset.
     * @remarks
     * Windows Animation always calls the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> method to set the initial value and velocity before calling <b>InterpolateVelocity</b>, so a custom interpolator need not check whether the initial value and velocity have been set.
     * 
     * Windows Animation can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> multiple times with different parameters. Interpolators can cache internal state to improve performance, but they must update this cached state each time <b>SetInitialValueAndVelocity</b> is called and ensure that the results of subsequent calls to <b>InterpolateVelocity</b> reflect the updated state.
     * @param {Float} offset The offset from the start of the transition.
     * 
     * The offset is always greater than or equal to zero and less than or equal to the duration of the transition. This method is not called if the duration of the transition is zero.
     * @returns {Float} The interpolated velocity.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-interpolatevelocity
     */
    InterpolateVelocity(offset) {
        result := ComCall(8, this, "double", offset, "double*", &velocity := 0, "HRESULT")
        return velocity
    }

    /**
     * Gets the aspects of the interpolator that depend on the initial value or velocity passed to SetInitialValueAndVelocity, or that depend on the duration passed to SetDuration.
     * @remarks
     * This method is called to identify which aspects of the custom interpolator are affected by certain inputs: value, velocity, and duration. For each of these inputs, the interpolator returns either of the following:
     * 
     * <ul>
     * <li>The bitwise-OR of any members of <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_dependencies">UI_ANIMATION_DEPENDENCIES</a> that apply.</li>
     * <li><b>UI_ANIMATION_DEPENDENCY_NONE</b> if nothing depends on the input.</li>
     * </ul>
     * For example, consider an interpolator (1) that accepts a final value as a parameter, (2) that always comes to a gradual stop at that final value, and (3) whose duration is determined by the difference between the final and initial values.  The interpolator should return <b>UI_ANIMATION_DEPENDENCY_INTERMEDIATE_VALUES</b>|<b>UI_ANIMATION_DURATION</b> for <i>initialValueDependencies</i>.  It should not return <b>UI_ANIMATION_DEPENDENCY_FINAL_VALUE</b> because this is set when the interpolator is created and is not affected by the initial value. Likewise it should not return <b>UI_ANIMATION_DEPENDENCY_FINAL_VELOCITY</b> because the slope of the curve is defined to always be zero when it reaches the final value.
     * 
     * It is important that an interpolator return correct set of flags. If a flag is not present for an output, Windows Animation assumes that the corresponding parameter does not affect that aspect of the interpolator's results.  For example, if the custom interpolator does not include <b>UI_ANIMATION_DEPENDENCY_FINAL_VALUE</b> for <i>initialVelocityDependencies</i>, Windows Animation may call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a> with an arbitrary velocity parameter, then call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-getfinalvalue">GetFinalValue</a> to determine the final value.  The interpolator's implementation of <b>GetFinalValue</b> must return the same result no matter what velocity parameter has been passed to <b>SetInitialValueAndVelocity</b> because the interpolator has claimed that the transition's final value does not depend on the initial velocity.
     * 
     * <div class="alert"><b>Note</b>  If the flags returned for <i>durationDependencies</i> do not include <b>UI_ANIMATION_DEPENDENCY_DURATION</b>, <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setduration">SetDuration</a> will never be called on the interpolator.</div>
     * <div> </div>
     * @param {Pointer<Integer>} initialValueDependencies Aspects of the interpolator that depend on the  initial value passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} initialVelocityDependencies Aspects of the interpolator that depend on the initial velocity passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity">SetInitialValueAndVelocity</a>.
     * @param {Pointer<Integer>} durationDependencies Aspects of the interpolator that depend on the duration passed to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationinterpolator-setduration">SetDuration</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getdependencies
     */
    GetDependencies(initialValueDependencies, initialVelocityDependencies, durationDependencies) {
        initialValueDependenciesMarshal := initialValueDependencies is VarRef ? "int*" : "ptr"
        initialVelocityDependenciesMarshal := initialVelocityDependencies is VarRef ? "int*" : "ptr"
        durationDependenciesMarshal := durationDependencies is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, initialValueDependenciesMarshal, initialValueDependencies, initialVelocityDependenciesMarshal, initialVelocityDependencies, durationDependenciesMarshal, durationDependencies, "HRESULT")
        return result
    }
}
