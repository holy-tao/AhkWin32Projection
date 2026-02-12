#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IVisualTransition.ahk
#Include .\IVisualTransitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the visual behavior that occurs when the control transitions from one visual state to another.
 * @remarks
 * A VisualTransition is a behavior that initiates a [Storyboard](visualtransition_storyboard.md). This [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) is a timeline that declares the duration that animations that transition between two visual states will run. The transition can be defined differently for each combination of starting state (the **From** state) and ending state (the **To** state) as defined by your control's set of visual states. Transitions are defined by the [Transitions](visualstategroup_transitions.md) property of [VisualStateGroup](visualstategroup.md) and are usually defined in XAML. Most default control templates don't define transitions, and in this case the transitions between states happen instantaneously. The old state's modifications to the template are removed, and the new state's modifications are applied.
 * 
 * A VisualTransition references either one or two named visual states. The [From](visualtransition_from.md) value references the name of a state that is the current state. The [To](visualtransition_to.md) value references the name of a state that is the new state requested by a [GoToState](visualstatemanager_gotostate_443481648.md) call. These names come from an [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) string value that is applied to a [VisualState](templatevisualstateattribute.md) as part of its definition in the same [VisualStateGroup](visualstategroup.md). Either [From](visualtransition_from.md) or [To](visualtransition_to.md) are a required value for an effective VisualTransition, a VisualTransition that lacks either of these values or uses values that don't match existing states does nothing.
 * 
 * A VisualTransition can reference just a [From](visualtransition_from.md) state, just a [To](visualtransition_to.md) state, or both a [From](visualtransition_from.md) and [To](visualtransition_to.md) state. Omitting either [From](visualtransition_from.md) or [To](visualtransition_to.md) equates to any state. The [VisualStateManager](visualstatemanager.md) uses a precedence logic for which transition to apply whenever visual states change:
 * 1. If a VisualTransition exists that specifically references the old state as [From](visualtransition_from.md) and the new state as [To](visualtransition_to.md), use that transition.
 * 1. Otherwise, if a VisualTransition exists that specifically references the new state as [To](visualtransition_to.md) but does not specify [From](visualtransition_from.md), use that transition.
 * 1. Finally, if a VisualTransition exists that specifically references the old state as [From](visualtransition_from.md) but does not specify [To](visualtransition_to.md), use that transition.
 *  If none of the above apply, no transition runs.
 * 
 * When you call [GoToState](visualstatemanager_gotostate_443481648.md) to change the visual state of a control, the [VisualStateManager](visualstatemanager.md) performs these actions:
 * + If the [VisualState](visualstate.md) that the control was using prior to the newly requested visual state has a [Storyboard](visualstate_storyboard.md), that storyboard stops.
 * + Between these actions, the [Storyboard](visualtransition_storyboard.md) for a VisualTransition runs, if a transition that involves the two visual states exists, and the named visual state requested by [GoToState](visualstatemanager_gotostate_443481648.md) is valid and is a new state.
 * + If the [VisualState](visualstate.md) as named by *stateName* has a [Storyboard](visualstate_storyboard.md), the storyboard begins.
 * 
 * 
 * A VisualTransition can have a [Storyboard](visualstate_storyboard.md) value, a [GeneratedDuration](visualtransition_generatedduration.md) value or both. But if a VisualTransition has neither a [Storyboard](visualstate_storyboard.md) value nor a [GeneratedDuration](visualtransition_generatedduration.md) value, that VisualTransition does nothing in terms of animations, even if states named by the [From](visualtransition_from.md) and [To](visualtransition_to.md) values are involved in a state change.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VisualTransition extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualTransition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {VisualTransition} 
     */
    static CreateInstance() {
        if (!VisualTransition.HasProp("__IVisualTransitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTransitionFactory.IID)
            VisualTransition.__IVisualTransitionFactory := IVisualTransitionFactory(factoryPtr)
        }

        return VisualTransition.__IVisualTransitionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the amount of time it takes to move from one state to another, and the time that any implicit transition animations should run as part of the transition behavior.
     * @remarks
     * GeneratedDuration is mainly for controlling implicit transitions. If you want your transition animations to be limited only to the specific animations in your [Storyboard](../windows.ui.xaml.media.animation/storyboard.md), you don't to set a value for GeneratedDuration. Instead, set specific [Duration](duration.md) values on the animations in the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) or the main [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) element within it. If you do set a GeneratedDuration value, it won't truncate or change any [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) with a [Duration](../windows.ui.xaml.media.animation/timeline_duration.md) value; the total length of the transition is the longest [Duration](../windows.ui.xaml.media.animation/timeline_duration.md) value that you've set in the animations for [Storyboard](../windows.ui.xaml.media.animation/storyboard.md), or the GeneratedDuration, whichever is longer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition.generatedduration
     * @type {Duration} 
     */
    GeneratedDuration {
        get => this.get_GeneratedDuration()
        set => this.put_GeneratedDuration(value)
    }

    /**
     * Gets or sets the easing function applied to the generated animations.
     * @remarks
     * A [VisualTransition](visualtransition.md) typically uses a linear interpolation to control the implicit transition animations that happen over the [GeneratedDuration](visualtransition_generatedduration.md). Setting a value for GeneratedEasingFunction changes this linear behavior and instead applies the timing logic of a particular [EasingFunctionBase](../windows.ui.xaml.media.animation/easingfunctionbase.md) derived class to the interpolation. For example, if you wanted an interpolation rate to start off slowly and reach the **To** value rapidly at the end of the transition's duration, you might set GeneratedEasingFunction using a [PowerEase](../windows.ui.xaml.media.animation/powerease.md) with [EasingMode.EaseIn](../windows.ui.xaml.media.animation/easingmode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition.generatedeasingfunction
     * @type {EasingFunctionBase} 
     */
    GeneratedEasingFunction {
        get => this.get_GeneratedEasingFunction()
        set => this.put_GeneratedEasingFunction(value)
    }

    /**
     * Gets or sets the name of the [VisualState](visualstate.md) to transition to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Gets or sets the name of the [VisualState](visualstate.md) to transition from.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets or sets the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) that runs when the transition occurs.
     * @remarks
     * The value of the Storyboard property is either null or a single [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) object. A [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) is like a container for animations, it can contain one or more animation definitions. Each such animation can target a specific dependency property on a specific named target. The named target must be an element in the control template that has a [Name](frameworkelement_name.md) or [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) value defined in the template itself. The dependency property must be a property that exists in that object's object model, or must be an attached property. To target animations, you use the [Storyboard.TargetName](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetname) and [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) attached properties. For more info on how to define animations with XAML syntax, and the types of animations you can use, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * 
     * The properties you target using animations in VisualTransition.Storyboard are not limited to[Point](../windows.foundation/point.md), [Color](../windows.ui/color.md), or [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true). You can use [ObjectAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/objectanimationusingkeyframes.md) and [DiscreteObjectKeyFrame](../windows.ui.xaml.media.animation/discreteobjectkeyframe.md).
     * 
     * If you have a value for [Storyboard](../windows.ui.xaml.media.animation/storyboard.md), you can choose to omit a value for [GeneratedDuration](visualtransition_generatedduration.md). Instead, set specific [Duration](duration.md) values on the animations in the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) or the main [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) element within it. If you do set a [GeneratedDuration](visualtransition_generatedduration.md) value, it won't truncate or change any [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) with a [Duration](../windows.ui.xaml.media.animation/timeline_duration.md) value; the total length of the transition is the longest [Duration](../windows.ui.xaml.media.animation/timeline_duration.md) value that you've set in the animations for [Storyboard](../windows.ui.xaml.media.animation/storyboard.md), or the [GeneratedDuration](visualtransition_generatedduration.md), whichever is longer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualtransition.storyboard
     * @type {Storyboard} 
     */
    Storyboard {
        get => this.get_Storyboard()
        set => this.put_Storyboard(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_GeneratedDuration() {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.get_GeneratedDuration()
    }

    /**
     * 
     * @param {Duration} value 
     * @returns {HRESULT} 
     */
    put_GeneratedDuration(value) {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.put_GeneratedDuration(value)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_GeneratedEasingFunction() {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.get_GeneratedEasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_GeneratedEasingFunction(value) {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.put_GeneratedEasingFunction(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.get_To()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.put_To(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.get_From()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.put_From(value)
    }

    /**
     * 
     * @returns {Storyboard} 
     */
    get_Storyboard() {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.get_Storyboard()
    }

    /**
     * 
     * @param {Storyboard} value 
     * @returns {HRESULT} 
     */
    put_Storyboard(value) {
        if (!this.HasProp("__IVisualTransition")) {
            if ((queryResult := this.QueryInterface(IVisualTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualTransition := IVisualTransition(outPtr)
        }

        return this.__IVisualTransition.put_Storyboard(value)
    }

;@endregion Instance Methods
}
