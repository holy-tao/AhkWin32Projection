#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ITimeline.ahk
#Include .\ITimelineStatics.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Defines a duration and other behavior properties for a Windows Runtime animation. Timeline is the base class for [Storyboard](storyboard.md) and all the Windows Runtime animation types, including those from the animation library and those used for custom animations in visual states or page-level XAML.
 * @remarks
 * Timeline defines the [Duration](timeline_duration.md) property that controls how long an animation runs once started. Timeline also defines these behavior properties, which are common to all animations types, and to [Storyboard](storyboard.md):
 * + [AutoReverse](timeline_autoreverse.md)
 * + [BeginTime](timeline_begintime.md)
 * + [FillBehavior](timeline_fillbehavior.md)
 * + [RepeatBehavior](repeatbehavior.md)
 * + [SpeedRatio](timeline_speedratio.md) (not commonly used)
 * 
 * 
 * Timeline also defines the [Completed](timeline_completed.md) event for [Storyboard](storyboard.md) and animations. Handling the [Completed](timeline_completed.md) event isn't necessary or most UI animation scenarios.
 * 
 * The relationship between [Storyboard](storyboard.md) and the animation types is that a [Storyboard](storyboard.md) is a container that can group multiple animations, and acts as the controller for starting and stopping the contained animations. When you set Timeline properties on a [Storyboard](storyboard.md) as opposed to individual animations within a [Storyboard](storyboard.md), the Timeline properties set in the [Storyboard](storyboard.md) typically override those from the combined animations. For more info see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * Timeline has a strongly typed collection class that is used for properties that take a set of Timeline values, such as [Storyboard.Children](storyboard_children.md). For more info see [TimelineCollection](timelinecollection.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class Timeline extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimeline

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimeline.IID

    /**
     * Gets or sets a value that determines whether dependent animations should be permitted to run, throughout the app.
     * @remarks
     * If you want to set this property value to **false**, do so as part of page or app initialization, for example in an app activation handler. The property is global for the app, and acts like an app setting, even if you set it in a page scope.
     * 
     * A **false** value for AllowDependentAnimations overrides all cases where **EnableDependentAnimation** is set to **true** on individual animations. When AllowDependentAnimations is **false**, no dependent animation will run in your app, they all act as if **EnableDependentAnimation** is **false** on all animations. For animations declared in the app's page XAML, it might seem that it wouldn't be necessary to disable the dependent animations because you have control over them already by not explicitly setting the **EnableDependentAnimation** properties. But the scenario for AllowDependentAnimations is more for app authors who are consuming controls with control templates that might contain dependent animations within them. Such animations might exist in the visual states, if the control authors didn't follow visual state best practices. (The control templates for default Windows Runtime controls don't have dependent animations, so you won't need to use AllowDependentAnimations if you're only using default XAML controls and default templates.)
     * 
     * 
     * 
     * > [!NOTE]
     * > If you're using [UIElement.CacheMode](../windows.ui.xaml/uielement_cachemode.md), you may have unintentionally created dependent animations, even when using default XAML controls; for more info, see [UIElement.CacheMode](../windows.ui.xaml/uielement_cachemode.md) and [Optimize animations and media](/windows/uwp/debug-test-perf/optimize-animations-and-media).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.allowdependentanimations
     * @type {Boolean} 
     */
    static AllowDependentAnimations {
        get => Timeline.get_AllowDependentAnimations()
        set => Timeline.put_AllowDependentAnimations(value)
    }

    /**
     * Identifies the [AutoReverse](timeline_autoreverse.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.autoreverseproperty
     * @type {DependencyProperty} 
     */
    static AutoReverseProperty {
        get => Timeline.get_AutoReverseProperty()
    }

    /**
     * Identifies the [BeginTime](timeline_begintime.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.begintimeproperty
     * @type {DependencyProperty} 
     */
    static BeginTimeProperty {
        get => Timeline.get_BeginTimeProperty()
    }

    /**
     * Identifies the [Duration](timeline_duration.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.durationproperty
     * @type {DependencyProperty} 
     */
    static DurationProperty {
        get => Timeline.get_DurationProperty()
    }

    /**
     * Identifies for the [SpeedRatio](timeline_speedratio.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.speedratioproperty
     * @type {DependencyProperty} 
     */
    static SpeedRatioProperty {
        get => Timeline.get_SpeedRatioProperty()
    }

    /**
     * Identifies the [FillBehavior](timeline_fillbehavior.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.fillbehaviorproperty
     * @type {DependencyProperty} 
     */
    static FillBehaviorProperty {
        get => Timeline.get_FillBehaviorProperty()
    }

    /**
     * Identifies the [RepeatBehavior](timeline_repeatbehavior.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.repeatbehaviorproperty
     * @type {DependencyProperty} 
     */
    static RepeatBehaviorProperty {
        get => Timeline.get_RepeatBehaviorProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_AllowDependentAnimations() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_AllowDependentAnimations()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_AllowDependentAnimations(value) {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.put_AllowDependentAnimations(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoReverseProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_AutoReverseProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BeginTimeProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_BeginTimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DurationProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_DurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SpeedRatioProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_SpeedRatioProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillBehaviorProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_FillBehaviorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RepeatBehaviorProperty() {
        if (!Timeline.HasProp("__ITimelineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.Timeline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineStatics.IID)
            Timeline.__ITimelineStatics := ITimelineStatics(factoryPtr)
        }

        return Timeline.__ITimelineStatics.get_RepeatBehaviorProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the timeline plays in reverse after it completes a forward iteration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.autoreverse
     * @type {Boolean} 
     */
    AutoReverse {
        get => this.get_AutoReverse()
        set => this.put_AutoReverse(value)
    }

    /**
     * Gets or sets the time at which this [Timeline](timeline.md) should begin.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.begintime
     * @type {IReference<TimeSpan>} 
     */
    BeginTime {
        get => this.get_BeginTime()
        set => this.put_BeginTime(value)
    }

    /**
     * Gets or sets the length of time for which this timeline plays, not counting repetitions.
     * @remarks
     * A [Duration](../windows.ui.xaml/duration.md) value has a **TimeSpan** component.
     * + For Visual C++ component extensions (C++/CX), the data value of a [Duration](../windows.ui.xaml/duration.md) is a property named **TimeSpan**. This has a [TimeSpan](../windows.foundation/timespan.md) structure value, and that structure has a field named **Duration** that reports the duration as an **int64** that counts in 100-nanosecond units. [TimeSpan](../windows.foundation/timespan.md) doesn't have any methods for getting components of the time in *hours:minutes:seconds* format.
     * + For C# or Microsoft Visual Basic, you can use utility methods of **System.TimeSpan** to get the duration components in whatever format you want. For example you can get [TimeSpan.Hours](/dotnet/api/system.timespan.hours?view=dotnet-uwp-10.0&preserve-view=true), [TimeSpan.Minutes](/dotnet/api/system.timespan.minutes?view=dotnet-uwp-10.0&preserve-view=true) and [TimeSpan.Seconds](/dotnet/api/system.timespan.seconds?view=dotnet-uwp-10.0&preserve-view=true) separately.
     * + For more info, see Remarks in the [Duration](../windows.ui.xaml/duration.md) reference topic.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.duration
     * @type {Duration} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets the rate, relative to its parent, at which time progresses for this [Timeline](timeline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.speedratio
     * @type {Float} 
     */
    SpeedRatio {
        get => this.get_SpeedRatio()
        set => this.put_SpeedRatio(value)
    }

    /**
     * Gets or sets a value that specifies how the animation behaves after it reaches the end of its active period.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.fillbehavior
     * @type {Integer} 
     */
    FillBehavior {
        get => this.get_FillBehavior()
        set => this.put_FillBehavior(value)
    }

    /**
     * Gets or sets the repeating behavior of this timeline.
     * @remarks
     * For more info and examples, see the [RepeatBehavior](repeatbehavior.md) Struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timeline.repeatbehavior
     * @type {RepeatBehavior} 
     */
    RepeatBehavior {
        get => this.get_RepeatBehavior()
        set => this.put_RepeatBehavior(value)
    }

    /**
     * Occurs when the [Storyboard](storyboard.md) object has completed playing.
     * @type {EventHandler<IInspectable>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoReverse() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_AutoReverse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoReverse(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_AutoReverse(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_BeginTime() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_BeginTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_BeginTime(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_BeginTime(value)
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_Duration() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_Duration()
    }

    /**
     * 
     * @param {Duration} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_Duration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeedRatio() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_SpeedRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpeedRatio(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_SpeedRatio(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillBehavior() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_FillBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FillBehavior(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_FillBehavior(value)
    }

    /**
     * 
     * @returns {RepeatBehavior} 
     */
    get_RepeatBehavior() {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.get_RepeatBehavior()
    }

    /**
     * 
     * @param {RepeatBehavior} value 
     * @returns {HRESULT} 
     */
    put_RepeatBehavior(value) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.put_RepeatBehavior(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__ITimeline")) {
            if ((queryResult := this.QueryInterface(ITimeline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimeline := ITimeline(outPtr)
        }

        return this.__ITimeline.remove_Completed(token)
    }

;@endregion Instance Methods
}
