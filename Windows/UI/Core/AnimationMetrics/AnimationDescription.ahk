#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAnimationDescription.ahk
#Include .\IAnimationDescriptionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes a collection of individual animation effects that are performed on a specific target to make up a complete Windows opacity, scaling, or translation animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class AnimationDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnimationDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnimationDescription.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [AnimationDescription](animationdescription.md) object with a specific animation and target.
     * @remarks
     * It is important to note that not all targets are valid for all animation effects. If an effect does not support the specified target, the method will fail.
     * 
     * The properties of an [AnimationDescription](animationdescription.md) object are captured at the time this method is called. If the user changes the animation settings, the originally captured values will continue to be returned by any [AnimationDescription](animationdescription.md) objects created before the change. To ensure that the properties you retrieve through methods of this class match the currently active settings, call this method to construct the object immediately before use.
     * 
     * Because all properties of the [AnimationDescription](animationdescription.md) object are captured at the time of construction, the object itself is immutable and can be marshaled freely.
     * @param {Integer} effect_ The animation effect to apply to the target.
     * @param {Integer} target The target of the animation effect.
     * @returns {AnimationDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.#ctor
     */
    static CreateInstance(effect_, target) {
        if (!AnimationDescription.HasProp("__IAnimationDescriptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.AnimationMetrics.AnimationDescription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnimationDescriptionFactory.IID)
            AnimationDescription.__IAnimationDescriptionFactory := IAnimationDescriptionFactory(factoryPtr)
        }

        return AnimationDescription.__IAnimationDescriptionFactory.CreateInstance(effect_, target)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of animations that are associated with the [AnimationDescription](animationdescription.md) object.
     * @remarks
     * The returned animations should be applied to the object in the order they appear in the collection array. If two or more animations apply to an object, they will appear in the array in this order:
     * 
     * 1. Scale
     * 1. Translate
     * 1. Opacity
     * If the animations are being applied to more than one object, then the stagger-related properties ([StaggerDelay](animationdescription_staggerdelay.md) and [StaggerDelayFactor](animationdescription_staggerdelayfactor.md)) describe the relative timing among the objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.animations
     * @type {IVectorView<IPropertyAnimation>} 
     */
    Animations {
        get => this.get_Animations()
    }

    /**
     * Gets the amount of time between the application of the animation effect to each object in a target that contains multiple objects. The StaggerDelay, together with the StaggerDelayFactor and DelayLimit, is one of the three elements used to control the relative timing of the animation effects.
     * @remarks
     * Consider a target that consists of four objects— labeled A, B, C, and D— with a StaggerDelay of 100 ms. Object A animates at time t=0, object B at time t=100 ms, object C at time t=200 ms, and object D at time t=300 ms.
     * 
     * However, the StaggerDelay time between each object's animation can be changed by the values of the StaggerDelayFactor and DelayLimit. See those topics for a discussion of their effect on the relative animation timing.
     * 
     * Note that an animation can have its own inherent [delay](propertyanimation_delay.md) in addition to its StaggerDelay.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.staggerdelay
     * @type {TimeSpan} 
     */
    StaggerDelay {
        get => this.get_StaggerDelay()
    }

    /**
     * Gets a multiplier that is applied to each occurrence of the stagger delay, increasing or decreasing the previous delay instance by that amount.
     * @remarks
     * The StaggerDelayFactor is a multiplier applied to the last value of the StaggerDelay. Consider a target that consists of four objects— labeled A, B, C, and D— with an initial StaggerDelay of 100 ms and a StaggerDelayFactor of 0.75. This means that the delay between subsequent objects is reduced to 75% of the previous delay. Under these conditions, object A animates at time t=0 and object B at time t=100 ms. The StaggerDelayFactor then reduces the delay for object C to 100 ms * 0.75 = 75 ms, so object C animates at time t=175 ms. The StaggerDelayFactor then reduces the delay for object D to 75 ms * 0.75 = 56 ms, so object D animates at time t=231 ms.
     * 
     * However, there is one more element that can affect these values— the [DelayLimit](animationdescription_delaylimit.md). See that topic for a discussion of its effect on the relative animation timing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.staggerdelayfactor
     * @type {Float} 
     */
    StaggerDelayFactor {
        get => this.get_StaggerDelayFactor()
    }

    /**
     * Gets the maximum cumulative delay time for the animation to be applied to the collection of objects in a target.
     * @remarks
     * If a staggered set of animations is being applied to a set of objects, and the relative timing of the animations results in an animation that is set to occur after the DelayLimit time, the animation occurs at the DelayLimit time instead. For instance, if an object was set to animate at time t=231 ms when the DelayLimit was set to 200 ms, that animation would occur at 200 ms.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.delaylimit
     * @type {TimeSpan} 
     */
    DelayLimit {
        get => this.get_DelayLimit()
    }

    /**
     * Gets the z-order position of an [AnimationDescription](animationdescription.md) object relative to other [AnimationDescription](animationdescription.md) objects in the same animation effect.     [AnimationDescription](animationdescription.md) objects with a higher z-order cover transitions with a lower z-order.
     * @remarks
     * The z-order value is used only for arranging [AnimationDescription](animationdescription.md) objects within the same overall animation. It has no effect on [AnimationDescription](animationdescription.md) objects from different transitions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationdescription.zorder
     * @type {Integer} 
     */
    ZOrder {
        get => this.get_ZOrder()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<IPropertyAnimation>} 
     */
    get_Animations() {
        if (!this.HasProp("__IAnimationDescription")) {
            if ((queryResult := this.QueryInterface(IAnimationDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationDescription := IAnimationDescription(outPtr)
        }

        return this.__IAnimationDescription.get_Animations()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StaggerDelay() {
        if (!this.HasProp("__IAnimationDescription")) {
            if ((queryResult := this.QueryInterface(IAnimationDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationDescription := IAnimationDescription(outPtr)
        }

        return this.__IAnimationDescription.get_StaggerDelay()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StaggerDelayFactor() {
        if (!this.HasProp("__IAnimationDescription")) {
            if ((queryResult := this.QueryInterface(IAnimationDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationDescription := IAnimationDescription(outPtr)
        }

        return this.__IAnimationDescription.get_StaggerDelayFactor()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DelayLimit() {
        if (!this.HasProp("__IAnimationDescription")) {
            if ((queryResult := this.QueryInterface(IAnimationDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationDescription := IAnimationDescription(outPtr)
        }

        return this.__IAnimationDescription.get_DelayLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZOrder() {
        if (!this.HasProp("__IAnimationDescription")) {
            if ((queryResult := this.QueryInterface(IAnimationDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationDescription := IAnimationDescription(outPtr)
        }

        return this.__IAnimationDescription.get_ZOrder()
    }

;@endregion Instance Methods
}
