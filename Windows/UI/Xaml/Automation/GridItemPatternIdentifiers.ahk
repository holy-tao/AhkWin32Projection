#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGridItemPatternIdentifiers.ahk
#Include .\IGridItemPatternIdentifiersStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains values used as identifiers by [IGridItemProvider](../windows.ui.xaml.automation.provider/igriditemprovider.md).
 * @remarks
 * Classes such as GridItemPatternIdentifiers are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation. You might use these identifiers if you are implementing a Windows Runtime custom automation peer that reports support for [IGridItemProvider](../windows.ui.xaml.automation.provider/igriditemprovider.md) in its [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) implementation. These identifiers are needed for the [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md) calls that you make from control code that references your own peer, or for [FindItemByProperty](../windows.ui.xaml.automation.provider/iitemcontainerprovider_finditembyproperty_1997743353.md) in an items container peer.
 * 
 * This same pattern is usually exposed to clients in a different way, depending on which technology they use to implement the client and examine the Microsoft UI Automation tree. [IGridItemProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider) is also presented as a Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class GridItemPatternIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridItemPatternIdentifiers

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridItemPatternIdentifiers.IID

    /**
     * Identifies the [Column](../windows.ui.xaml.automation.provider/igriditemprovider_column.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers.columnproperty
     * @type {AutomationProperty} 
     */
    static ColumnProperty {
        get => GridItemPatternIdentifiers.get_ColumnProperty()
    }

    /**
     * Identifies the [ColumnSpan](../windows.ui.xaml.automation.provider/igriditemprovider_columnspan.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers.columnspanproperty
     * @type {AutomationProperty} 
     */
    static ColumnSpanProperty {
        get => GridItemPatternIdentifiers.get_ColumnSpanProperty()
    }

    /**
     * Identifies the [ContainingGrid](../windows.ui.xaml.automation.provider/igriditemprovider_containinggrid.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers.containinggridproperty
     * @type {AutomationProperty} 
     */
    static ContainingGridProperty {
        get => GridItemPatternIdentifiers.get_ContainingGridProperty()
    }

    /**
     * Identifies the [Row](../windows.ui.xaml.automation.provider/igriditemprovider_row.md) automation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers.rowproperty
     * @type {AutomationProperty} 
     */
    static RowProperty {
        get => GridItemPatternIdentifiers.get_RowProperty()
    }

    /**
     * Identifies the [RowSpan](../windows.ui.xaml.automation.provider/igriditemprovider_rowspan.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.griditempatternidentifiers.rowspanproperty
     * @type {AutomationProperty} 
     */
    static RowSpanProperty {
        get => GridItemPatternIdentifiers.get_RowSpanProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ColumnProperty() {
        if (!GridItemPatternIdentifiers.HasProp("__IGridItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridItemPatternIdentifiersStatics.IID)
            GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics := IGridItemPatternIdentifiersStatics(factoryPtr)
        }

        return GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics.get_ColumnProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ColumnSpanProperty() {
        if (!GridItemPatternIdentifiers.HasProp("__IGridItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridItemPatternIdentifiersStatics.IID)
            GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics := IGridItemPatternIdentifiersStatics(factoryPtr)
        }

        return GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics.get_ColumnSpanProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_ContainingGridProperty() {
        if (!GridItemPatternIdentifiers.HasProp("__IGridItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridItemPatternIdentifiersStatics.IID)
            GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics := IGridItemPatternIdentifiersStatics(factoryPtr)
        }

        return GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics.get_ContainingGridProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowProperty() {
        if (!GridItemPatternIdentifiers.HasProp("__IGridItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridItemPatternIdentifiersStatics.IID)
            GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics := IGridItemPatternIdentifiersStatics(factoryPtr)
        }

        return GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics.get_RowProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    static get_RowSpanProperty() {
        if (!GridItemPatternIdentifiers.HasProp("__IGridItemPatternIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridItemPatternIdentifiersStatics.IID)
            GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics := IGridItemPatternIdentifiersStatics(factoryPtr)
        }

        return GridItemPatternIdentifiers.__IGridItemPatternIdentifiersStatics.get_RowSpanProperty()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
