#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ISelectionChangedEventArgs.ahk
#Include .\ISelectionChangedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) event.
 * @remarks
 * > [!NOTE]
 * > For [ListView](listview.md) and [GridView](gridview.md): If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), and selection is modified using [SelectRange](listviewbase_selectrange_1824826911.md) or [DeselectRange](listviewbase_deselectrange_1629963900.md), the [AddedItems](selectionchangedeventargs_addeditems.md) and [RemovedItems](selectionchangedeventargs_removeditems.md) properties are not set. Setting these properties requires devirtualizing the item object. Use the [SelectedRanges](listviewbase_selectedranges.md) property to get the items instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.selectionchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SelectionChangedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectionChangedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IVector<IInspectable>} removedItems 
     * @param {IVector<IInspectable>} addedItems 
     * @returns {SelectionChangedEventArgs} 
     */
    static CreateInstanceWithRemovedItemsAndAddedItems(removedItems, addedItems) {
        if (!SelectionChangedEventArgs.HasProp("__ISelectionChangedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SelectionChangedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectionChangedEventArgsFactory.IID)
            SelectionChangedEventArgs.__ISelectionChangedEventArgsFactory := ISelectionChangedEventArgsFactory(factoryPtr)
        }

        return SelectionChangedEventArgs.__ISelectionChangedEventArgsFactory.CreateInstanceWithRemovedItemsAndAddedItems(removedItems, addedItems, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list that contains the items that were selected.
     * @remarks
     * > [!NOTE]
     * > For [ListView](listview.md) and [GridView](gridview.md): If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), and selection is modified using [SelectRange](listviewbase_selectrange_1824826911.md) or [DeselectRange](listviewbase_deselectrange_1629963900.md), the AddedItems and [RemovedItems](selectionchangedeventargs_removeditems.md) properties are not set. Setting these properties requires devirtualizing the item object. Use the [SelectedRanges](listviewbase_selectedranges.md) property to get the items instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.selectionchangedeventargs.addeditems
     * @type {IVector<IInspectable>} 
     */
    AddedItems {
        get => this.get_AddedItems()
    }

    /**
     * Gets a list that contains the items that were unselected.
     * @remarks
     * > [!NOTE]
     * > For [ListView](listview.md) and [GridView](gridview.md): If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), and selection is modified using [SelectRange](listviewbase_selectrange_1824826911.md) or [DeselectRange](listviewbase_deselectrange_1629963900.md), the [AddedItems](selectionchangedeventargs_addeditems.md) and RemovedItems properties are not set. Setting these properties requires devirtualizing the item object. Use the [SelectedRanges](listviewbase_selectedranges.md) property to get the items instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.selectionchangedeventargs.removeditems
     * @type {IVector<IInspectable>} 
     */
    RemovedItems {
        get => this.get_RemovedItems()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_AddedItems() {
        if (!this.HasProp("__ISelectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISelectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionChangedEventArgs := ISelectionChangedEventArgs(outPtr)
        }

        return this.__ISelectionChangedEventArgs.get_AddedItems()
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_RemovedItems() {
        if (!this.HasProp("__ISelectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISelectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectionChangedEventArgs := ISelectionChangedEventArgs(outPtr)
        }

        return this.__ISelectionChangedEventArgs.get_RemovedItems()
    }

;@endregion Instance Methods
}
