#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPointAnimation.ahk
#Include .\IPointAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of a [Point](../windows.foundation/point.md) property between two target values using linear interpolation over a specified [Duration](timeline_duration.md).
 * @remarks
 * Use PointAnimation to animate the property value of any dependency property that is of type [Point](../windows.foundation/point.md).
 * 
 * Linear interpolation for a [Point](../windows.foundation/point.md) means that **X** and **Y** values are treated as a number and the interpolation is simply a mathematical operation.
 * 
 * Sometimes you'll need to use indirect property targeting in order to target a sub-property of another object that's the value of a property on the target. For example, in order to animate parts of a [PathGeometry](../windows.ui.xaml.media/pathgeometry.md), you need to reference some of the intermediate object-property values, until the last step in the indirect property path is truly a [Point](../windows.foundation/point.md) value. For more info on indirect property targeting and other storyboarded animation concepts, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations) or [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax).
 * 
 * A PointAnimation typically has at least one of the [From](pointanimation_from.md), [By](pointanimation_by.md) or [To](pointanimation_to.md) properties set, but never all three.
 * + **From only:** The animation progresses from the value specified by the **From** property to the base value of the property being animated.
 * + **From and To:** The animation progresses from the value specified by the **From** property to the value specified by the **To** property.
 * + **From and By:** The animation progresses from the value specified by the **From** property to the value specified by the sum of the **From** and **By** properties.
 * + **To only:** The animation progresses from the animated property's base value or a previous animation's output value to the value specified by the **To** property.
 * + **By only:** The animation progresses from the base value of the property being animated or a previous animation's output value to the sum of that value and the value specified by the **By** property.
 * 
 * 
 * The [From](pointanimation_from.md), [By](pointanimation_by.md) or [To](pointanimation_to.md) properties of a PointAnimation aren't a [Point](../windows.foundation/point.md) value. Instead these are a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) for [Point](../windows.foundation/point.md). The default value for these is **null**, not an uninitialized structure. That **null** value is how the animation system distinguishes that you haven't specifically set a value. Visual C++ component extensions (C++/CX) doesn't have a [Nullable](/dotnet/api/system.nullable-1?view=dotnet-uwp-10.0&preserve-view=true) type, so it uses [IReference](../windows.foundation/ireference_1.md) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PointAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointAnimation.IID

    /**
     * Identifies the [From](pointanimation_from.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.fromproperty
     * @type {DependencyProperty} 
     */
    static FromProperty {
        get => PointAnimation.get_FromProperty()
    }

    /**
     * Identifies the [To](pointanimation_to.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.toproperty
     * @type {DependencyProperty} 
     */
    static ToProperty {
        get => PointAnimation.get_ToProperty()
    }

    /**
     * Identifies the [By](pointanimation_by.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.byproperty
     * @type {DependencyProperty} 
     */
    static ByProperty {
        get => PointAnimation.get_ByProperty()
    }

    /**
     * Identifies the [EasingFunction](pointanimation_easingfunction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => PointAnimation.get_EasingFunctionProperty()
    }

    /**
     * Identifies the [EnableDependentAnimation](pointanimation_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => PointAnimation.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromProperty() {
        if (!PointAnimation.HasProp("__IPointAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationStatics.IID)
            PointAnimation.__IPointAnimationStatics := IPointAnimationStatics(factoryPtr)
        }

        return PointAnimation.__IPointAnimationStatics.get_FromProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToProperty() {
        if (!PointAnimation.HasProp("__IPointAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationStatics.IID)
            PointAnimation.__IPointAnimationStatics := IPointAnimationStatics(factoryPtr)
        }

        return PointAnimation.__IPointAnimationStatics.get_ToProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ByProperty() {
        if (!PointAnimation.HasProp("__IPointAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationStatics.IID)
            PointAnimation.__IPointAnimationStatics := IPointAnimationStatics(factoryPtr)
        }

        return PointAnimation.__IPointAnimationStatics.get_ByProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!PointAnimation.HasProp("__IPointAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationStatics.IID)
            PointAnimation.__IPointAnimationStatics := IPointAnimationStatics(factoryPtr)
        }

        return PointAnimation.__IPointAnimationStatics.get_EasingFunctionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!PointAnimation.HasProp("__IPointAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationStatics.IID)
            PointAnimation.__IPointAnimationStatics := IPointAnimationStatics(factoryPtr)
        }

        return PointAnimation.__IPointAnimationStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the animation's starting value.
     * @remarks
     * A [PointAnimation](pointanimation.md) typically has at least one of the From, [By](pointanimation_by.md) or [To](pointanimation_to.md) properties set, but never all three. For more info, see Remarks in [PointAnimation](pointanimation.md).
     * 
     * The **null** default value indicates that the base non-animated value is the default value for From, not that the animated value is literally **null**. The base non-animated value is determined at run time by the dependency property system. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.from
     * @type {IReference<POINT>} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets or sets the animation's ending value.
     * @remarks
     * A [PointAnimation](pointanimation.md) typically has at least one of the [From](pointanimation_from.md), [By](pointanimation_by.md) or To properties set, but never all three. For more info, see Remarks in [PointAnimation](pointanimation.md).
     * 
     * The **null** default value indicates that the base non-animated value is the default value for To, not that the animated value is literally **null**. The base non-animated value is determined at run time by the dependency property system. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.to
     * @type {IReference<POINT>} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Gets or sets the total amount by which the animation changes its starting value.
     * @remarks
     * A [PointAnimation](pointanimation.md) typically has at least one of the [From](pointanimation_from.md), By or [To](pointanimation_to.md) properties set, but never all three. For more info, see Remarks in [PointAnimation](pointanimation.md).
     * 
     * The **null** default value indicates that the base non-animated value is the default value for By, not that the animated value is literally **null**. The base non-animated value is determined at run time by the dependency property system. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.by
     * @type {IReference<POINT>} 
     */
    By {
        get => this.get_By()
        set => this.put_By(value)
    }

    /**
     * Gets or sets the easing function you are applying to the animation.
     * @remarks
     * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimation.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PointAnimation](pointanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_From() {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.get_From()
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.put_From(value)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_To() {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.get_To()
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.put_To(value)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_By() {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.get_By()
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_By(value) {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.put_By(value)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.put_EasingFunction(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IPointAnimation")) {
            if ((queryResult := this.QueryInterface(IPointAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimation := IPointAnimation(outPtr)
        }

        return this.__IPointAnimation.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
