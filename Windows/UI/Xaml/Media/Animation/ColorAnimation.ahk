#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IColorAnimation.ahk
#Include .\IColorAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of a [Color](../windows.ui/color.md) property between two target values using linear interpolation over a specified [Duration](timeline_duration.md).
 * @remarks
 * Use ColorAnimation to animate the property value of any dependency property that is of type [Color](../windows.ui/color.md).
 * 
 * Linear interpolation for a [Color](../windows.ui/color.md) means that each of the **ARGB** values is treated as a byte and the interpolation is simply a mathematical operation. You get best results from color interpolation if at least one of the **RGB** components is the same or close to the same in both the starting value and ending value.
 * 
 * You usually need to use indirect property targeting in order to target a sub-property of another object that's the value of a property on the target. This is because very few properties that display color information in UI elements are actually of type [Color](../windows.ui/color.md). Most are instead of type [Brush](../windows.ui.xaml.media/brush.md). To use ColorAnimation on UI elements, you typically are targeting the [Color](../windows.ui.xaml.media/solidcolorbrush_color.md) property of a [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) that's the sub-property value. Syntax for this is shown in the XAML example in the "Examples" section. For more info on indirect property targeting and other storyboarded animation concepts, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations) or [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax).
 * 
 * A ColorAnimation typically has at least one of the [From](coloranimation_from.md), [By](coloranimation_by.md) or [To](coloranimation_to.md) properties set, but never all three.
 * + **From only:** The animation progresses from the value specified by the [From](coloranimation_from.md) property to the base value of the property being animated.
 * + **From and To:** The animation progresses from the value specified by the [From](coloranimation_from.md) property to the value specified by the [To](coloranimation_to.md) property.
 * + **From and By:** The animation progresses from the value specified by the [From](coloranimation_from.md) property to the value specified by the sum of the [From](coloranimation_from.md) and [By](coloranimation_by.md) properties.
 * + **To only:** The animation progresses from the animated property's base value or a previous animation's output value to the value specified by the [To](coloranimation_to.md) property.
 * + **By only:** The animation progresses from the base value of the property being animated or a previous animation's output value to the sum of that value and the value specified by the [By](coloranimation_by.md) property.
 * 
 * 
 * The [From](coloranimation_from.md), [By](coloranimation_by.md) and [To](coloranimation_to.md) properties of a ColorAnimation aren't strictly a [Color](../windows.ui/color.md). Instead these are a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) for [Color](../windows.ui/color.md). The default value for these is **null**, not an uninitialized structure. That **null** value is how the animation system distinguishes that you haven't specifically set a value. Visual C++ component extensions (C++/CX) doesn't have a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) type, so it uses [IReference](../windows.foundation/ireference_1.md) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ColorAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorAnimation.IID

    /**
     * Identifies the [From](coloranimation_from.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.fromproperty
     * @type {DependencyProperty} 
     */
    static FromProperty {
        get => ColorAnimation.get_FromProperty()
    }

    /**
     * Identifies the [To](coloranimation_to.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.toproperty
     * @type {DependencyProperty} 
     */
    static ToProperty {
        get => ColorAnimation.get_ToProperty()
    }

    /**
     * Identifies the [By](coloranimation_by.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.byproperty
     * @type {DependencyProperty} 
     */
    static ByProperty {
        get => ColorAnimation.get_ByProperty()
    }

    /**
     * Identifies the [EasingFunction](coloranimation_easingfunction.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => ColorAnimation.get_EasingFunctionProperty()
    }

    /**
     * Identifies the [EnableDependentAnimation](coloranimation_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => ColorAnimation.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromProperty() {
        if (!ColorAnimation.HasProp("__IColorAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationStatics.IID)
            ColorAnimation.__IColorAnimationStatics := IColorAnimationStatics(factoryPtr)
        }

        return ColorAnimation.__IColorAnimationStatics.get_FromProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToProperty() {
        if (!ColorAnimation.HasProp("__IColorAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationStatics.IID)
            ColorAnimation.__IColorAnimationStatics := IColorAnimationStatics(factoryPtr)
        }

        return ColorAnimation.__IColorAnimationStatics.get_ToProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ByProperty() {
        if (!ColorAnimation.HasProp("__IColorAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationStatics.IID)
            ColorAnimation.__IColorAnimationStatics := IColorAnimationStatics(factoryPtr)
        }

        return ColorAnimation.__IColorAnimationStatics.get_ByProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!ColorAnimation.HasProp("__IColorAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationStatics.IID)
            ColorAnimation.__IColorAnimationStatics := IColorAnimationStatics(factoryPtr)
        }

        return ColorAnimation.__IColorAnimationStatics.get_EasingFunctionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!ColorAnimation.HasProp("__IColorAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationStatics.IID)
            ColorAnimation.__IColorAnimationStatics := IColorAnimationStatics(factoryPtr)
        }

        return ColorAnimation.__IColorAnimationStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the animation's starting value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.from
     * @type {IReference<Color>} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets or sets the animation's ending value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.to
     * @type {IReference<Color>} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Gets or sets the total amount by which the animation changes its starting value.
     * @remarks
     * When you use the By property to animate a color by the specified amount, the hexadecimal value of the By property is added to the hexadecimal value of the starting color. If you're using named colors, remember, the name just represents an _rgb_ value, and that value is what is being added.
     * 
     * For example, if you animate #FF0000 (Red) by #0000FF (Blue), the final color is #FF00FF (Fuchsia). However, if you animate #FF00FF (Fuchsia) by #0000FF (Blue), the final color is still #FF00FF (Fuchsia).
     * 
     * You can set the By property by itself or with the [From](coloranimation_from.md) property. If you set both the By and [To](coloranimation_to.md) properties, the By value is ignored and the animation ends with the To value.
     * 
     * + **By only:** The animation progresses from the base value of the property being animated or a previous animation's output value to the sum of that value and the value specified by the [By](coloranimation_by.md) property.
     * + **From and By:** The animation progresses from the value specified by the [From](coloranimation_from.md) property to the value specified by the sum of the [From](coloranimation_from.md) and [By](coloranimation_by.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.by
     * @type {IReference<Color>} 
     */
    By {
        get => this.get_By()
        set => this.put_By(value)
    }

    /**
     * Gets or sets the easing function applied to this animation.
     * @remarks
     * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimation.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ColorAnimation](coloranimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_From() {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.get_From()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.put_From(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_To() {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.get_To()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.put_To(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_By() {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.get_By()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_By(value) {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.put_By(value)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.put_EasingFunction(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IColorAnimation")) {
            if ((queryResult := this.QueryInterface(IColorAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimation := IColorAnimation(outPtr)
        }

        return this.__IColorAnimation.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
