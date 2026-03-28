#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationTransition.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a library of standard transitions.
 * @remarks
 * Windows Animation includes a library of common transitions that developers can apply to variables through a storyboard. The parameters for specifying a transition depend on the type of transition. For some transitions, the duration of the transition is an explicit parameter; for others, the duration is determined by other parameters, such as speed or acceleration when the transition begins. A transition's initial value or velocity can be overridden if a discontinuous jump is desired, and duration can be queried after the transition is added to a storyboard.
 * 
 * If an application requires an effect that cannot be specified using the transition library, developers can implement custom transitions. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from interpolators. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransitionlibrary
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransitionLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransitionLibrary
     * @type {Guid}
     */
    static IID => Guid("{ca5a14b1-d24f-48b8-8fe4-c78169ba954e}")

    /**
     * The class identifier for UIAnimationTransitionLibrary
     * @type {Guid}
     */
    static CLSID => Guid("{1d6322ad-aa85-4ef5-a828-86d71067d145}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstantaneousTransition", "CreateConstantTransition", "CreateDiscreteTransition", "CreateLinearTransition", "CreateLinearTransitionFromSpeed", "CreateSinusoidalTransitionFromVelocity", "CreateSinusoidalTransitionFromRange", "CreateAccelerateDecelerateTransition", "CreateReversalTransition", "CreateCubicTransition", "CreateSmoothStopTransition", "CreateParabolicTransitionFromAcceleration"]

    /**
     * Creates an instantaneous transition.
     * @remarks
     * During an instantaneous transition,
     *       the value of the animation variable changes instantly from its current value to a specified final value. The duration of this transition is always zero.
     * 
     * The figure below shows the effect on an animation variable over time during an instantaneous transition.
     * 
     * <img alt="Diagram showing an instantaneous transition" src="Images/InstantaneousTransition.png"/>
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition} The new instantaneous transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createinstantaneoustransition
     */
    CreateInstantaneousTransition(finalValue) {
        result := ComCall(3, this, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a constant transition.
     * @remarks
     * During a constant transition, the value of an animation variable remains at the initial value over the duration of the transition.
     * 
     * The figure below shows the effect on an animation variable over time during a constant-duration transition.
     * 
     * <img alt="Diagram showing a constant-duration transition" src="Images/ConstantTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @returns {IUIAnimationTransition} The new constant transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createconstanttransition
     */
    CreateConstantTransition(duration) {
        result := ComCall(4, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a discrete transition.
     * @remarks
     * During a discrete transition, the animation variable remains at the initial value for a specified delay time, then switches instantaneously to a specified final value and remains at that value for a given hold time.
     * 
     * The figure below shows the effect on an animation variable over time during a discrete transition.
     * 
     * <img alt="Diagram showing a discrete transition" src="Images/DiscreteTransition.png"/>
     * @param {Float} delay The amount of time by which to delay the instantaneous switch to the final value.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} _hold 
     * @returns {IUIAnimationTransition} The new discrete transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-creatediscretetransition
     */
    CreateDiscreteTransition(delay, finalValue, _hold) {
        result := ComCall(5, this, "double", delay, "double", finalValue, "double", _hold, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a linear transition.
     * @remarks
     * During a linear transition, the value of the animation variable transitions linearly from its initial value to a  specified final value.
     * 
     * The figure below shows the effect on an animation variable over time during a linear transition.
     * 
     * <img alt="Diagram showing a linear transition" src="Images/LinearTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition} The new linear transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createlineartransition
     */
    CreateLinearTransition(duration, finalValue) {
        result := ComCall(6, this, "double", duration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a linear-speed transition.
     * @remarks
     * During a linear-speed transition, the value of the animation variable changes at a specified rate. The duration of the transition is determined by  the difference between the initial value and the specified final value.
     * 
     * The figure below shows the effect on an animation variable over time during a linear-speed transition.
     * 
     * <img alt="Diagram showing the linear transition from speed" src="Images/LinearTransitionFromSpeed.png"/>
     * @param {Float} speed The absolute value of the velocity.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition} The new linear-speed transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createlineartransitionfromspeed
     */
    CreateLinearTransitionFromSpeed(speed, finalValue) {
        result := ComCall(7, this, "double", speed, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a sinusoidal-velocity transition, with an amplitude determined by the initial velocity.
     * @remarks
     * The value of the animation variable oscillates around the initial value over the entire duration of a sinusoidal-range transition. The amplitude of the oscillation is determined by the velocity when the transition begins.
     * 
     * The figure below shows the effect on an animation variable over time during a sinusoidal-velocity transition.
     * 
     * <img alt="Diagram showing a sinusoidal-velocity transition" src="Images/SinusolidalTransitionFromVelocity.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} period The period of oscillation of the sinusoidal wave in seconds.
     * @returns {IUIAnimationTransition} The new sinusoidal-velocity transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsinusoidaltransitionfromvelocity
     */
    CreateSinusoidalTransitionFromVelocity(duration, period) {
        result := ComCall(8, this, "double", duration, "double", period, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a sinusoidal-range transition, with a specified range of oscillation.
     * @remarks
     * The value of the animation variable fluctuates between the specified minimum and maximum values over the entire duration of a  sinusodial-range transition. The <i>slope</i> parameter is used to disambiguate between the two possible sine waves specified by the other parameters.
     * 
     * The figure below shows the effect on an animation variable over time during a sinusoidal-range transition. Passing in the <b>UI_ANIMATION_SLOPE_INCREASING</b> enumeration value yields a wave like the solid curve shown in the figure, whereas the <b>UI_ANIMATION_SLOPE_DECREASING</b> value yields a wave like the dashed curve.
     * 
     * <img alt="Diagram showing a sinusoidal-range transition" src="Images/SinusolidalTransitionFromRange.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} minimumValue The value of the animation variable at a trough of the sinusoidal wave.
     * @param {Float} maximumValue The value of the animation variable at a peak of the sinusoidal wave.
     * @param {Float} period The period of oscillation of the sinusoidal wave, in seconds.
     * @param {Integer} slope The slope at the start of the transition.
     * @returns {IUIAnimationTransition} The new sinusoidal-range transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsinusoidaltransitionfromrange
     */
    CreateSinusoidalTransitionFromRange(duration, minimumValue, maximumValue, period, slope) {
        result := ComCall(9, this, "double", duration, "double", minimumValue, "double", maximumValue, "double", period, "int", slope, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates an accelerate-decelerate transition.
     * @remarks
     * During an accelerate-decelerate transition, the animation variable
     *       speeds up and then slows down over the duration of the transition, ending at a specified value. You can control how quickly the variable accelerates and decelerates independently, by specifying different acceleration and deceleration ratios.
     * 
     * When the initial velocity is zero, the acceleration ratio is the fraction of the duration that the variable will spend accelerating; likewise with the deceleration ratio. If the initial velocity is nonzero, it is the fraction of the time between the velocity reaching zero and the end of transition. The acceleration ratio and the deceleration ratio should sum to a maximum of 1.0. 
     * 
     * The figures below show the effect on animation variables with different initial velocities during accelerate-decelerate transitions.
     * 
     * <img alt="Diagram showing accelerate-decelerate transitions" src="Images/AccelerateDecelerateTransition.png"/>
     * <div class="alert"><b>Note</b>  d' in the above figure on the right shows the time between the velocity reaching zero and the end of the transition.</div>
     * <div> </div>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} accelerationRatio The ratio of the time spent accelerating to the duration.
     * @param {Float} decelerationRatio The ratio of the time spent decelerating to the duration.
     * @returns {IUIAnimationTransition} The new accelerate-decelerate transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createacceleratedeceleratetransition
     */
    CreateAccelerateDecelerateTransition(duration, finalValue, accelerationRatio, decelerationRatio) {
        result := ComCall(10, this, "double", duration, "double", finalValue, "double", accelerationRatio, "double", decelerationRatio, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a reversal transition.
     * @remarks
     * A reversal transition smoothly changes direction over the specified duration. The final value will be the same as the initial value and the final velocity will be the negative of the initial velocity. The figure below shows such a reversal transition.
     * 
     * <img alt="Diagram showing a reversal transition" src="Images/ReversalTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @returns {IUIAnimationTransition} The new reversal transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createreversaltransition
     */
    CreateReversalTransition(duration) {
        result := ComCall(11, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a cubic transition.
     * @remarks
     * During a cubic transition, the value of the animation variable changes from its initial value to a specified final value over the duration of the transition, ending at a specified velocity.
     * 
     * The figure below shows the effect on an animation variable over time during a cubic transition.
     * 
     * <img alt="Diagram showing a cubic transition" src="Images/CubicTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} finalVelocity The velocity of the variable at the end of the transition.
     * @returns {IUIAnimationTransition} The new cubic transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createcubictransition
     */
    CreateCubicTransition(duration, finalValue, finalVelocity) {
        result := ComCall(12, this, "double", duration, "double", finalValue, "double", finalVelocity, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a smooth-stop transition.
     * @remarks
     * A smooth-stop transition slows down as it approaches the specified final value, and reaches it with a velocity of zero. The duration of the transition is determined by the initial velocity, the difference between the initial and final values, and the specified maximum duration. If there is no solution consisting of a single parabolic arc, this method creates a cubic transition.
     * 
     * The figure below shows the effect on an animation variable over time during a smooth-stop transition.
     * 
     * <img alt="Diagram showing a smooth stop transition" src="Images/SmoothStopTransition.png"/>
     * @param {Float} maximumDuration The maximum duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition} The new smooth-stop transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsmoothstoptransition
     */
    CreateSmoothStopTransition(maximumDuration, finalValue) {
        result := ComCall(13, this, "double", maximumDuration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    /**
     * Creates a parabolic-acceleration transition.
     * @remarks
     * During a parabolic-acceleration transition, the value of the animation variable changes from the  initial value to the final value ending at the specified velocity.  You can control how quickly the variable reaches the final value by specifying the rate of acceleration.
     * 
     * The figure below shows the effect on an animation variable over time during a parabolic-acceleration transition.
     * 
     * <img alt="Diagram showing a parabolic-acceleration transition" src="Images/ParabolicTransitionFromAcceleration.png"/>
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} finalVelocity The velocity at the end of the transition.
     * @param {Float} acceleration The acceleration during the transition.
     * @returns {IUIAnimationTransition} The new parabolic-acceleration transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createparabolictransitionfromacceleration
     */
    CreateParabolicTransitionFromAcceleration(finalValue, finalVelocity, acceleration) {
        result := ComCall(14, this, "double", finalValue, "double", finalVelocity, "double", acceleration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }
}
