#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRoutedEvent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a routed event to the Windows Runtime event system.
 * @remarks
 * > [!NOTE]
 * > The Windows Runtime event system doesn't enable you to create a custom routed event; only the Windows Runtime itself can define an event such that it has the routed event behavior.
 * 
 * For more info on how routed events work, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview). The RoutedEvent type is part of the infrastructure for routed events, but you don't use RoutedEvent directly in typical Windows Runtime app programming.
 * 
 * The purpose of the RoutedEvent type is to serve as an identifier for the Windows Runtime event system, similar to how [DependencyProperty](dependencyproperty.md) provides an identifier type for the dependency property system. [UIElement](uielement.md) includes several static read-only properties of type RoutedEvent, which are named using a naming pattern. Each RoutedEvent property is named after an event plus the suffix "Event". Each such property is the identifier for the routed event that its name begins with. For example, [TappedEvent](uielement_tappedevent.md) identifies the [Tapped](uielement_tapped.md) routed event to the event system.
 * 
 * For most app code usages, simply referencing the event by name in XAML or by its code entity name in code is all that's needed to reference an event on an object, for purposes of adding or removing handlers. The RoutedEvent identifiers are only needed when you attach handlers that should be invoked even when the routed events are previously marked as handled by either system or app code. The API you use for this scenario, and the API that use a RoutedEvent value as a parameter, are [UIElement.AddHandler](uielement_addhandler_2121467075.md) and [UIElement.RemoveHandler](uielement_removehandler_661998757.md). For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.routedevent
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class RoutedEvent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRoutedEvent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRoutedEvent.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
