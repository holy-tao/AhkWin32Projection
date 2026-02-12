#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionEasingFunction.ahk
#Include .\ICompositionEasingFunctionFactory.ahk
#Include .\ICompositionEasingFunctionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class for interpolator functions to use with KeyFrameAnimations.
  * 
  * The CompositionEasingFunction class is the base class for easing functions that are used with [KeyFrameAnimation](keyframeanimation.md) s. Easing functions are used to describe how the system interpolates between two different keyframes. 
  * For a list of supported easing functions, see the types in the Derived section.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEasingFunction extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionEasingFunction.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [CubicBezierEasingFunction](cubicbeziereasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Vector2} controlPoint1 The first control point for the easing function.
     * @param {Vector2} controlPoint2 The second control point for the easing function.
     * @returns {CubicBezierEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createcubicbeziereasingfunction
     */
    static CreateCubicBezierEasingFunction(owner, controlPoint1, controlPoint2) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateCubicBezierEasingFunction(owner, controlPoint1, controlPoint2)
    }

    /**
     * Creates an instance of [LinearEasingFunction](lineareasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @returns {LinearEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createlineareasingfunction
     */
    static CreateLinearEasingFunction(owner) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateLinearEasingFunction(owner)
    }

    /**
     * Creates an instance of [StepEasingFunction](stepeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @returns {StepEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createstepeasingfunction
     */
    static CreateStepEasingFunction(owner) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateStepEasingFunction(owner)
    }

    /**
     * Creates an instance of [StepEasingFunction](stepeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} stepCount 
     * @returns {StepEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createstepeasingfunction
     */
    static CreateStepEasingFunctionWithStepCount(owner, stepCount) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateStepEasingFunctionWithStepCount(owner, stepCount)
    }

    /**
     * Creates an instance of [BackEasingFunction](backeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @param {Float} amplitude The amplitude of retraction associated with this `BackEasingFunction`. This value must be greater than or equal to 0.
     * @returns {BackEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createbackeasingfunction
     */
    static CreateBackEasingFunction(owner, mode_, amplitude) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateBackEasingFunction(owner, mode_, amplitude)
    }

    /**
     * Creates an instance of [BounceEasingFunction](bounceeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @param {Integer} bounces The number of bounces. The value must be greater or equal to zero.
     * @param {Float} bounciness The value that specifies how bouncy the bounce animation is. This value must be positive.
     * @returns {BounceEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createbounceeasingfunction
     */
    static CreateBounceEasingFunction(owner, mode_, bounces, bounciness) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateBounceEasingFunction(owner, mode_, bounces, bounciness)
    }

    /**
     * Creates an instance of [CircleEasingFunction](circleeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @returns {CircleEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createcircleeasingfunction
     */
    static CreateCircleEasingFunction(owner, mode_) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateCircleEasingFunction(owner, mode_)
    }

    /**
     * Creates an instance of [ElasticEasingFunction](elasticeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @param {Integer} oscillations The number of times the target slides back and forth over the animation destination. This value must be greater than or equal to 0.
     * @param {Float} springiness A positive number that specifies the stiffness of the spring.
     * @returns {ElasticEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createelasticeasingfunction
     */
    static CreateElasticEasingFunction(owner, mode_, oscillations, springiness) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateElasticEasingFunction(owner, mode_, oscillations, springiness)
    }

    /**
     * Creates an instance of [ExponentialEasingFunction](exponentialeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @param {Float} exponent The exponent used to determine the interpolation of the animation.
     * @returns {ExponentialEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createexponentialeasingfunction
     */
    static CreateExponentialEasingFunction(owner, mode_, exponent) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateExponentialEasingFunction(owner, mode_, exponent)
    }

    /**
     * Creates an instance of [PowerEasingFunction](powereasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @param {Float} power The exponential power of the animation interpolation. This value must be greater or equal to 0.
     * @returns {PowerEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createpowereasingfunction
     */
    static CreatePowerEasingFunction(owner, mode_, power) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreatePowerEasingFunction(owner, mode_, power)
    }

    /**
     * Creates an instance of [SineEasingFunction](sineeasingfunction.md).
     * @param {Compositor} owner The [Compositor](compositor.md) used to create the easing function.
     * @param {Integer} mode_ One of the enumeration values that specifies how the animation interpolates.
     * @returns {SineEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunction.createsineeasingfunction
     */
    static CreateSineEasingFunction(owner, mode_) {
        if (!CompositionEasingFunction.HasProp("__ICompositionEasingFunctionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEasingFunction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEasingFunctionStatics.IID)
            CompositionEasingFunction.__ICompositionEasingFunctionStatics := ICompositionEasingFunctionStatics(factoryPtr)
        }

        return CompositionEasingFunction.__ICompositionEasingFunctionStatics.CreateSineEasingFunction(owner, mode_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
