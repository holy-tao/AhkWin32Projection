#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRangeValuePatternIdentifiers.ahk
#Include .\IRangeValuePatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IRangeValueProvider](../windows.ui.xaml.automation.provider/irangevalueprovider.md).
 * @remarks
 * Classes such as RangeValuePatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IRangeValueProvider](../windows.ui.xaml.automation.provider/irangevalueprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IRangeValueProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irangevalueprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class RangeValuePatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRangeValuePatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRangeValuePatternIdentifiers.IID

    /**
     * Identifies the [IsReadOnly](../windows.ui.xaml.automation.provider/irangevalueprovider_isreadonly.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.isreadonlyproperty
     * @type {AutomationProperty} 
     */
    static IsReadOnlyProperty {
        get => RangeValuePatternIdentifiers.get_IsReadOnlyProperty()
    }

    /**
     * Identifies the [LargeChange](../windows.ui.xaml.automation.provider/irangevalueprovider_largechange.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.largechangeproperty
     * @type {AutomationProperty} 
     */
    static LargeChangeProperty {
        get => RangeValuePatternIdentifiers.get_LargeChangeProperty()
    }

    /**
     * Identifies the [Maximum](../windows.ui.xaml.automation.provider/irangevalueprovider_maximum.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.maximumproperty
     * @type {AutomationProperty} 
     */
    static MaximumProperty {
        get => RangeValuePatternIdentifiers.get_MaximumProperty()
    }

    /**
     * Identifies the [Minimum](../windows.ui.xaml.automation.provider/irangevalueprovider_minimum.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.minimumproperty
     * @type {AutomationProperty} 
     */
    static MinimumProperty {
        get => RangeValuePatternIdentifiers.get_MinimumProperty()
    }

    /**
     * Identifies the [SmallChange](../windows.ui.xaml.automation.provider/irangevalueprovider_smallchange.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.smallchangeproperty
     * @type {AutomationProperty} 
     */
    static SmallChangeProperty {
        get => RangeValuePatternIdentifiers.get_SmallChangeProperty()
    }

    /**
     * Identifies the [Value](../windows.ui.xaml.automation.provider/irangevalueprovider_value.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.rangevaluepatternidentifiers.valueproperty
     * @type {AutomationProperty} 
     */
    static ValueProperty {
        get => RangeValuePatternIdentifiers.get_ValueProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsReadOnlyProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_IsReadOnlyProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_LargeChangeProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_LargeChangeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_MaximumProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_MaximumProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_MinimumProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_MinimumProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_SmallChangeProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_SmallChangeProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ValueProperty() {
        if (!RangeValuePatternIdentifiers.HasProp("__IRangeValuePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeValuePatternIdentifiersStatics.IID)
            RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics := IRangeValuePatternIdentifiersStatics(factoryPtr)
        }

        return RangeValuePatternIdentifiers.__IRangeValuePatternIdentifiersStatics.get_ValueProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
