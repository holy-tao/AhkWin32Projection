#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMultipleViewPatternIdentifiers.ahk
#Include .\IMultipleViewPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IMultipleViewProvider](../windows.ui.xaml.automation.provider/imultipleviewprovider.md).
 * @remarks
 * Classes such as MultipleViewPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IMultipleViewProvider](../windows.ui.xaml.automation.provider/imultipleviewprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IMultipleViewProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-imultipleviewprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.multipleviewpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class MultipleViewPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMultipleViewPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMultipleViewPatternIdentifiers.IID

    /**
     * Identifies the [CurrentView](../windows.ui.xaml.automation.provider/imultipleviewprovider_currentview.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.multipleviewpatternidentifiers.currentviewproperty
     * @type {AutomationProperty} 
     */
    static CurrentViewProperty {
        get => MultipleViewPatternIdentifiers.get_CurrentViewProperty()
    }

    /**
     * Identifies the automation property that gets the control-specific collection of views.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.multipleviewpatternidentifiers.supportedviewsproperty
     * @type {AutomationProperty} 
     */
    static SupportedViewsProperty {
        get => MultipleViewPatternIdentifiers.get_SupportedViewsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CurrentViewProperty() {
        if (!MultipleViewPatternIdentifiers.HasProp("__IMultipleViewPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.MultipleViewPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMultipleViewPatternIdentifiersStatics.IID)
            MultipleViewPatternIdentifiers.__IMultipleViewPatternIdentifiersStatics := IMultipleViewPatternIdentifiersStatics(factoryPtr)
        }

        return MultipleViewPatternIdentifiers.__IMultipleViewPatternIdentifiersStatics.get_CurrentViewProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_SupportedViewsProperty() {
        if (!MultipleViewPatternIdentifiers.HasProp("__IMultipleViewPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.MultipleViewPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMultipleViewPatternIdentifiersStatics.IID)
            MultipleViewPatternIdentifiers.__IMultipleViewPatternIdentifiersStatics := IMultipleViewPatternIdentifiersStatics(factoryPtr)
        }

        return MultipleViewPatternIdentifiers.__IMultipleViewPatternIdentifiersStatics.get_SupportedViewsProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
