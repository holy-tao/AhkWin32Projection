#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDoubleAnimation.ahk
#Include .\IDoubleAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) property between two target values using linear interpolation over a specified [Duration](timeline_duration.md).
 * @remarks
 * Use DoubleAnimation to animate the property value of any dependency property that is of type [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true).
 * 
 * Sometimes you'll need to use indirect property targeting in order to target a sub-property of another object that's the value of a property on the target. For example, in order to animate the X component of a [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) of a [UIElement](../windows.ui.xaml/uielement.md), you need to reference some of the intermediate object-property values, until the last step in the indirect property path is truly a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) value, as is the case with [TranslateTransform.X](../windows.ui.xaml.media/translatetransform_x.md). The correct string to use for [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) in this example is "(UIElement.RenderTransform).(TranslateTransform.X)". For more info on indirect property targeting and other storyboarded animation concepts, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * A DoubleAnimation typically has at least one of the [From](doubleanimation_from.md), [By](doubleanimation_by.md) or [To](doubleanimation_to.md) properties set, but never all three.
 * + **From only:** The animation progresses from the value specified by the **From** property to the base value of the property being animated.
 * + **From and To:** The animation progresses from the value specified by the **From** property to the value specified by the **To** property.
 * + **From and By:** The animation progresses from the value specified by the **From** property to the value specified by the sum of the **From** and **By** properties.
 * + **To only:** The animation progresses from the animated property's base value or a previous animation's output value to the value specified by the **To** property.
 * + **By only:** The animation progresses from the base value of the property being animated or a previous animation's output value to the sum of that value and the value specified by the **By** property.
 * 
 * 
 * You can't animate the **X** and **Y** values of a [Point](../windows.foundation/point.md) using a DoubleAnimation, because these properties aren't dependency properties ([Point](../windows.foundation/point.md) is a structure and can't have dependency properties.) Instead, use [PointAnimation](pointanimation.md) to animate dependency properties that have a [Point](../windows.foundation/point.md) value.
 * 
 * You also can't use DoubleAnimation to animate **int** values or **byte** values. Instead, you'll have to use [ObjectAnimationUsingKeyFrames](objectanimationusingkeyframes.md), which won't give you an interpolation behavior, so you might need to define multiple keyframes to get a reasonably smooth animation. There aren't many UI-related dependency properties that use **int** values or **byte** values, so this shouldn't be a common scenario other than for custom properties.
 * 
 * The [From](doubleanimation_from.md), [By](doubleanimation_by.md) or [To](doubleanimation_to.md) properties of a DoubleAnimation aren't strictly a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true). Instead these are a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) for [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true). The default value for these is **null**, not 0. That **null** value is how the animation system distinguishes that you haven't specifically set a value. Visual C++ component extensions (C++/CX) doesn't have a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) type, so it uses [IReference](../windows.foundation/ireference_1.md) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DoubleAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDoubleAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDoubleAnimation.IID

    /**
     * Identifies the [From](doubleanimation_from.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.fromproperty
     * @type {DependencyProperty} 
     */
    static FromProperty {
        get => DoubleAnimation.get_FromProperty()
    }

    /**
     * Identifies the [To](doubleanimation_to.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.toproperty
     * @type {DependencyProperty} 
     */
    static ToProperty {
        get => DoubleAnimation.get_ToProperty()
    }

    /**
     * Identifies the [By](doubleanimation_by.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.byproperty
     * @type {DependencyProperty} 
     */
    static ByProperty {
        get => DoubleAnimation.get_ByProperty()
    }

    /**
     * Identifies the [EasingFunction](doubleanimation_easingfunction.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => DoubleAnimation.get_EasingFunctionProperty()
    }

    /**
     * Identifies the [EnableDependentAnimation](doubleanimation_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => DoubleAnimation.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromProperty() {
        if (!DoubleAnimation.HasProp("__IDoubleAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleAnimationStatics.IID)
            DoubleAnimation.__IDoubleAnimationStatics := IDoubleAnimationStatics(factoryPtr)
        }

        return DoubleAnimation.__IDoubleAnimationStatics.get_FromProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToProperty() {
        if (!DoubleAnimation.HasProp("__IDoubleAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleAnimationStatics.IID)
            DoubleAnimation.__IDoubleAnimationStatics := IDoubleAnimationStatics(factoryPtr)
        }

        return DoubleAnimation.__IDoubleAnimationStatics.get_ToProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ByProperty() {
        if (!DoubleAnimation.HasProp("__IDoubleAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleAnimationStatics.IID)
            DoubleAnimation.__IDoubleAnimationStatics := IDoubleAnimationStatics(factoryPtr)
        }

        return DoubleAnimation.__IDoubleAnimationStatics.get_ByProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!DoubleAnimation.HasProp("__IDoubleAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleAnimationStatics.IID)
            DoubleAnimation.__IDoubleAnimationStatics := IDoubleAnimationStatics(factoryPtr)
        }

        return DoubleAnimation.__IDoubleAnimationStatics.get_EasingFunctionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!DoubleAnimation.HasProp("__IDoubleAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleAnimationStatics.IID)
            DoubleAnimation.__IDoubleAnimationStatics := IDoubleAnimationStatics(factoryPtr)
        }

        return DoubleAnimation.__IDoubleAnimationStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the animation's starting value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.from
     * @type {IReference<Float>} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets or sets the animation's ending value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.to
     * @type {IReference<Float>} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Gets or sets the total amount by which the animation changes its starting value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.by
     * @type {IReference<Float>} 
     */
    By {
        get => this.get_By()
        set => this.put_By(value)
    }

    /**
     * Gets or sets the easing function applied to this animation.
     * @remarks
     * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doubleanimation.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DoubleAnimation](doubleanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_From() {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.get_From()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.put_From(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_To() {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.get_To()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.put_To(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_By() {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.get_By()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_By(value) {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.put_By(value)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.put_EasingFunction(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IDoubleAnimation")) {
            if ((queryResult := this.QueryInterface(IDoubleAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleAnimation := IDoubleAnimation(outPtr)
        }

        return this.__IDoubleAnimation.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
