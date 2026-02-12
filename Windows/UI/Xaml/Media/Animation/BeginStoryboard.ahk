#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\TriggerAction.ahk
#Include .\IBeginStoryboard.ahk
#Include .\IBeginStoryboardStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * A trigger action that begins a [Storyboard](storyboard.md). Not commonly used. See Remarks.
 * @remarks
 * [Triggers](../windows.ui.xaml/frameworkelement_triggers.md), [EventTrigger](../windows.ui.xaml/eventtrigger.md), [Actions](../windows.ui.xaml/eventtrigger_actions.md) and BeginStoryboard are not commonly used. These API mainly exist for compatibility in XAML originally used for Microsoft Silverlight. For most scenarios where event triggers were used previously, you should either use visual states, or start animations by writing a [Loaded](../windows.ui.xaml/frameworkelement_loaded.md) handler that looks up an animation in page-level resources and then calls [Begin](storyboard_begin_1621727531.md) on the animation's main [Storyboard](storyboard.md). For more info, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)) or [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * If you do choose to use [Triggers](../windows.ui.xaml/frameworkelement_triggers.md), in Windows Runtime XAML, the default behavior for event triggers and the only event that can be used to invoke an [EventTrigger](../windows.ui.xaml/eventtrigger.md) is [FrameworkElement.Loaded](../windows.ui.xaml/frameworkelement_loaded.md). Because that's both the default and the only enabled behavior, you don't set [RoutedEvent](../windows.ui.xaml/eventtrigger_routedevent.md), and just use the XAML `<EventTrigger>`. For more info, see [Triggers](../windows.ui.xaml/frameworkelement_triggers.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.beginstoryboard
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class BeginStoryboard extends TriggerAction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBeginStoryboard

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBeginStoryboard.IID

    /**
     * Identifies the [BeginStoryboard.Storyboard](beginstoryboard_storyboard.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.beginstoryboard.storyboardproperty
     * @type {DependencyProperty} 
     */
    static StoryboardProperty {
        get => BeginStoryboard.get_StoryboardProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StoryboardProperty() {
        if (!BeginStoryboard.HasProp("__IBeginStoryboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BeginStoryboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBeginStoryboardStatics.IID)
            BeginStoryboard.__IBeginStoryboardStatics := IBeginStoryboardStatics(factoryPtr)
        }

        return BeginStoryboard.__IBeginStoryboardStatics.get_StoryboardProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Storyboard](storyboard.md) that this [BeginStoryboard](beginstoryboard.md) starts.
     * @remarks
     * [Triggers](../windows.ui.xaml/frameworkelement_triggers.md), [EventTrigger](../windows.ui.xaml/eventtrigger.md), and [BeginStoryboard](beginstoryboard.md) are not commonly used. These API mainly exist for compatibility in XAML originally used for Microsoft Silverlight. For most scenarios where event triggers were used previously, you should either use visual states, or start animations by writing a [Loaded](../windows.ui.xaml/frameworkelement_loaded.md) handler that looks up an animation in page-level resources and then calls [Begin](storyboard_begin_1621727531.md) on the animation's main [Storyboard](storyboard.md). For more info, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)) or [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.beginstoryboard.storyboard
     * @type {Storyboard} 
     */
    Storyboard {
        get => this.get_Storyboard()
        set => this.put_Storyboard(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BeginStoryboard](beginstoryboard.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BeginStoryboard")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Storyboard} 
     */
    get_Storyboard() {
        if (!this.HasProp("__IBeginStoryboard")) {
            if ((queryResult := this.QueryInterface(IBeginStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBeginStoryboard := IBeginStoryboard(outPtr)
        }

        return this.__IBeginStoryboard.get_Storyboard()
    }

    /**
     * 
     * @param {Storyboard} value 
     * @returns {HRESULT} 
     */
    put_Storyboard(value) {
        if (!this.HasProp("__IBeginStoryboard")) {
            if ((queryResult := this.QueryInterface(IBeginStoryboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBeginStoryboard := IBeginStoryboard(outPtr)
        }

        return this.__IBeginStoryboard.put_Storyboard(value)
    }

;@endregion Instance Methods
}
