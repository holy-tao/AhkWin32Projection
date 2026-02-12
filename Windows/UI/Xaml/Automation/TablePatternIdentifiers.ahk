#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITablePatternIdentifiers.ahk
#Include .\ITablePatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [ITableProvider](../windows.ui.xaml.automation.provider/itableprovider.md).
 * @remarks
 * Classes such as TablePatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [ITableProvider](../windows.ui.xaml.automation.provider/itableprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [ITableProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itableprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tablepatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class TablePatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITablePatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITablePatternIdentifiers.IID

    /**
     * Identifies the automation property that is accessed by the [GetColumnHeaders](../windows.ui.xaml.automation.provider/itableprovider_getcolumnheaders_680116478.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tablepatternidentifiers.columnheadersproperty
     * @type {AutomationProperty} 
     */
    static ColumnHeadersProperty {
        get => TablePatternIdentifiers.get_ColumnHeadersProperty()
    }

    /**
     * Identifies the automation property that is accessed by the [GetRowHeaders](../windows.ui.xaml.automation.provider/itableprovider_getrowheaders_1973743761.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tablepatternidentifiers.rowheadersproperty
     * @type {AutomationProperty} 
     */
    static RowHeadersProperty {
        get => TablePatternIdentifiers.get_RowHeadersProperty()
    }

    /**
     * Identifies the [RowOrColumnMajor](../windows.ui.xaml.automation.provider/itableprovider_roworcolumnmajor.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.tablepatternidentifiers.roworcolumnmajorproperty
     * @type {AutomationProperty} 
     */
    static RowOrColumnMajorProperty {
        get => TablePatternIdentifiers.get_RowOrColumnMajorProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ColumnHeadersProperty() {
        if (!TablePatternIdentifiers.HasProp("__ITablePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TablePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITablePatternIdentifiersStatics.IID)
            TablePatternIdentifiers.__ITablePatternIdentifiersStatics := ITablePatternIdentifiersStatics(factoryPtr)
        }

        return TablePatternIdentifiers.__ITablePatternIdentifiersStatics.get_ColumnHeadersProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowHeadersProperty() {
        if (!TablePatternIdentifiers.HasProp("__ITablePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TablePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITablePatternIdentifiersStatics.IID)
            TablePatternIdentifiers.__ITablePatternIdentifiersStatics := ITablePatternIdentifiersStatics(factoryPtr)
        }

        return TablePatternIdentifiers.__ITablePatternIdentifiersStatics.get_RowHeadersProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowOrColumnMajorProperty() {
        if (!TablePatternIdentifiers.HasProp("__ITablePatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.TablePatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITablePatternIdentifiersStatics.IID)
            TablePatternIdentifiers.__ITablePatternIdentifiersStatics := ITablePatternIdentifiersStatics(factoryPtr)
        }

        return TablePatternIdentifiers.__ITablePatternIdentifiersStatics.get_RowOrColumnMajorProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
