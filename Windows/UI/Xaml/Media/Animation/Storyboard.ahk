#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IStoryboard.ahk
#Include .\IStoryboardStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Controls animations with a timeline, and provides object and property targeting information for its child animations.
 * @remarks
 * Storyboard is an important class in the concept of *storyboarded animations*. For more info on the concept, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * Storyboard is used for these properties:
 * 
 * + [VisualState.Storyboard](../windows.ui.xaml/visualstate_storyboard.md)
 * + [VisualTransition.Storyboard](../windows.ui.xaml/visualtransition_storyboard.md)
 * + [BeginStoryboard.Storyboard](beginstoryboard_storyboard.md)
 * 
 * 
 * These properties aren't the only place where a Storyboard is defined. The typical way that a Storyboard is used for a storyboarded animation is that the Storyboard is defined in a **Resources** collection (either [Application.Resources](../windows.ui.xaml/application_resources.md) or [FrameworkElement.Resources](../windows.ui.xaml/frameworkelement_resources.md), or possibly as a resource within a file such as Generic.xaml for a custom control). Whenever it's defined as a XAML resource, you should always assign an [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) value to your Storyboard. You can then reference the name as a programming variable later in code-behind. You'll need this reference to actually run the animations that the Storyboard contains, by calling the [Begin](storyboard_begin_1621727531.md) method on that Storyboard instance. Storyboard also has other control methods such as [Stop](storyboard_stop_1201535524.md) that can control the animation thereafter.
 * 
 * Storyboard inherits several properties from [Timeline](timeline.md). These properties can be applied either to a Storyboard or to one of the animations within it (in the [Children](storyboard_children.md) collection). There are pros and cons to setting [Timeline](timeline.md) properties on the main Storyboard instead of on each animation. For more info, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * You also need a Storyboard in order to control the predefined animations that you add to controls or UI, if you are using one of the theme animations. Theme animations don't have an innate trigger point, so you need to contain theme animations in a Storyboard as the [Children](storyboard_children.md). If the Storyboard is used as the [VisualState.Storyboard](../windows.ui.xaml/visualstate_storyboard.md) value then the animation runs when that visual state is loaded. Or, if it's in a [VisualTransition.Storyboard](../windows.ui.xaml/visualtransition_storyboard.md), the animation runs when that transition is detected by the visual state manager. These are the most common way to use a theme animation, but you could also put one in a loose Storyboard resource and explicitly start the animation by calling [Begin](storyboard_begin_1621727531.md). For more info on how to use theme animations, see [Quickstart: Animating your UI using library animations](/previous-versions/windows/apps/hh452703(v=win.10)) or [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class Storyboard extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoryboard

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoryboard.IID

    /**
     * Identifies the [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.targetpropertyproperty
     * @type {DependencyProperty} 
     */
    static TargetPropertyProperty {
        get => Storyboard.get_TargetPropertyProperty()
    }

    /**
     * Identifies the [Storyboard.TargetName](storyboard_targetname.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => Storyboard.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetPropertyProperty() {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.get_TargetPropertyProperty()
    }

    /**
     * Gets the value of the [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) XAML attached property from a target element.
     * @param {Timeline} element The target element from which to get the value.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.gettargetproperty
     */
    static GetTargetProperty(element) {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.GetTargetProperty(element)
    }

    /**
     * Sets the value of the [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) XAML attached property for a target element.
     * @remarks
     * Using SetTargetProperty in code as opposed to targeting an animation in initial XAML definitions is rare. It's tricky to get all the targeting and timing correct in an animation, particularly if you're trying to incorporate values that are only available at run time. We recommend that you create your animations in XAML, which means you'll use the [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) attached property, not the SetTargetProperty runtime method (which supports the XAML behind the scenes). Building up animations in code is an advanced scenario. Here's a very basic code example of what's involved:
     * ```csharp
     *             Rectangle rect = new Rectangle();
     *             rect.RenderTransform = new ScaleTransform();
     *             //TODO - connect this Rectangle to the visual tree
     *             Storyboard storyboard = new Storyboard();
     *             DoubleAnimation scalex = new DoubleAnimation()
     *             {
     *                 From = 0,
     *                 To = 8,
     *                 AutoReverse = true,
     *                 Duration = TimeSpan.FromSeconds(2)
     *             };
     *             Storyboard.SetTargetProperty(scalex, "(Rectangle.RenderTransform).(ScaleTransform.ScaleX)");
     *             Storyboard.SetTarget(scalex, rect);
     *             //TODO - Begin the animation
     * ```
     * @param {Timeline} element The target element for which to set the value.
     * @param {HSTRING} path_ The [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) value of the target element to set. This specifies a qualification path that targets the dependency property where the animation applies. See Remarks.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.settargetproperty
     */
    static SetTargetProperty(element, path_) {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.SetTargetProperty(element, path_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.get_TargetNameProperty()
    }

    /**
     * Gets the value of the [Storyboard.TargetName](storyboard_targetname.md) XAML attached property from a target element.
     * @param {Timeline} element The target element from which to get the value.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.gettargetname
     */
    static GetTargetName(element) {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.GetTargetName(element)
    }

    /**
     * Sets the value of the [Storyboard.TargetName](storyboard_targetname.md) XAML attached property for a target element.
     * @param {Timeline} element The target element to set the value for.
     * @param {HSTRING} name The [Storyboard.TargetName](storyboard_targetname.md) value of the target element to set. This should correspond to an existing [Name](../windows.ui.xaml/frameworkelement_name.md) or **x:Name** value on the UI element that the animation targets.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.settargetname
     */
    static SetTargetName(element, name) {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.SetTargetName(element, name)
    }

    /**
     * Causes the specified [Timeline](timeline.md) to target the specified object.
     * @param {Timeline} timeline_ The timeline that targets the specified dependency object.
     * @param {DependencyObject} target The actual instance of the object to target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.settarget
     */
    static SetTarget(timeline_, target) {
        if (!Storyboard.HasProp("__IStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoryboardStatics.IID)
            Storyboard.__IStoryboardStatics := IStoryboardStatics(factoryPtr)
        }

        return Storyboard.__IStoryboardStatics.SetTarget(timeline_, target)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of child [Timeline](timeline.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.children
     * @type {TimelineCollection} 
     */
    Children {
        get => this.get_Children()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Storyboard](storyboard.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Storyboard")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimelineCollection} 
     */
    get_Children() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.get_Children()
    }

    /**
     * Moves the storyboard to the specified animation position. The storyboard performs the requested seek when the next clock tick occurs.
     * @param {TimeSpan} offset A positive or negative time value that describes the amount by which the timeline should move forward or backward from the beginning of the animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.seek
     */
    Seek(offset) {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.Seek(offset)
    }

    /**
     * Stops the storyboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.stop
     */
    Stop() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.Stop()
    }

    /**
     * Initiates the set of animations associated with the storyboard.
     * @remarks
     * Calling this method begins all the animations that are in the [Children](storyboard_children.md) collection of the [Storyboard](storyboard.md).
     * 
     * Begin starts the animations within the [Storyboard](storyboard.md) from their initial state, a clock time of zero. If you want to restart an animation where [Pause](storyboard_pause_1953642114.md) had been called previously, and continue on from the clock time where it was paused, use [Resume](storyboard_resume_406343050.md) instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.begin
     */
    Begin() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.Begin()
    }

    /**
     * Pauses the animation clock associated with the storyboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.pause
     */
    Pause() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.Pause()
    }

    /**
     * Resumes the animation clock, or run-time state, associated with the storyboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.resume
     */
    Resume() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.Resume()
    }

    /**
     * Gets the clock state of the [Storyboard](storyboard.md).
     * @remarks
     * This method is useful if you want to modify an animation's properties at runtime, before the animation is started. An animation that is stopped (GetCurrentState returns **ClockState.Stopped**) can still be modified. An animation that is running (GetCurrentState returns either **ClockState.Active** or **ClockState.Filling**) cannot be modified, and you'll get an error if you try.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.getcurrentstate
     */
    GetCurrentState() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.GetCurrentState()
    }

    /**
     * Gets the current animation clock time of the [Storyboard](storyboard.md).
     * @returns {TimeSpan} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.getcurrenttime
     */
    GetCurrentTime() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.GetCurrentTime()
    }

    /**
     * Moves the storyboard to the specified animation position immediately (synchronously).
     * @param {TimeSpan} offset A positive or negative time value that describes the amount by which the timeline should move forward or backward from the beginning of the animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.seekalignedtolasttick
     */
    SeekAlignedToLastTick(offset) {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.SeekAlignedToLastTick(offset)
    }

    /**
     * Advances the current time of the storyboard's clock to the end of its active period.
     * @remarks
     * If you call this method on an animation that doesn't have a [FillBehavior](timeline_fillbehavior.md) value of **HoldEnd**, this has the same effect as calling [Stop](storyboard_stop_1201535524.md).
     * 
     * This method is mainly relevant for methods that are playing or paused, and which don't have infinite repeat. Calling SkipToFill on an infinite animation or an animation that's already stopped has no effect.
     * 
     * 
     * <!--What about if Begin hasn't been called yet?-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.storyboard.skiptofill
     */
    SkipToFill() {
        if (!this.HasProp("__IStoryboard")) {
            if ((queryResult := this.QueryInterface(IStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoryboard := IStoryboard(outPtr)
        }

        return this.__IStoryboard.SkipToFill()
    }

;@endregion Instance Methods
}
