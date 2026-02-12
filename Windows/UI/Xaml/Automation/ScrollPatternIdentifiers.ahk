#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScrollPatternIdentifiers.ahk
#Include .\IScrollPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IScrollProvider](../windows.ui.xaml.automation.provider/iscrollprovider.md), and also contains the [NoScroll](scrollpatternidentifiers_noscroll.md) constant.
 * @remarks
 * Classes such as ScrollPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IScrollProvider](../windows.ui.xaml.automation.provider/iscrollprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IScrollProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iscrollprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ScrollPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollPatternIdentifiers.IID

    /**
     * Identifies the [HorizontallyScrollable](../windows.ui.xaml.automation.provider/iscrollprovider_horizontallyscrollable.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.horizontallyscrollableproperty
     * @type {AutomationProperty} 
     */
    static HorizontallyScrollableProperty {
        get => ScrollPatternIdentifiers.get_HorizontallyScrollableProperty()
    }

    /**
     * Identifies the [HorizontalScrollPercent](../windows.ui.xaml.automation.provider/iscrollprovider_horizontalscrollpercent.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.horizontalscrollpercentproperty
     * @type {AutomationProperty} 
     */
    static HorizontalScrollPercentProperty {
        get => ScrollPatternIdentifiers.get_HorizontalScrollPercentProperty()
    }

    /**
     * Identifies the [HorizontalViewSize](../windows.ui.xaml.automation.provider/iscrollprovider_horizontalviewsize.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.horizontalviewsizeproperty
     * @type {AutomationProperty} 
     */
    static HorizontalViewSizeProperty {
        get => ScrollPatternIdentifiers.get_HorizontalViewSizeProperty()
    }

    /**
     * Specifies that scrolling should not be performed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.noscroll
     * @type {Float} 
     */
    static NoScroll {
        get => ScrollPatternIdentifiers.get_NoScroll()
    }

    /**
     * Identifies the [VerticallyScrollable](../windows.ui.xaml.automation.provider/iscrollprovider_verticallyscrollable.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.verticallyscrollableproperty
     * @type {AutomationProperty} 
     */
    static VerticallyScrollableProperty {
        get => ScrollPatternIdentifiers.get_VerticallyScrollableProperty()
    }

    /**
     * Identifies the [VerticalScrollPercent](../windows.ui.xaml.automation.provider/iscrollprovider_verticalscrollpercent.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.verticalscrollpercentproperty
     * @type {AutomationProperty} 
     */
    static VerticalScrollPercentProperty {
        get => ScrollPatternIdentifiers.get_VerticalScrollPercentProperty()
    }

    /**
     * Identifies the [VerticalViewSize](../windows.ui.xaml.automation.provider/iscrollprovider_verticalviewsize.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollpatternidentifiers.verticalviewsizeproperty
     * @type {AutomationProperty} 
     */
    static VerticalViewSizeProperty {
        get => ScrollPatternIdentifiers.get_VerticalViewSizeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HorizontallyScrollableProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_HorizontallyScrollableProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HorizontalScrollPercentProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_HorizontalScrollPercentProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_HorizontalViewSizeProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_HorizontalViewSizeProperty()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_NoScroll() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_NoScroll()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_VerticallyScrollableProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_VerticallyScrollableProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_VerticalScrollPercentProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_VerticalScrollPercentProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_VerticalViewSizeProperty() {
        if (!ScrollPatternIdentifiers.HasProp("__IScrollPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollPatternIdentifiersStatics.IID)
            ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics := IScrollPatternIdentifiersStatics(factoryPtr)
        }

        return ScrollPatternIdentifiers.__IScrollPatternIdentifiersStatics.get_VerticalViewSizeProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
