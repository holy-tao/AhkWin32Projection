#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a library of standard transitions.
 * @remarks
 * 
  * Windows Animation includes a library of common transitions that developers can apply to variables through a storyboard. The parameters for specifying a transition depend on the type of transition. For some transitions, the duration of the transition is an explicit parameter; for others, the duration is determined by other parameters, such as speed or acceleration when the transition begins. A transition's initial value or velocity can be overridden if a discontinuous jump is desired, and duration can be queried after the transition is added to a storyboard.
  * 
  * If an application requires an effect that cannot be specified using the transition library, developers can implement custom transitions. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from interpolators. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a>interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransitionlibrary
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
     * 
     * @param {Float} finalValue 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createinstantaneoustransition
     */
    CreateInstantaneousTransition(finalValue, transition) {
        result := ComCall(3, this, "double", finalValue, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createconstanttransition
     */
    CreateConstantTransition(duration, transition) {
        result := ComCall(4, this, "double", duration, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @param {Float} finalValue 
     * @param {Float} hold 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-creatediscretetransition
     */
    CreateDiscreteTransition(delay, finalValue, hold, transition) {
        result := ComCall(5, this, "double", delay, "double", finalValue, "double", hold, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createlineartransition
     */
    CreateLinearTransition(duration, finalValue, transition) {
        result := ComCall(6, this, "double", duration, "double", finalValue, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} speed 
     * @param {Float} finalValue 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createlineartransitionfromspeed
     */
    CreateLinearTransitionFromSpeed(speed, finalValue, transition) {
        result := ComCall(7, this, "double", speed, "double", finalValue, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} period 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsinusoidaltransitionfromvelocity
     */
    CreateSinusoidalTransitionFromVelocity(duration, period, transition) {
        result := ComCall(8, this, "double", duration, "double", period, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} minimumValue 
     * @param {Float} maximumValue 
     * @param {Float} period 
     * @param {Integer} slope 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsinusoidaltransitionfromrange
     */
    CreateSinusoidalTransitionFromRange(duration, minimumValue, maximumValue, period, slope, transition) {
        result := ComCall(9, this, "double", duration, "double", minimumValue, "double", maximumValue, "double", period, "int", slope, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Float} accelerationRatio 
     * @param {Float} decelerationRatio 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createacceleratedeceleratetransition
     */
    CreateAccelerateDecelerateTransition(duration, finalValue, accelerationRatio, decelerationRatio, transition) {
        result := ComCall(10, this, "double", duration, "double", finalValue, "double", accelerationRatio, "double", decelerationRatio, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createreversaltransition
     */
    CreateReversalTransition(duration, transition) {
        result := ComCall(11, this, "double", duration, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Float} finalVelocity 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createcubictransition
     */
    CreateCubicTransition(duration, finalValue, finalVelocity, transition) {
        result := ComCall(12, this, "double", duration, "double", finalValue, "double", finalVelocity, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} maximumDuration 
     * @param {Float} finalValue 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createsmoothstoptransition
     */
    CreateSmoothStopTransition(maximumDuration, finalValue, transition) {
        result := ComCall(13, this, "double", maximumDuration, "double", finalValue, "ptr*", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} finalValue 
     * @param {Float} finalVelocity 
     * @param {Float} acceleration 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary-createparabolictransitionfromacceleration
     */
    CreateParabolicTransitionFromAcceleration(finalValue, finalVelocity, acceleration, transition) {
        result := ComCall(14, this, "double", finalValue, "double", finalVelocity, "double", acceleration, "ptr*", transition, "HRESULT")
        return result
    }
}
