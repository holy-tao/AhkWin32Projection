#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISelectionPatternIdentifiers.ahk
#Include .\ISelectionPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md).
 * @remarks
 * Classes such as SelectionPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ISelectionProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iselectionprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class SelectionPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectionPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectionPatternIdentifiers.IID

    /**
     * Identifies the [CanSelectMultiple](../windows.ui.xaml.automation.provider/iselectionprovider_canselectmultiple.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionpatternidentifiers.canselectmultipleproperty
     * @type {AutomationProperty} 
     */
    static CanSelectMultipleProperty {
        get => SelectionPatternIdentifiers.get_CanSelectMultipleProperty()
    }

    /**
     * Identifies the [IsSelectionRequired](../windows.ui.xaml.automation.provider/iselectionprovider_isselectionrequired.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionpatternidentifiers.isselectionrequiredproperty
     * @type {AutomationProperty} 
     */
    static IsSelectionRequiredProperty {
        get => SelectionPatternIdentifiers.get_IsSelectionRequiredProperty()
    }

    /**
     * Identifies the property that gets the selected items in a container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionpatternidentifiers.selectionproperty
     * @type {AutomationProperty} 
     */
    static SelectionProperty {
        get => SelectionPatternIdentifiers.get_SelectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_CanSelectMultipleProperty() {
        if (!SelectionPatternIdentifiers.HasProp("__ISelectionPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionPatternIdentifiersStatics.IID)
            SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics := ISelectionPatternIdentifiersStatics(factoryPtr)
        }

        return SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics.get_CanSelectMultipleProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsSelectionRequiredProperty() {
        if (!SelectionPatternIdentifiers.HasProp("__ISelectionPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionPatternIdentifiersStatics.IID)
            SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics := ISelectionPatternIdentifiersStatics(factoryPtr)
        }

        return SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics.get_IsSelectionRequiredProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_SelectionProperty() {
        if (!SelectionPatternIdentifiers.HasProp("__ISelectionPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionPatternIdentifiersStatics.IID)
            SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics := ISelectionPatternIdentifiersStatics(factoryPtr)
        }

        return SelectionPatternIdentifiers.__ISelectionPatternIdentifiersStatics.get_SelectionProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
