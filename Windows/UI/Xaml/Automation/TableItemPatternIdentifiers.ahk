#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITableItemPatternIdentifiers.ahk
#Include .\ITableItemPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ITableProvider](../windows.ui.xaml.automation.provider/itableprovider.md).
 * @remarks
 * Classes such as TableItemPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ITableItemProvider](../windows.ui.xaml.automation.provider/itableitemprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ITableItemProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itableitemprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tableitempatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class TableItemPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITableItemPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITableItemPatternIdentifiers.IID

    /**
     * Identifies the automation property that retrieves all the column headers associated with a table item or cell.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tableitempatternidentifiers.columnheaderitemsproperty
     * @type {AutomationProperty} 
     */
    static ColumnHeaderItemsProperty {
        get => TableItemPatternIdentifiers.get_ColumnHeaderItemsProperty()
    }

    /**
     * Identifies the automation property that retrieves all the row headers associated with a table item or cell.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tableitempatternidentifiers.rowheaderitemsproperty
     * @type {AutomationProperty} 
     */
    static RowHeaderItemsProperty {
        get => TableItemPatternIdentifiers.get_RowHeaderItemsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ColumnHeaderItemsProperty() {
        if (!TableItemPatternIdentifiers.HasProp("__ITableItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TableItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITableItemPatternIdentifiersStatics.IID)
            TableItemPatternIdentifiers.__ITableItemPatternIdentifiersStatics := ITableItemPatternIdentifiersStatics(factoryPtr)
        }

        return TableItemPatternIdentifiers.__ITableItemPatternIdentifiersStatics.get_ColumnHeaderItemsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowHeaderItemsProperty() {
        if (!TableItemPatternIdentifiers.HasProp("__ITableItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TableItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITableItemPatternIdentifiersStatics.IID)
            TableItemPatternIdentifiers.__ITableItemPatternIdentifiersStatics := ITableItemPatternIdentifiersStatics(factoryPtr)
        }

        return TableItemPatternIdentifiers.__ITableItemPatternIdentifiersStatics.get_RowHeaderItemsProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
