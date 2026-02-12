#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISelectionItemPatternIdentifiers.ahk
#Include .\ISelectionItemPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ISelectionItemProvider](../windows.ui.xaml.automation.provider/iselectionitemprovider.md).
 * @remarks
 * Classes such as SelectionItemPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ISelectionItemProvider](../windows.ui.xaml.automation.provider/iselectionitemprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ISelectionItemProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iselectionitemprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionitempatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class SelectionItemPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectionItemPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectionItemPatternIdentifiers.IID

    /**
     * Identifies the [IsSelected](../windows.ui.xaml.automation.provider/iselectionitemprovider_isselected.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionitempatternidentifiers.isselectedproperty
     * @type {AutomationProperty} 
     */
    static IsSelectedProperty {
        get => SelectionItemPatternIdentifiers.get_IsSelectedProperty()
    }

    /**
     * Identifies the [SelectionContainer](../windows.ui.xaml.automation.provider/iselectionitemprovider_selectioncontainer.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.selectionitempatternidentifiers.selectioncontainerproperty
     * @type {AutomationProperty} 
     */
    static SelectionContainerProperty {
        get => SelectionItemPatternIdentifiers.get_SelectionContainerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_IsSelectedProperty() {
        if (!SelectionItemPatternIdentifiers.HasProp("__ISelectionItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SelectionItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionItemPatternIdentifiersStatics.IID)
            SelectionItemPatternIdentifiers.__ISelectionItemPatternIdentifiersStatics := ISelectionItemPatternIdentifiersStatics(factoryPtr)
        }

        return SelectionItemPatternIdentifiers.__ISelectionItemPatternIdentifiersStatics.get_IsSelectedProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_SelectionContainerProperty() {
        if (!SelectionItemPatternIdentifiers.HasProp("__ISelectionItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.SelectionItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionItemPatternIdentifiersStatics.IID)
            SelectionItemPatternIdentifiers.__ISelectionItemPatternIdentifiersStatics := ISelectionItemPatternIdentifiersStatics(factoryPtr)
        }

        return SelectionItemPatternIdentifiers.__ISelectionItemPatternIdentifiersStatics.get_SelectionContainerProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
