#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UI_ANIMATION_SLOPE.ahk" { UI_ANIMATION_SLOPE }
#Import ".\IUIAnimationTransition2.ahk" { IUIAnimationTransition2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a library of standard transitions for a specified dimension.
 * @remarks
 * Windows Animation includes a library of common transitions that developers can apply to variables through a storyboard. The parameters for specifying a transition depend on the type of transition. For some transitions, the duration of the transition is an explicit parameter; for others, the duration is determined by other parameters, such as speed or acceleration when the transition begins. A transition's initial value or velocity can be overridden if a discontinuous jump is desired, and duration can be queried after the transition is added to a storyboard.
 * 
 * If an application requires an effect that cannot be specified using the transition library, developers can implement custom transitions. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from interpolators. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator2">IUIAnimationInterpolator2</a> interface; an implementation of the transition factory object is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448667(v=vs.85)">UIAnimationTransitionFactory2</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransitionlibrary2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTransitionLibrary2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTransitionLibrary2
     * @type {Guid}
     */
    static IID := Guid("{03cfae53-9580-4ee3-b363-2ece51b4af6a}")

    /**
     * The class identifier for UIAnimationTransitionLibrary2
     * @type {Guid}
     */
    static CLSID := Guid("{812f944a-c5c8-4cd9-b0a6-b3da802f228d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTransitionLibrary2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstantaneousTransition             : IntPtr
        CreateInstantaneousVectorTransition       : IntPtr
        CreateConstantTransition                  : IntPtr
        CreateDiscreteTransition                  : IntPtr
        CreateDiscreteVectorTransition            : IntPtr
        CreateLinearTransition                    : IntPtr
        CreateLinearVectorTransition              : IntPtr
        CreateLinearTransitionFromSpeed           : IntPtr
        CreateLinearVectorTransitionFromSpeed     : IntPtr
        CreateSinusoidalTransitionFromVelocity    : IntPtr
        CreateSinusoidalTransitionFromRange       : IntPtr
        CreateAccelerateDecelerateTransition      : IntPtr
        CreateReversalTransition                  : IntPtr
        CreateCubicTransition                     : IntPtr
        CreateCubicVectorTransition               : IntPtr
        CreateSmoothStopTransition                : IntPtr
        CreateParabolicTransitionFromAcceleration : IntPtr
        CreateCubicBezierLinearTransition         : IntPtr
        CreateCubicBezierLinearVectorTransition   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTransitionLibrary2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instantaneous scalar transition.
     * @remarks
     * During an instantaneous transition,
     *       the value of the animation variable changes instantly from its current value to a specified final value. The duration of this transition is always zero.
     * 
     * The following figure shows the change in value over time of an animation variable during an instantaneous transition.
     * 
     * <img alt="Diagram showing an instantaneous transition" src="Images/InstantaneousTransition.png"/>
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition2} The new instantaneous transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createinstantaneoustransition
     */
    CreateInstantaneousTransition(finalValue) {
        result := ComCall(3, this, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates an instantaneous vector transition for each specified dimension.
     * @remarks
     * During an instantaneous transition,
     *       the value of the animation variable changes instantly from its current value to a specified final value. The duration of this transition is always zero.
     * 
     * The following figure shows the change in value over time of an animation variable during an instantaneous transition.
     * 
     * <img alt="Diagram showing an instantaneous transition" src="Images/InstantaneousTransition.png"/>
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the values of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i>.
     * @returns {IUIAnimationTransition2} The new instantaneous transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createinstantaneousvectortransition
     */
    CreateInstantaneousVectorTransition(finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(4, this, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a constant scalar transition.
     * @remarks
     * During a constant transition, the value of an animation variable remains at the initial value over the duration of the transition.
     * 
     * The following figure shows the change in value for an animation variable over time during a constant-duration transition.
     * 
     * <img alt="Diagram showing a constant-duration transition" src="Images/ConstantTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @returns {IUIAnimationTransition2} The new constant transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createconstanttransition
     */
    CreateConstantTransition(duration) {
        result := ComCall(5, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a discrete scalar transition.
     * @remarks
     * During a discrete transition, the animation variable remains at the initial value for a specified delay time, then switches instantaneously to a specified final value and remains at that value for a given hold time.
     * 
     * The following figure shows the change in value over time of an animation variable during a discrete transition.
     * 
     * <img alt="Diagram showing a discrete transition" src="Images/DiscreteTransition.png"/>
     * @param {Float} delay The amount of time by which to delay the instantaneous switch to the final value.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} _hold The amount of time by which to hold the variable at its final value.
     * @returns {IUIAnimationTransition2} The new discrete transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-creatediscretetransition
     */
    CreateDiscreteTransition(delay, finalValue, _hold) {
        result := ComCall(6, this, "double", delay, "double", finalValue, "double", _hold, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a discrete vector transition for each specified dimension.
     * @remarks
     * During a discrete transition, the animation variable remains at the initial value for a specified delay time, then switches instantaneously to a specified final value and remains at that value for a given hold time.
     * 
     * The following figure shows the change in value over time of an animation variable during a discrete transition.
     * 
     * <img alt="Diagram showing a discrete transition" src="Images/DiscreteTransition.png"/>
     * @param {Float} delay The amount of time by which to delay the instantaneous switch to the final value.
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the final values of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i>.
     * @param {Float} _hold The amount of time by which to hold the variable at its final value.
     * @returns {IUIAnimationTransition2} The new discrete transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-creatediscretevectortransition
     */
    CreateDiscreteVectorTransition(delay, finalValue, cDimension, _hold) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, "double", delay, finalValueMarshal, finalValue, "uint", cDimension, "double", _hold, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a linear scalar transition.
     * @remarks
     * During a linear transition, the value of the animation variable transitions linearly from its initial value to a  specified final value.
     * 
     * The following figure shows the change in value over time of an animation variable during a linear transition.
     * 
     * <img alt="Diagram showing a linear transition" src="Images/LinearTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition2} The new linear transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlineartransition
     */
    CreateLinearTransition(duration, finalValue) {
        result := ComCall(8, this, "double", duration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a linear vector transition in the specified dimension.
     * @remarks
     * During a linear transition, the value of the animation variable transitions linearly from its initial value to a  specified final value.
     * 
     * The following figure shows the change in value over time of an animation variable during a linear transition.
     * 
     * <img alt="Diagram showing a linear transition" src="Images/LinearTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the final values of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i>.
     * @returns {IUIAnimationTransition2} The new linear transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlinearvectortransition
     */
    CreateLinearVectorTransition(duration, finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "double", duration, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a linear-speed scalar transition.
     * @remarks
     * During a linear-speed transition, the value of the animation variable changes at a specified rate. The duration of the transition is determined by  the difference between the initial value and the specified final value.
     * 
     * The following figure shows the change in value over time of an animation variable during a linear-speed transition.
     * 
     * <img alt="Diagram showing the linear transition from speed" src="Images/LinearTransitionFromSpeed.png"/>
     * @param {Float} speed The absolute value of the velocity in units/second.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition2} The new linear-speed transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlineartransitionfromspeed
     */
    CreateLinearTransitionFromSpeed(speed, finalValue) {
        result := ComCall(10, this, "double", speed, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a linear-speed vector transition in the specified dimension.
     * @remarks
     * During a linear-speed transition, the value of the animation variable changes at a specified rate. The duration of the transition is determined by  the difference between the initial value and the specified final value.
     * 
     * The following figure shows the change in value over time of an animation variable during a linear-speed transition.
     * 
     * <img alt="Diagram showing the linear transition from speed" src="Images/LinearTransitionFromSpeed.png"/>
     * @param {Float} speed The absolute value of the velocity in units/second.
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the final values of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i>.
     * @returns {IUIAnimationTransition2} The new linear-speed transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlinearvectortransitionfromspeed
     */
    CreateLinearVectorTransitionFromSpeed(speed, finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, "double", speed, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a sinusoidal scalar transition where amplitude is determined by initial velocity.
     * @remarks
     * The value of the animation variable oscillates around the initial value over the entire duration of a sinusoidal-range transition. The amplitude of the oscillation is determined by the velocity when the transition begins.
     * 
     * The following figure shows the change in value over time of an animation variable during a sinusoidal-velocity transition.
     * 
     * <img alt="Diagram showing a sinusoidal-velocity transition" src="Images/SinusolidalTransitionFromVelocity.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} period The period of oscillation of the sinusoidal wave.
     * @returns {IUIAnimationTransition2} The new sinusoidal-velocity transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsinusoidaltransitionfromvelocity
     */
    CreateSinusoidalTransitionFromVelocity(duration, period) {
        result := ComCall(12, this, "double", duration, "double", period, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a sinusoidal-range scalar transition with a specified range of oscillation.
     * @remarks
     * The value of the animation variable fluctuates between the specified minimum and maximum values over the entire duration of a  sinusodial-range transition. The <i>slope</i> parameter is used to disambiguate between the two possible sine waves specified by the other parameters.
     * 
     * The following figure shows the change in value over time of an animation variable during a sinusoidal-range transition. Passing in the <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_slope">UI_ANIMATION_SLOPE_INCREASING</a> enumeration value yields a wave like the solid curve shown in the figure, whereas the <b>UI_ANIMATION_SLOPE_DECREASING</b> value yields a wave like the dashed curve.
     * 
     * <img alt="Diagram showing a sinusoidal-range transition" src="Images/SinusolidalTransitionFromRange.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} minimumValue The value of the animation variable at a trough of the sinusoidal wave.
     * @param {Float} maximumValue The value of the animation variable at a peak of the sinusoidal wave.
     * @param {Float} period The period of oscillation of the sinusoidal wave.
     * @param {UI_ANIMATION_SLOPE} slope The slope at the start of the transition.
     * @returns {IUIAnimationTransition2} The new sinusoidal-range transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsinusoidaltransitionfromrange
     */
    CreateSinusoidalTransitionFromRange(duration, minimumValue, maximumValue, period, slope) {
        result := ComCall(13, this, "double", duration, "double", minimumValue, "double", maximumValue, "double", period, UI_ANIMATION_SLOPE, slope, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates an accelerate-decelerate scalar transition.
     * @remarks
     * During an accelerate-decelerate transition, the animation variable
     *       speeds up and then slows down over the duration of the transition, ending at a specified value. You can control how quickly the variable accelerates and decelerates independently, by specifying different acceleration and deceleration ratios.
     * 
     * When the initial velocity is zero, the acceleration ratio is the fraction of the duration that the variable will spend accelerating; likewise for the deceleration ratio. If the value of initial velocity is nonzero, the value is the fraction of the time between the velocity reaching zero and the end of transition. The acceleration ratio and the deceleration ratio should sum to a maximum of 1.0. 
     * 
     * The following figures show the change in value for animation variables with different initial velocities during accelerate-decelerate transitions.
     * 
     * <img alt="Diagram showing accelerate-decelerate transitions" src="Images/AccelerateDecelerateTransition.png"/>
     * <div class="alert"><b>Note</b>  d' in the figure on the right shows the time between the velocity reaching zero and the end of the transition.</div>
     * <div> </div>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} accelerationRatio The ratio of <i>duration</i> time spent accelerating (0 to 1).
     * @param {Float} decelerationRatio The ratio of <i>duration</i> time spent decelerating (0 to 1).
     * @returns {IUIAnimationTransition2} The new accelerate-decelerate transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createacceleratedeceleratetransition
     */
    CreateAccelerateDecelerateTransition(duration, finalValue, accelerationRatio, decelerationRatio) {
        result := ComCall(14, this, "double", duration, "double", finalValue, "double", accelerationRatio, "double", decelerationRatio, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a reversal scalar transition.
     * @remarks
     * A reversal transition smoothly changes direction over the specified duration. The final value will be the same as the initial value and the final velocity will be the negative of the initial velocity. The following figure shows such a reversal transition.
     * 
     * <img alt="Diagram showing a reversal transition" src="Images/ReversalTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @returns {IUIAnimationTransition2} The new reversal transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createreversaltransition
     */
    CreateReversalTransition(duration) {
        result := ComCall(15, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a cubic scalar transition.
     * @remarks
     * During a cubic transition, the value of the animation variable changes from its initial value to the <i>finalValue</i> over the <i>duration</i> of the transition, ending at the <i>finalVelocity</i>.
     * 
     * The following figure shows the effect on an animation variable over time during a cubic transition.
     * 
     * <img alt="Diagram showing a cubic transition" src="Images/CubicTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} finalVelocity The velocity of the variable at the end of the transition.
     * @returns {IUIAnimationTransition2} The new cubic transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubictransition
     */
    CreateCubicTransition(duration, finalValue, finalVelocity) {
        result := ComCall(16, this, "double", duration, "double", finalValue, "double", finalVelocity, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a cubic vector transition for each specified dimension.
     * @remarks
     * During a cubic transition, the value of the animation variable changes from its initial value to the <i>finalValue</i> over the <i>duration</i> of the transition, ending at the <i>finalVelocity</i>.
     * 
     * The following figure shows the effect on an animation variable over time during a cubic transition.
     * 
     * <img alt="Diagram showing a cubic transition" src="Images/CubicTransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the final values of the animation variable at the end of the transition.
     * @param {Pointer<Float>} finalVelocity A vector (of size <i>cDimension</i>) that contains  the final velocities (in units per second) of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i> and <i>finalVelocity</i>.
     * @returns {IUIAnimationTransition2} The new cubic transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicvectortransition
     */
    CreateCubicVectorTransition(duration, finalValue, finalVelocity, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"
        finalVelocityMarshal := finalVelocity is VarRef ? "double*" : "ptr"

        result := ComCall(17, this, "double", duration, finalValueMarshal, finalValue, finalVelocityMarshal, finalVelocity, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a smooth-stop scalar transition.
     * @remarks
     * A smooth-stop transition slows down as it approaches the specified final value, and reaches the final value with a velocity of zero. The duration of the transition is determined by the initial velocity, the difference between the initial and final values, and the specified maximum duration. If there is no solution consisting of a single parabolic arc, this method creates a cubic transition.
     * 
     * The following figure shows the change in value over time of an animation variable during a smooth-stop transition.
     * 
     * <img alt="Diagram showing a smooth stop transition" src="Images/SmoothStopTransition.png"/>
     * @param {Float} maximumDuration The maximum duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @returns {IUIAnimationTransition2} The new smooth-stop transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsmoothstoptransition
     */
    CreateSmoothStopTransition(maximumDuration, finalValue) {
        result := ComCall(18, this, "double", maximumDuration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a parabolic-acceleration scalar transition.
     * @remarks
     * During a parabolic-acceleration transition, the value of the animation variable changes from the  initial value to the final value, ending at the specified velocity.  You can control how quickly the variable reaches the final value by specifying the rate of acceleration.
     * 
     * The following figure shows the change in value over time of an animation variable during a parabolic-acceleration transition.
     * 
     * <img alt="Diagram showing a parabolic-acceleration transition" src="Images/ParabolicTransitionFromAcceleration.png"/>
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} finalVelocity The velocity, in units/second, at the end of the transition.
     * @param {Float} acceleration The acceleration, in units/second², during the transition.
     * @returns {IUIAnimationTransition2} The new parabolic-acceleration transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createparabolictransitionfromacceleration
     */
    CreateParabolicTransitionFromAcceleration(finalValue, finalVelocity, acceleration) {
        result := ComCall(19, this, "double", finalValue, "double", finalVelocity, "double", acceleration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * Creates a cubic Bézier linear scalar transition.
     * @remarks
     * During a cubic Bézier linear transition, the value of the animation variable changes from its initial value to the <i>finalValue</i> over the <i>duration</i> of the transition. The ordered pairs, (x1, y1) and (x2, y2), act as control points that provide directional information to transform the linear path of the transition into a smooth parametric curve.
     * 
     * The following figure shows the change in value over time for an animation variable during a cubic Bézier linear transition.
     * 
     * <img alt="Diagram showing a cubic Bezier linear transition" src="Images/cubicbezierlineartransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Float} finalValue The value of the animation variable at the end of the transition.
     * @param {Float} x1 The x-coordinate of the first control point.
     * @param {Float} y1 The y-coordinate of the first control point.
     * @param {Float} x2 The x-coordinate of the second control point.
     * @param {Float} y2 The y-coordinate of the second control point.
     * @returns {IUIAnimationTransition2} The new cubic Bézier linear transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicbezierlineartransition
     */
    CreateCubicBezierLinearTransition(duration, finalValue, x1, y1, x2, y2) {
        result := ComCall(20, this, "double", duration, "double", finalValue, "double", x1, "double", y1, "double", x2, "double", y2, "ptr*", &ppTransition := 0, "HRESULT")
        return IUIAnimationTransition2(ppTransition)
    }

    /**
     * Creates a cubic Bézier linear vector transition for each specified dimension.
     * @remarks
     * During a cubic Bézier linear transition, the value of the animation variable changes from its initial value to the <i>finalValue</i> over the <i>duration</i> of the transition. The ordered pairs, (x1, y1) and (x2, y2), act as control points that provide directional information to transform the linear path of the transition into a smooth parametric curve.
     * 
     * The following figure shows the change in value over time of an animation variable during a cubic Bézier linear transition.
     * 
     * <img alt="Diagram showing a cubic Bezier linear vector transition" src="Images/cubicbezierlineartransition.png"/>
     * @param {Float} duration The duration of the transition.
     * @param {Pointer<Float>} finalValue A vector (of size <i>cDimension</i>) that contains  the final values of the animation variable at the end of the transition.
     * @param {Integer} cDimension The number of dimensions to apply the transition. This parameter specifies the number of values listed in <i>finalValue</i>.
     * @param {Float} x1 The x-coordinate of the first control point.
     * @param {Float} y1 The y-coordinate of the first control point.
     * @param {Float} x2 The x-coordinate of the second control point.
     * @param {Float} y2 The y-coordinate of the second control point.
     * @returns {IUIAnimationTransition2} The new cubic Bézier linear transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicbezierlinearvectortransition
     */
    CreateCubicBezierLinearVectorTransition(duration, finalValue, cDimension, x1, y1, x2, y2) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(21, this, "double", duration, finalValueMarshal, finalValue, "uint", cDimension, "double", x1, "double", y1, "double", x2, "double", y2, "ptr*", &ppTransition := 0, "HRESULT")
        return IUIAnimationTransition2(ppTransition)
    }

    Query(iid) {
        if (IUIAnimationTransitionLibrary2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstantaneousTransition := CallbackCreate(GetMethod(implObj, "CreateInstantaneousTransition"), flags, 3)
        this.vtbl.CreateInstantaneousVectorTransition := CallbackCreate(GetMethod(implObj, "CreateInstantaneousVectorTransition"), flags, 4)
        this.vtbl.CreateConstantTransition := CallbackCreate(GetMethod(implObj, "CreateConstantTransition"), flags, 3)
        this.vtbl.CreateDiscreteTransition := CallbackCreate(GetMethod(implObj, "CreateDiscreteTransition"), flags, 5)
        this.vtbl.CreateDiscreteVectorTransition := CallbackCreate(GetMethod(implObj, "CreateDiscreteVectorTransition"), flags, 6)
        this.vtbl.CreateLinearTransition := CallbackCreate(GetMethod(implObj, "CreateLinearTransition"), flags, 4)
        this.vtbl.CreateLinearVectorTransition := CallbackCreate(GetMethod(implObj, "CreateLinearVectorTransition"), flags, 5)
        this.vtbl.CreateLinearTransitionFromSpeed := CallbackCreate(GetMethod(implObj, "CreateLinearTransitionFromSpeed"), flags, 4)
        this.vtbl.CreateLinearVectorTransitionFromSpeed := CallbackCreate(GetMethod(implObj, "CreateLinearVectorTransitionFromSpeed"), flags, 5)
        this.vtbl.CreateSinusoidalTransitionFromVelocity := CallbackCreate(GetMethod(implObj, "CreateSinusoidalTransitionFromVelocity"), flags, 4)
        this.vtbl.CreateSinusoidalTransitionFromRange := CallbackCreate(GetMethod(implObj, "CreateSinusoidalTransitionFromRange"), flags, 7)
        this.vtbl.CreateAccelerateDecelerateTransition := CallbackCreate(GetMethod(implObj, "CreateAccelerateDecelerateTransition"), flags, 6)
        this.vtbl.CreateReversalTransition := CallbackCreate(GetMethod(implObj, "CreateReversalTransition"), flags, 3)
        this.vtbl.CreateCubicTransition := CallbackCreate(GetMethod(implObj, "CreateCubicTransition"), flags, 5)
        this.vtbl.CreateCubicVectorTransition := CallbackCreate(GetMethod(implObj, "CreateCubicVectorTransition"), flags, 6)
        this.vtbl.CreateSmoothStopTransition := CallbackCreate(GetMethod(implObj, "CreateSmoothStopTransition"), flags, 4)
        this.vtbl.CreateParabolicTransitionFromAcceleration := CallbackCreate(GetMethod(implObj, "CreateParabolicTransitionFromAcceleration"), flags, 5)
        this.vtbl.CreateCubicBezierLinearTransition := CallbackCreate(GetMethod(implObj, "CreateCubicBezierLinearTransition"), flags, 8)
        this.vtbl.CreateCubicBezierLinearVectorTransition := CallbackCreate(GetMethod(implObj, "CreateCubicBezierLinearVectorTransition"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstantaneousTransition)
        CallbackFree(this.vtbl.CreateInstantaneousVectorTransition)
        CallbackFree(this.vtbl.CreateConstantTransition)
        CallbackFree(this.vtbl.CreateDiscreteTransition)
        CallbackFree(this.vtbl.CreateDiscreteVectorTransition)
        CallbackFree(this.vtbl.CreateLinearTransition)
        CallbackFree(this.vtbl.CreateLinearVectorTransition)
        CallbackFree(this.vtbl.CreateLinearTransitionFromSpeed)
        CallbackFree(this.vtbl.CreateLinearVectorTransitionFromSpeed)
        CallbackFree(this.vtbl.CreateSinusoidalTransitionFromVelocity)
        CallbackFree(this.vtbl.CreateSinusoidalTransitionFromRange)
        CallbackFree(this.vtbl.CreateAccelerateDecelerateTransition)
        CallbackFree(this.vtbl.CreateReversalTransition)
        CallbackFree(this.vtbl.CreateCubicTransition)
        CallbackFree(this.vtbl.CreateCubicVectorTransition)
        CallbackFree(this.vtbl.CreateSmoothStopTransition)
        CallbackFree(this.vtbl.CreateParabolicTransitionFromAcceleration)
        CallbackFree(this.vtbl.CreateCubicBezierLinearTransition)
        CallbackFree(this.vtbl.CreateCubicBezierLinearVectorTransition)
    }
}
