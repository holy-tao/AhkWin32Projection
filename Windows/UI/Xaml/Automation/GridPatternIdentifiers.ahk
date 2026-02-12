#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGridPatternIdentifiers.ahk
#Include .\IGridPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IGridProvider](../windows.ui.xaml.automation.provider/igridprovider.md).
 * @remarks
 * Classes such as GridPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IGridProvider](../windows.ui.xaml.automation.provider/igridprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IGridProvider](../windows.ui.xaml.automation.provider/igridprovider.md) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.gridpatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class GridPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridPatternIdentifiers.IID

    /**
     * Identifies the [ColumnCount](../windows.ui.xaml.automation.provider/igridprovider_columncount.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.gridpatternidentifiers.columncountproperty
     * @type {AutomationProperty} 
     */
    static ColumnCountProperty {
        get => GridPatternIdentifiers.get_ColumnCountProperty()
    }

    /**
     * Identifies the [RowCount](../windows.ui.xaml.automation.provider/igridprovider_rowcount.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.gridpatternidentifiers.rowcountproperty
     * @type {AutomationProperty} 
     */
    static RowCountProperty {
        get => GridPatternIdentifiers.get_RowCountProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ColumnCountProperty() {
        if (!GridPatternIdentifiers.HasProp("__IGridPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridPatternIdentifiersStatics.IID)
            GridPatternIdentifiers.__IGridPatternIdentifiersStatics := IGridPatternIdentifiersStatics(factoryPtr)
        }

        return GridPatternIdentifiers.__IGridPatternIdentifiersStatics.get_ColumnCountProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowCountProperty() {
        if (!GridPatternIdentifiers.HasProp("__IGridPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridPatternIdentifiersStatics.IID)
            GridPatternIdentifiers.__IGridPatternIdentifiersStatics := IGridPatternIdentifiersStatics(factoryPtr)
        }

        return GridPatternIdentifiers.__IGridPatternIdentifiersStatics.get_RowCountProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
