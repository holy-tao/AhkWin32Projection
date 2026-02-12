#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IValuePatternIdentifiers.ahk
#Include .\IValuePatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md).
 * @remarks
 * Classes such as ValuePatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IValueProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.valuepatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ValuePatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IValuePatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IValuePatternIdentifiers.IID

    /**
     * Identifies the [IsReadOnly](../windows.ui.xaml.automation.provider/ivalueprovider_isreadonly.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.valuepatternidentifiers.isreadonlyproperty
     * @type {AutomationProperty} 
     */
    static IsReadOnlyProperty {
        get => ValuePatternIdentifiers.get_IsReadOnlyProperty()
    }

    /**
     * Identifies the [Value](../windows.ui.xaml.automation.provider/ivalueprovider_value.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.valuepatternidentifiers.valueproperty
     * @type {AutomationProperty} 
     */
    static ValueProperty {
        get => ValuePatternIdentifiers.get_ValueProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsReadOnlyProperty() {
        if (!ValuePatternIdentifiers.HasProp("__IValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IValuePatternIdentifiersStatics.IID)
            ValuePatternIdentifiers.__IValuePatternIdentifiersStatics := IValuePatternIdentifiersStatics(factoryPtr)
        }

        return ValuePatternIdentifiers.__IValuePatternIdentifiersStatics.get_IsReadOnlyProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ValueProperty() {
        if (!ValuePatternIdentifiers.HasProp("__IValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.ValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IValuePatternIdentifiersStatics.IID)
            ValuePatternIdentifiers.__IValuePatternIdentifiersStatics := IValuePatternIdentifiersStatics(factoryPtr)
        }

        return ValuePatternIdentifiers.__IValuePatternIdentifiersStatics.get_ValueProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
