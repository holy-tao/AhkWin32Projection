#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowPatternIdentifiers.ahk
#Include .\IWindowPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IWindowProvider](../windows.ui.xaml.automation.provider/iwindowprovider.md).
 * @remarks
 * Classes such as WindowPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IWindowProvider](../windows.ui.xaml.automation.provider/iwindowprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer. Using this pattern for controls is fairly uncommon.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IWindowProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iwindowprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class WindowPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowPatternIdentifiers.IID

    /**
     * Identifies the [Maximizable](../windows.ui.xaml.automation.provider/iwindowprovider_maximizable.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.canmaximizeproperty
     * @type {AutomationProperty} 
     */
    static CanMaximizeProperty {
        get => WindowPatternIdentifiers.get_CanMaximizeProperty()
    }

    /**
     * Identifies the [Minimizable](../windows.ui.xaml.automation.provider/iwindowprovider_minimizable.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.canminimizeproperty
     * @type {AutomationProperty} 
     */
    static CanMinimizeProperty {
        get => WindowPatternIdentifiers.get_CanMinimizeProperty()
    }

    /**
     * Identifies the [IsModal](../windows.ui.xaml.automation.provider/iwindowprovider_ismodal.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.ismodalproperty
     * @type {AutomationProperty} 
     */
    static IsModalProperty {
        get => WindowPatternIdentifiers.get_IsModalProperty()
    }

    /**
     * Identifies the [IsTopmost](../windows.ui.xaml.automation.provider/iwindowprovider_istopmost.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.istopmostproperty
     * @type {AutomationProperty} 
     */
    static IsTopmostProperty {
        get => WindowPatternIdentifiers.get_IsTopmostProperty()
    }

    /**
     * Identifies the [InteractionState](../windows.ui.xaml.automation.provider/iwindowprovider_interactionstate.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.windowinteractionstateproperty
     * @type {AutomationProperty} 
     */
    static WindowInteractionStateProperty {
        get => WindowPatternIdentifiers.get_WindowInteractionStateProperty()
    }

    /**
     * Identifies the [VisualState](../windows.ui.xaml.automation.provider/iwindowprovider_visualstate.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowpatternidentifiers.windowvisualstateproperty
     * @type {AutomationProperty} 
     */
    static WindowVisualStateProperty {
        get => WindowPatternIdentifiers.get_WindowVisualStateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanMaximizeProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_CanMaximizeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanMinimizeProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_CanMinimizeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsModalProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_IsModalProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsTopmostProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_IsTopmostProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_WindowInteractionStateProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_WindowInteractionStateProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_WindowVisualStateProperty() {
        if (!WindowPatternIdentifiers.HasProp("__IWindowPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.WindowPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowPatternIdentifiersStatics.IID)
            WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics := IWindowPatternIdentifiersStatics(factoryPtr)
        }

        return WindowPatternIdentifiers.__IWindowPatternIdentifiersStatics.get_WindowVisualStateProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
