#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TriggerBase.ahk
#Include .\IEventTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that applies a set of actions (animation storyboards) in response to an event. Not commonly used. See Remarks.
 * @remarks
 * [Triggers](frameworkelement_triggers.md), EventTrigger, [Actions](eventtrigger_actions.md) and [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) are not commonly used. These API mainly exist for compatibility in XAML originally used for Microsoft Silverlight. For most scenarios where event triggers were used previously, do one of these:
 * + Use built-in animations from the animation library. See [Quickstart: Animating your UI using the animation library](/previous-versions/windows/apps/hh452703(v=win.10)).
 * + For events in control templates, use visual states and [VisualStateManager](visualstatemanager.md). See [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)) or [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)).
 * + For app-specific UI animations, define a [Loaded](frameworkelement_loaded.md) handler on the page. This handler can reference a [Storyboard](visualstate_storyboard.md) that's defined in page-level resources, and call the [Begin](../windows.ui.xaml.media.animation/storyboard_begin_1621727531.md) method on that [Storyboard](../windows.ui.xaml.media.animation/storyboard.md). See [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * 
 * If you do choose to use [Triggers](frameworkelement_triggers.md), in Windows Runtime XAML, the default behavior for event triggers and the only event that can be used to invoke an EventTrigger is [FrameworkElement.Loaded](frameworkelement_loaded.md). Because that's both the default and the only enabled behavior, don't set the [RoutedEvent](eventtrigger_routedevent.md) attribute. Just use the XAML `<EventTrigger>`. If you set [RoutedEvent](eventtrigger_routedevent.md) explicitly (not recommended), the only XAML that works is `<EventTrigger RoutedEvent="FrameworkElement.Loaded">`. Unqualified "Loaded", or any other value, throws a parse exception. For more info, see [Triggers](frameworkelement_triggers.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.eventtrigger
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class EventTrigger extends TriggerBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEventTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEventTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the event that initiates the trigger. Not commonly set, see Remarks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.eventtrigger.routedevent
     * @type {RoutedEvent} 
     */
    RoutedEvent {
        get => this.get_RoutedEvent()
        set => this.put_RoutedEvent(value)
    }

    /**
     * Gets the collection of [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) objects that this [EventTrigger](eventtrigger.md) maintains.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.eventtrigger.actions
     * @type {TriggerActionCollection} 
     */
    Actions {
        get => this.get_Actions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EventTrigger](eventtrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.EventTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_RoutedEvent() {
        if (!this.HasProp("__IEventTrigger")) {
            if ((queryResult := this.QueryInterface(IEventTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEventTrigger := IEventTrigger(outPtr)
        }

        return this.__IEventTrigger.get_RoutedEvent()
    }

    /**
     * 
     * @param {RoutedEvent} value 
     * @returns {HRESULT} 
     */
    put_RoutedEvent(value) {
        if (!this.HasProp("__IEventTrigger")) {
            if ((queryResult := this.QueryInterface(IEventTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEventTrigger := IEventTrigger(outPtr)
        }

        return this.__IEventTrigger.put_RoutedEvent(value)
    }

    /**
     * 
     * @returns {TriggerActionCollection} 
     */
    get_Actions() {
        if (!this.HasProp("__IEventTrigger")) {
            if ((queryResult := this.QueryInterface(IEventTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEventTrigger := IEventTrigger(outPtr)
        }

        return this.__IEventTrigger.get_Actions()
    }

;@endregion Instance Methods
}
