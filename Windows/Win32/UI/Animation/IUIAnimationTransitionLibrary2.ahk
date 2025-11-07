#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationTransition2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a library of standard transitions for a specified dimension.
 * @remarks
 * 
 * Windows Animation includes a library of common transitions that developers can apply to variables through a storyboard. The parameters for specifying a transition depend on the type of transition. For some transitions, the duration of the transition is an explicit parameter; for others, the duration is determined by other parameters, such as speed or acceleration when the transition begins. A transition's initial value or velocity can be overridden if a discontinuous jump is desired, and duration can be queried after the transition is added to a storyboard.
 * 
 * If an application requires an effect that cannot be specified using the transition library, developers can implement custom transitions. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from interpolators. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator2">IUIAnimationInterpolator2</a>interface; an implementation of the transition factory object is provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448667(v=vs.85)">UIAnimationTransitionFactory2</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransitionlibrary2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransitionLibrary2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransitionLibrary2
     * @type {Guid}
     */
    static IID => Guid("{03cfae53-9580-4ee3-b363-2ece51b4af6a}")

    /**
     * The class identifier for UIAnimationTransitionLibrary2
     * @type {Guid}
     */
    static CLSID => Guid("{812f944a-c5c8-4cd9-b0a6-b3da802f228d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstantaneousTransition", "CreateInstantaneousVectorTransition", "CreateConstantTransition", "CreateDiscreteTransition", "CreateDiscreteVectorTransition", "CreateLinearTransition", "CreateLinearVectorTransition", "CreateLinearTransitionFromSpeed", "CreateLinearVectorTransitionFromSpeed", "CreateSinusoidalTransitionFromVelocity", "CreateSinusoidalTransitionFromRange", "CreateAccelerateDecelerateTransition", "CreateReversalTransition", "CreateCubicTransition", "CreateCubicVectorTransition", "CreateSmoothStopTransition", "CreateParabolicTransitionFromAcceleration", "CreateCubicBezierLinearTransition", "CreateCubicBezierLinearVectorTransition"]

    /**
     * 
     * @param {Float} finalValue 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createinstantaneoustransition
     */
    CreateInstantaneousTransition(finalValue) {
        result := ComCall(3, this, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createinstantaneousvectortransition
     */
    CreateInstantaneousVectorTransition(finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(4, this, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createconstanttransition
     */
    CreateConstantTransition(duration) {
        result := ComCall(5, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} delay 
     * @param {Float} finalValue 
     * @param {Float} hold 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-creatediscretetransition
     */
    CreateDiscreteTransition(delay, finalValue, hold) {
        result := ComCall(6, this, "double", delay, "double", finalValue, "double", hold, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} delay 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @param {Float} hold 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-creatediscretevectortransition
     */
    CreateDiscreteVectorTransition(delay, finalValue, cDimension, hold) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, "double", delay, finalValueMarshal, finalValue, "uint", cDimension, "double", hold, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlineartransition
     */
    CreateLinearTransition(duration, finalValue) {
        result := ComCall(8, this, "double", duration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlinearvectortransition
     */
    CreateLinearVectorTransition(duration, finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "double", duration, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} speed 
     * @param {Float} finalValue 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlineartransitionfromspeed
     */
    CreateLinearTransitionFromSpeed(speed, finalValue) {
        result := ComCall(10, this, "double", speed, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} speed 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createlinearvectortransitionfromspeed
     */
    CreateLinearVectorTransitionFromSpeed(speed, finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, "double", speed, finalValueMarshal, finalValue, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} period 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsinusoidaltransitionfromvelocity
     */
    CreateSinusoidalTransitionFromVelocity(duration, period) {
        result := ComCall(12, this, "double", duration, "double", period, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} minimumValue 
     * @param {Float} maximumValue 
     * @param {Float} period 
     * @param {Integer} slope 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsinusoidaltransitionfromrange
     */
    CreateSinusoidalTransitionFromRange(duration, minimumValue, maximumValue, period, slope) {
        result := ComCall(13, this, "double", duration, "double", minimumValue, "double", maximumValue, "double", period, "int", slope, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Float} accelerationRatio 
     * @param {Float} decelerationRatio 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createacceleratedeceleratetransition
     */
    CreateAccelerateDecelerateTransition(duration, finalValue, accelerationRatio, decelerationRatio) {
        result := ComCall(14, this, "double", duration, "double", finalValue, "double", accelerationRatio, "double", decelerationRatio, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createreversaltransition
     */
    CreateReversalTransition(duration) {
        result := ComCall(15, this, "double", duration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Float} finalVelocity 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubictransition
     */
    CreateCubicTransition(duration, finalValue, finalVelocity) {
        result := ComCall(16, this, "double", duration, "double", finalValue, "double", finalVelocity, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Pointer<Float>} finalValue 
     * @param {Pointer<Float>} finalVelocity 
     * @param {Integer} cDimension 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicvectortransition
     */
    CreateCubicVectorTransition(duration, finalValue, finalVelocity, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"
        finalVelocityMarshal := finalVelocity is VarRef ? "double*" : "ptr"

        result := ComCall(17, this, "double", duration, finalValueMarshal, finalValue, finalVelocityMarshal, finalVelocity, "uint", cDimension, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} maximumDuration 
     * @param {Float} finalValue 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createsmoothstoptransition
     */
    CreateSmoothStopTransition(maximumDuration, finalValue) {
        result := ComCall(18, this, "double", maximumDuration, "double", finalValue, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} finalValue 
     * @param {Float} finalVelocity 
     * @param {Float} acceleration 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createparabolictransitionfromacceleration
     */
    CreateParabolicTransitionFromAcceleration(finalValue, finalVelocity, acceleration) {
        result := ComCall(19, this, "double", finalValue, "double", finalVelocity, "double", acceleration, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Float} finalValue 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicbezierlineartransition
     */
    CreateCubicBezierLinearTransition(duration, finalValue, x1, y1, x2, y2) {
        result := ComCall(20, this, "double", duration, "double", finalValue, "double", x1, "double", y1, "double", x2, "double", y2, "ptr*", &ppTransition := 0, "HRESULT")
        return IUIAnimationTransition2(ppTransition)
    }

    /**
     * 
     * @param {Float} duration 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {IUIAnimationTransition2} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionlibrary2-createcubicbezierlinearvectortransition
     */
    CreateCubicBezierLinearVectorTransition(duration, finalValue, cDimension, x1, y1, x2, y2) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(21, this, "double", duration, finalValueMarshal, finalValue, "uint", cDimension, "double", x1, "double", y1, "double", x2, "double", y2, "ptr*", &ppTransition := 0, "HRESULT")
        return IUIAnimationTransition2(ppTransition)
    }
}
