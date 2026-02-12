#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\Selector.ahk
#Include .\IListViewBase.ahk
#Include .\IListViewBase2.ahk
#Include .\IListViewBase3.ahk
#Include .\IListViewBase4.ahk
#Include .\IListViewBase5.ahk
#Include .\IListViewBase6.ahk
#Include .\ISemanticZoomInformation.ahk
#Include .\IListViewBaseStatics.ahk
#Include .\IListViewBaseStatics2.ahk
#Include .\IListViewBaseStatics3.ahk
#Include .\IListViewBaseStatics5.ahk
#Include .\IListViewBaseStatics4.ahk
#Include .\ItemClickEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ItemClickEventArgs.ahk
#Include .\DragItemsStartingEventHandler.ahk
#Include .\DragItemsStartingEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ListViewBase.ahk
#Include .\ContainerContentChangingEventArgs.ahk
#Include .\DragItemsCompletedEventArgs.ahk
#Include .\ChoosingItemContainerEventArgs.ahk
#Include .\ChoosingGroupHeaderContainerEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides the infrastructure for the [ListView](listview.md) and [GridView](gridview.md) classes.
 * @remarks
 * For user interface purposes, ListViewBase should be thought of as an abstract base class. Use [ListView](listview.md) or [GridView](gridview.md) instead. The main difference between [ListView](listview.md) and [GridView](gridview.md) is that [ListView](listview.md) has a vertical/portrait orientation and [GridView](gridview.md) has a horizontal/landscape orientation. For more info, see [ListView and GridView controls](/windows/uwp/controls-and-patterns/listview-and-gridview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewBase extends Selector {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewBase.IID

    /**
     * Identifies the [SelectionMode](listviewbase_selectionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selectionmodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionModeProperty {
        get => ListViewBase.get_SelectionModeProperty()
    }

    /**
     * Identifies the [IsSwipeEnabled](listviewbase_isswipeenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isswipeenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSwipeEnabledProperty {
        get => ListViewBase.get_IsSwipeEnabledProperty()
    }

    /**
     * Identifies the [CanDragItems](listviewbase_candragitems.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.candragitemsproperty
     * @type {DependencyProperty} 
     */
    static CanDragItemsProperty {
        get => ListViewBase.get_CanDragItemsProperty()
    }

    /**
     * Identifies the [CanReorderItems](listviewbase_canreorderitems.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.canreorderitemsproperty
     * @type {DependencyProperty} 
     */
    static CanReorderItemsProperty {
        get => ListViewBase.get_CanReorderItemsProperty()
    }

    /**
     * Identifies the [IsItemClickEnabled](listviewbase_isitemclickenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isitemclickenabledproperty
     * @type {DependencyProperty} 
     */
    static IsItemClickEnabledProperty {
        get => ListViewBase.get_IsItemClickEnabledProperty()
    }

    /**
     * Identifies the [DataFetchSize](listviewbase_datafetchsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.datafetchsizeproperty
     * @type {DependencyProperty} 
     */
    static DataFetchSizeProperty {
        get => ListViewBase.get_DataFetchSizeProperty()
    }

    /**
     * Identifies the [IncrementalLoadingThreshold](listviewbase_incrementalloadingthreshold.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.incrementalloadingthresholdproperty
     * @type {DependencyProperty} 
     */
    static IncrementalLoadingThresholdProperty {
        get => ListViewBase.get_IncrementalLoadingThresholdProperty()
    }

    /**
     * Identifies the [IncrementalLoadingTrigger](listviewbase_incrementalloadingtrigger.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.incrementalloadingtriggerproperty
     * @type {DependencyProperty} 
     */
    static IncrementalLoadingTriggerProperty {
        get => ListViewBase.get_IncrementalLoadingTriggerProperty()
    }

    /**
     * Identifies the [SemanticZoomOwner](listviewbase_semanticzoomowner.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.semanticzoomownerproperty
     * @type {DependencyProperty} 
     */
    static SemanticZoomOwnerProperty {
        get => ListViewBase.get_SemanticZoomOwnerProperty()
    }

    /**
     * Identifies the [IsActiveView](listviewbase_isactiveview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isactiveviewproperty
     * @type {DependencyProperty} 
     */
    static IsActiveViewProperty {
        get => ListViewBase.get_IsActiveViewProperty()
    }

    /**
     * Identifies the [IsZoomedInView](listviewbase_iszoomedinview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.iszoomedinviewproperty
     * @type {DependencyProperty} 
     */
    static IsZoomedInViewProperty {
        get => ListViewBase.get_IsZoomedInViewProperty()
    }

    /**
     * Identifies the [Header](listviewbase_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => ListViewBase.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](listviewbase_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => ListViewBase.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [HeaderTransitions](listviewbase_headertransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.headertransitionsproperty
     * @type {DependencyProperty} 
     */
    static HeaderTransitionsProperty {
        get => ListViewBase.get_HeaderTransitionsProperty()
    }

    /**
     * Identifies the [ShowsScrollingPlaceholders](listviewbase_showsscrollingplaceholders.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.showsscrollingplaceholdersproperty
     * @type {DependencyProperty} 
     */
    static ShowsScrollingPlaceholdersProperty {
        get => ListViewBase.get_ShowsScrollingPlaceholdersProperty()
    }

    /**
     * Identifies the [Footer](listviewbase_footer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footerproperty
     * @type {DependencyProperty} 
     */
    static FooterProperty {
        get => ListViewBase.get_FooterProperty()
    }

    /**
     * Identifies the [FooterTemplate](listviewbase_footertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footertemplateproperty
     * @type {DependencyProperty} 
     */
    static FooterTemplateProperty {
        get => ListViewBase.get_FooterTemplateProperty()
    }

    /**
     * Identifies the [FooterTransitions](listviewbase_footertransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footertransitionsproperty
     * @type {DependencyProperty} 
     */
    static FooterTransitionsProperty {
        get => ListViewBase.get_FooterTransitionsProperty()
    }

    /**
     * Identifies the [ReorderMode](listviewbase_reordermode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.reordermodeproperty
     * @type {DependencyProperty} 
     */
    static ReorderModeProperty {
        get => ListViewBase.get_ReorderModeProperty()
    }

    /**
     * Identifies the [SingleSelectionFollowsFocus](listviewbase_singleselectionfollowsfocus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.singleselectionfollowsfocusproperty
     * @type {DependencyProperty} 
     */
    static SingleSelectionFollowsFocusProperty {
        get => ListViewBase.get_SingleSelectionFollowsFocusProperty()
    }

    /**
     * Get the identifier for the [IsMultiSelectCheckBoxEnabled](listviewbase_ismultiselectcheckboxenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.ismultiselectcheckboxenabledproperty
     * @type {DependencyProperty} 
     */
    static IsMultiSelectCheckBoxEnabledProperty {
        get => ListViewBase.get_IsMultiSelectCheckBoxEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionModeProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_SelectionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSwipeEnabledProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IsSwipeEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanDragItemsProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_CanDragItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanReorderItemsProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_CanReorderItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsItemClickEnabledProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IsItemClickEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataFetchSizeProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_DataFetchSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IncrementalLoadingThresholdProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IncrementalLoadingThresholdProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IncrementalLoadingTriggerProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IncrementalLoadingTriggerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SemanticZoomOwnerProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_SemanticZoomOwnerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsActiveViewProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IsActiveViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomedInViewProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_IsZoomedInViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTransitionsProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics.IID)
            ListViewBase.__IListViewBaseStatics := IListViewBaseStatics(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics.get_HeaderTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowsScrollingPlaceholdersProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics2.IID)
            ListViewBase.__IListViewBaseStatics2 := IListViewBaseStatics2(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics2.get_ShowsScrollingPlaceholdersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics2.IID)
            ListViewBase.__IListViewBaseStatics2 := IListViewBaseStatics2(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics2.get_FooterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterTemplateProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics2.IID)
            ListViewBase.__IListViewBaseStatics2 := IListViewBaseStatics2(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics2.get_FooterTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterTransitionsProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics2.IID)
            ListViewBase.__IListViewBaseStatics2 := IListViewBaseStatics2(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics2.get_FooterTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ReorderModeProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics3.IID)
            ListViewBase.__IListViewBaseStatics3 := IListViewBaseStatics3(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics3.get_ReorderModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SingleSelectionFollowsFocusProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics5.IID)
            ListViewBase.__IListViewBaseStatics5 := IListViewBaseStatics5(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics5.get_SingleSelectionFollowsFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsMultiSelectCheckBoxEnabledProperty() {
        if (!ListViewBase.HasProp("__IListViewBaseStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseStatics4.IID)
            ListViewBase.__IListViewBaseStatics4 := IListViewBaseStatics4(factoryPtr)
        }

        return ListViewBase.__IListViewBaseStatics4.get_IsMultiSelectCheckBoxEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the currently selected items.
     * @remarks
     * When [SelectionMode](listviewbase_selectionmode.md) is **Multiple** or **Extended**, use the SelectedItems property to get the items that are selected. When [SelectionMode](listviewbase_selectionmode.md) is **Single**, use the [Selector.SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) property to get the item that's selected.
     * 
     * Starting in Windows 10, you can use the [SelectRange](listviewbase_selectrange_1824826911.md) and [DeselectRange](listviewbase_deselectrange_1629963900.md) methods with the [SelectedRanges](listviewbase_selectedranges.md) property to make selections using ranges of indexes. This is a more efficient way to describe item selection than using SelectedItems, which requires the actual item object to be created for each selected item.
     * 
     * > [!NOTE]
     * > If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), the SelectedItems collection is not updated based on selection in the list. Use the [SelectedRanges](listviewbase_selectedranges.md) property instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selecteditems
     * @type {IVector<IInspectable>} 
     */
    SelectedItems {
        get => this.get_SelectedItems()
    }

    /**
     * Gets or sets the selection behavior for a [ListViewBase](listviewbase.md) instance.
     * @remarks
     * By default, a user can select a single item in a view. You can set the SelectionMode property to a [ListViewSelectionMode](listviewselectionmode.md) enumeration value to enable multi-selection or to disable selection. Here are the selection mode values.<table>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode">None</a></td><td>Item selection is disabled.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode">Single</a></td><td>With no modifier keys:
     * 
     * <ul><li>A user can select a single item using the space bar, mouse click, or touch tap.</li><li>A user can deselect an item using a downward swipe gesture.</li></ul>While pressing Ctrl:
     * 
     * <ul><li>A user can deselect the item by using the space bar, mouse click, or touch tap.</li><li>Using the arrow keys, a user can move focus independently of selection.</li></ul></td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode">Multiple</a></td><td>With no modifier keys:
     * 
     * <ul><li>A user can select multiple items using the space bar, mouse click, or touch tap to toggle selection on the focused item.</li><li>Using the arrow keys, a user can move focus independently of selection.</li></ul></td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode">Extended</a></td><td>With no modifier keys:
     * 
     * <ul><li>The behavior is the same as <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode">Single</a> selection.</li></ul>While pressing Ctrl:
     * 
     * <ul><li>A user can select multiple items using the space bar, mouse click, or touch tap to toggle selection on the focused item.</li><li>Using the arrow keys, a user can move focus independently of selection.</li></ul>While pressing Shift:
     * 
     * <ul><li>A user can select multiple contiguous items by clicking or tapping the first item in the selection and then the last item in the selection.</li><li>Using the arrow keys, a user can create a contiguous selection starting with the item selected when Shift is pressed.</li></ul></td></tr>
     * </table>
     * 
     * > [!NOTE]
     * > Touch interactions are enabled only when [IsSwipeEnabled](listviewbase_isswipeenabled.md) is **true**.
     * 
     * If SelectionMode is [None](listviewselectionmode.md), and [CanDragItems](listviewbase_candragitems.md) and [CanReorderItems](listviewbase_canreorderitems.md) are **false**, you should set [IsSwipeEnabled](listviewbase_isswipeenabled.md) to **false** to improve app performance. See the [IsSwipeEnabled](listviewbase_isswipeenabled.md) property for more info.
     * 
     * When SelectionMode is **Single**, use the [Selector.SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) property to get the item that's selected. When SelectionMode is **Multiple** or **Extended**, use the [SelectedItems](listviewbase_selecteditems.md) property to get the items that are selected.
     * 
     * When item selection is disabled, you can make items respond to a user click like a button instead of being selected. To do this, set SelectionMode to [None](listviewselectionmode.md), the [IsItemClickEnabled](listviewbase_isitemclickenabled.md) property to **true**, and handle the [ItemClick](listviewbase_itemclick.md) event.
     * 
     * For more info and examples, see [How to change the interaction mode](/previous-versions/windows/apps/hh780625(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the view supports discrete input processing for a *swipe* interaction.
     * @remarks
     * Setting IsSwipeEnabled to **false** disables some default touch interactions, so it should be set to **true** when these interactions are needed. For example:
     * + If item selection is enabled and you set IsSwipeEnabled to **false**, a user can deselect items by right-clicking with the mouse, but can't deselect an item with touch by using a *swipe* gesture.
     * + If you set [CanDragItems](listviewbase_candragitems.md) to **true** and IsSwipeEnabled to **false**, a user can drag items with the mouse, but not with touch.
     * + If you set [CanReorderItems](listviewbase_canreorderitems.md) to **true** and IsSwipeEnabled to **false**, a user can reorder items with the mouse, but not with touch.
     * 
     * 
     * You typically set IsSwipeEnabled to **false** to disable *swipe* animations when items in the view don't support interactions that use the *swipe* gesture, like deselecting, dragging, and reordering. Disabling the animation when it's not needed can improve the performance of your app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isswipeenabled
     * @type {Boolean} 
     */
    IsSwipeEnabled {
        get => this.get_IsSwipeEnabled()
        set => this.put_IsSwipeEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether items in the view can be dragged as data payload.
     * @remarks
     * Setting [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false` disables some default touch interactions, so it should be set to `true` when these interactions are needed. For example:
     * + If item selection is enabled and you set [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can deselect items by right-clicking with the mouse, but can't deselect an item with touch by using a *swipe* gesture.
     * + If you set CanDragItems to `true` and [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can drag items with the mouse, but not with touch.
     * + If you set [CanReorderItems](listviewbase_canreorderitems.md) to `true` and [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can reorder items with the mouse, but not with touch.
     * 
     * `CanDragItems` can be set to false as part of visual states that are intended to prevent users from dragging items in views such as a [GridView](gridview.md).
     * 
     * `CanDragItems` does not reflect transient states that might influence the ability to drag items, such as item population lag. The primary scenario where you might get the value of `CanDragItems` in code is to verify that dynamic templates or user-selectable options in your app UI have not changed the value since you last set it.
     * 
     * > [!IMPORTANT]
     * > In order to receive the [DragItemsStarting](listviewbase_dragitemsstarting.md) and [DragItemsCompleted](listviewbase_dragitemscompleted.md) events, the [CanDragItems](listviewbase_candragitems.md) property must be set to `true`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.candragitems
     * @type {Boolean} 
     */
    CanDragItems {
        get => this.get_CanDragItems()
        set => this.put_CanDragItems(value)
    }

    /**
     * Gets or sets a value that indicates whether items in the view can be reordered through user interaction.
     * @remarks
     * To enable users to reorder items using drag-and-drop interaction, you must set both the `CanReorderItems` and [AllowDrop](../windows.ui.xaml/uielement_allowdrop.md) properties to `true`.
     * 
     * Built in reordering is not supported when items are grouped, or when a [VariableSizedWrapGrid](variablesizedwrapgrid.md) is used as the [ItemsPanel](itemscontrol_itemspanel.md).
     * 
     * Setting [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false` disables some default touch interactions, so it should be set to `true` when these interactions are needed. For example:
     * + If item selection is enabled and you set [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can deselect items by right-clicking with the mouse, but can't deselect an item with touch by using a *swipe* gesture.
     * + If you set [CanDragItems](listviewbase_candragitems.md) to `true` and [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can drag items with the mouse, but not with touch.
     * + If you set CanReorderItems to `true` and [IsSwipeEnabled](listviewbase_isswipeenabled.md) to `false`, a user can reorder items with the mouse, but not with touch.
     * 
     * > [!IMPORTANT]
     * > In order to receive the [DragItemsStarting](listviewbase_dragitemsstarting.md) and [DragItemsCompleted](listviewbase_dragitemscompleted.md) events while reordering items, the [CanDragItems](listviewbase_candragitems.md) property must be set to `true`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.canreorderitems
     * @type {Boolean} 
     */
    CanReorderItems {
        get => this.get_CanReorderItems()
        set => this.put_CanReorderItems(value)
    }

    /**
     * Gets or sets a value that indicates whether items in the view fire an [ItemClick](listviewbase_itemclick.md) event in response to interaction.
     * @remarks
     * By default, a user can select items in the view by tapping or clicking on them. You can change this behavior to make the user interaction fire a click event instead of triggering item selection.
     * 
     * If you set the IsItemClickEnabled property to **true**, you must set the [SelectionMode](listviewbase_selectionmode.md) property to [ListViewSelectionMode.None](listviewselectionmode.md). Handle the [ItemClick](listviewbase_itemclick.md) event to respond to the user interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isitemclickenabled
     * @type {Boolean} 
     */
    IsItemClickEnabled {
        get => this.get_IsItemClickEnabled()
        set => this.put_IsItemClickEnabled(value)
    }

    /**
     * Gets or sets the amount of data to fetch for virtualizing/prefetch operations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.datafetchsize
     * @type {Float} 
     */
    DataFetchSize {
        get => this.get_DataFetchSize()
        set => this.put_DataFetchSize(value)
    }

    /**
     * Gets or sets the threshold range that governs when the [ListViewBase](listviewbase.md) class will begin to prefetch more items.
     * @remarks
     * The meaning of the page count given for IncrementalLoadingThreshold is that the [ListViewBase](listviewbase.md) does not need to request more items via [LoadMoreItemsAsync](listviewbase_loadmoreitemsasync_1264491126.md) until the trigger condition (see [IncrementalLoadingTrigger](listviewbase_incrementalloadingtrigger.md)) gets within the IncrementalLoadingThreshold page range. Setting a larger number (for instance 10 or more) represents a belief that the user might attempt to scroll through the list very quickly, and it is worthwhile devoting resources to loading more items as quickly as possible. Setting a smaller number (for instance 5 or less) represents a belief that the user will scroll through the list less quickly, and that the user's scroll rate will permit the items collection to catch up without being as resource intensive.
     * 
     * IncrementalLoadingThreshold and [DataFetchSize](listviewbase_datafetchsize.md) both contribute to the possible resource load that is the result of prefetch operations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.incrementalloadingthreshold
     * @type {Float} 
     */
    IncrementalLoadingThreshold {
        get => this.get_IncrementalLoadingThreshold()
        set => this.put_IncrementalLoadingThreshold(value)
    }

    /**
     * Gets or sets a value that indicates the conditions for prefetch operations by the [ListViewBase](listviewbase.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.incrementalloadingtrigger
     * @type {Integer} 
     */
    IncrementalLoadingTrigger {
        get => this.get_IncrementalLoadingTrigger()
        set => this.put_IncrementalLoadingTrigger(value)
    }

    /**
     * Gets or sets the content for the list header.
     * @remarks
     * By default, the header is shown at the top for a [ListView](listview.md), and on the left for a [GridView](gridview.md). If the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) property is set to [RightToLeft](../windows.ui.xaml/flowdirection.md), the header is shown on the right for a [GridView](gridview.md).
     * 
     * You can use a data template for the Header by setting the [HeaderTemplate](listviewbase_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the view header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the view header.
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.headertransitions
     * @type {TransitionCollection} 
     */
    HeaderTransitions {
        get => this.get_HeaderTransitions()
        set => this.put_HeaderTransitions(value)
    }

    /**
     * Gets or sets a value that indicates whether the view shows placeholder UI for items during scrolling.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.showsscrollingplaceholders
     * @type {Boolean} 
     */
    ShowsScrollingPlaceholders {
        get => this.get_ShowsScrollingPlaceholders()
        set => this.put_ShowsScrollingPlaceholders(value)
    }

    /**
     * Gets or sets the content for the list footer.
     * @remarks
     * By default, the footer is shown at the bottom for a [ListView](listview.md), and on the right for a [GridView](gridview.md). If the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) property is set to [RightToLeft](../windows.ui.xaml/flowdirection.md), the footer is shown on the left for a [GridView](gridview.md).
     * 
     * You can use a data template for the footer by setting the [FooterTemplate](itemspresenter_footertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footer
     * @type {IInspectable} 
     */
    Footer {
        get => this.get_Footer()
        set => this.put_Footer(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the view footer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footertemplate
     * @type {DataTemplate} 
     */
    FooterTemplate {
        get => this.get_FooterTemplate()
        set => this.put_FooterTemplate(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the view footer.
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.footertransitions
     * @type {TransitionCollection} 
     */
    FooterTransitions {
        get => this.get_FooterTransitions()
        set => this.put_FooterTransitions(value)
    }

    /**
     * Gets or sets the reorder behavior for a [ListViewBase](listviewbase.md) instance. When **Enabled**, unsorted and ungrouped lists can be reordered by user manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.reordermode
     * @type {Integer} 
     */
    ReorderMode {
        get => this.get_ReorderMode()
        set => this.put_ReorderMode(value)
    }

    /**
     * Gets a collection of [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md) objects that describe the currently selected items in the list.
     * @remarks
     * Each [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md) in the SelectedRanges collection describes a contiguous block of selected items. [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md) describes the selection by index, so item objects don't need to be created. This is a more efficient way to describe item selection than using [SelectedItems](listviewbase_selecteditems.md), which requires the actual item object to be created for each selected item.
     * 
     * If your datasource performs data virtualization, you can use the SelectedRanges property with the [SelectRange](listviewbase_selectrange_1824826911.md) and [DeselectRange](listviewbase_deselectrange_1629963900.md) methods to modify selection of items that have not been created yet.
     * 
     * > [!NOTE]
     * > If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), the [SelectedItems](listviewbase_selecteditems.md) collection is not updated based on selection in the list. Use the SelectedRanges property instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selectedranges
     * @type {IVectorView<ItemIndexRange>} 
     */
    SelectedRanges {
        get => this.get_SelectedRanges()
    }

    /**
     * Gets or sets a value that indicates whether a check box is shown to enable multi-selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.ismultiselectcheckboxenabled
     * @type {Boolean} 
     */
    IsMultiSelectCheckBoxEnabled {
        get => this.get_IsMultiSelectCheckBoxEnabled()
        set => this.put_IsMultiSelectCheckBoxEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether item selection changes when keyboard focus changes.
     * @remarks
     * This property is ignored if the list view's [SelectionMode](listviewbase_selectionmode.md) property is not set to **Single**.
     * 
     * By default, when a list view is configured for single selection, when the user moves keyboard focus to an item, the focused item is also selected. For example, if keyboard focus is moved from the first item to the second item, the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) property is updated from 0 to 1.
     * 
     * Set this property to **false** to let a user move focus without the item selection following. For example, if each selection change causes significant UI updates, you might prefer to let the user move focus to a non-adjacent item and then press enter to update selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.singleselectionfollowsfocus
     * @type {Boolean} 
     */
    SingleSelectionFollowsFocus {
        get => this.get_SingleSelectionFollowsFocus()
        set => this.put_SingleSelectionFollowsFocus(value)
    }

    /**
     * Gets or sets the [SemanticZoom](semanticzoom.md) instance that hosts the [ListViewBase](listviewbase.md).
     * @remarks
     * You don't set this property in Extensible Application Markup Language (XAML) or in your app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.semanticzoomowner
     * @type {SemanticZoom} 
     */
    SemanticZoomOwner {
        get => this.get_SemanticZoomOwner()
        set => this.put_SemanticZoomOwner(value)
    }

    /**
     * Gets or sets a value that indicates whether the [ListViewBase](listviewbase.md) instance is the active view in its owning [SemanticZoom](semanticzoom.md).
     * @remarks
     * You typically don't set this property in XAML or in app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isactiveview
     * @type {Boolean} 
     */
    IsActiveView {
        get => this.get_IsActiveView()
        set => this.put_IsActiveView(value)
    }

    /**
     * Gets or sets a value that indicates whether the [ListViewBase](listviewbase.md) instance is the zoomed-in view in its owning [SemanticZoom](semanticzoom.md).
     * @remarks
     * You typically don't set this property in XAML or in app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.iszoomedinview
     * @type {Boolean} 
     */
    IsZoomedInView {
        get => this.get_IsZoomedInView()
        set => this.put_IsZoomedInView(value)
    }

    /**
     * Occurs when an item in the list view receives an interaction, and the [IsItemClickEnabled](listviewbase_isitemclickenabled.md) property is **true**.
     * @remarks
     * If the list view is one of the views in a [SemanticZoom](semanticzoom.md), selection entails additional behavior that might change between the views. This behavior is built in to the [ListViewBase](listviewbase.md) class, not the [SemanticZoom](semanticzoom.md) class.
     * @type {ItemClickEventHandler}
    */
    OnItemClick {
        get {
            if(!this.HasProp("__OnItemClick")){
                this.__OnItemClick := WinRTEventHandler(
                    ItemClickEventHandler,
                    ItemClickEventHandler.IID,
                    IInspectable,
                    ItemClickEventArgs
                )
                this.__OnItemClickToken := this.add_ItemClick(this.__OnItemClick.iface)
            }
            return this.__OnItemClick
        }
    }

    /**
     * Occurs when a drag operation that involves one of the items in the view is initiated.
     * @remarks
     * > [!IMPORTANT]
     * > In order to receive this event, the [CanDragItems](listviewbase_candragitems.md) property must be set to `true`.
     * 
     * This event occurs when you start a drag-and-drop operation, including when you perform a reorder operation by drag-and-drop. When you perform custom actions as a result of a drag-and-drop operation, you typically listen to this event and provide more data using the [DragItemsStartingEventArgs.Data](dragitemsstartingeventargs_data.md) property.
     * 
     * You can inspect the items being dragged by checking the [DragItemsStartingEventArgs.Items](dragitemsstartingeventargs_items.md) property.
     * 
     * You can cancel the drag operation by setting the [DragItemsStartingEventArgs.Cancel](dragitemsstartingeventargs_cancel.md) property to `true`.
     * @type {DragItemsStartingEventHandler}
    */
    OnDragItemsStarting {
        get {
            if(!this.HasProp("__OnDragItemsStarting")){
                this.__OnDragItemsStarting := WinRTEventHandler(
                    DragItemsStartingEventHandler,
                    DragItemsStartingEventHandler.IID,
                    IInspectable,
                    DragItemsStartingEventArgs
                )
                this.__OnDragItemsStartingToken := this.add_DragItemsStarting(this.__OnDragItemsStarting.iface)
            }
            return this.__OnDragItemsStarting
        }
    }

    /**
     * Occurs when the data item associated with a UI container changes.
     * @remarks
     * This event is raised only if the list or grid's [ItemsPanel](itemscontrol_itemspanel.md) is an [ItemsStackPanel](itemsstackpanel.md) or [ItemsWrapGrid](itemswrapgrid.md). If you replace the [ItemsPanel](itemscontrol_itemspanel.md) with another panel, the event is not raised.
     * 
     * For info and examples, see the [Update ListView and GridView items incrementally](/windows/uwp/debug-test-perf/optimize-gridview-and-listview) section of [Optimize ListView and GridView](/windows/uwp/debug-test-perf/optimize-gridview-and-listview).
     * 
     * For more examples, download the [XAML GridView grouping and SemanticZoom sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20GridView%20grouping%20and%20SemanticZoom%20sample).
     * @type {TypedEventHandler<ListViewBase, ContainerContentChangingEventArgs>}
    */
    OnContainerContentChanging {
        get {
            if(!this.HasProp("__OnContainerContentChanging")){
                this.__OnContainerContentChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d01fb083-5e61-5c12-a18f-62947158faa8}"),
                    ListViewBase,
                    ContainerContentChangingEventArgs
                )
                this.__OnContainerContentChangingToken := this.add_ContainerContentChanging(this.__OnContainerContentChanging.iface)
            }
            return this.__OnContainerContentChanging
        }
    }

    /**
     * Occurs when a drag operation that involves one of the items in the view is ended.
     * @remarks
     * > [!IMPORTANT]
     * > In order to receive this event, the [CanDragItems](listviewbase_candragitems.md) property must be set to `true`.
     * @type {TypedEventHandler<ListViewBase, DragItemsCompletedEventArgs>}
    */
    OnDragItemsCompleted {
        get {
            if(!this.HasProp("__OnDragItemsCompleted")){
                this.__OnDragItemsCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{586d1c88-e27e-58ad-8e2f-7e6e83d81e40}"),
                    ListViewBase,
                    DragItemsCompletedEventArgs
                )
                this.__OnDragItemsCompletedToken := this.add_DragItemsCompleted(this.__OnDragItemsCompleted.iface)
            }
            return this.__OnDragItemsCompleted
        }
    }

    /**
     * Occurs when an item container is to be chosen for a data item.
     * @remarks
     * This event is raised only if the list or grid's [ItemsPanel](itemscontrol_itemspanel.md) is an [ItemsStackPanel](itemsstackpanel.md) or [ItemsWrapGrid](itemswrapgrid.md). If you replace the [ItemsPanel](itemscontrol_itemspanel.md) with another panel, the event is not raised.
     * @type {TypedEventHandler<ListViewBase, ChoosingItemContainerEventArgs>}
    */
    OnChoosingItemContainer {
        get {
            if(!this.HasProp("__OnChoosingItemContainer")){
                this.__OnChoosingItemContainer := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f06fc999-61e1-5d3f-b0ac-69f2ee9e4d64}"),
                    ListViewBase,
                    ChoosingItemContainerEventArgs
                )
                this.__OnChoosingItemContainerToken := this.add_ChoosingItemContainer(this.__OnChoosingItemContainer.iface)
            }
            return this.__OnChoosingItemContainer
        }
    }

    /**
     * Occurs when an item container is to be chosen for a data group.
     * @remarks
     * You typically handle this event to enable accessibility. The group headers do not have an accessible name set by default. This event provides access to the header instance and lets you to set the [AutomationProperties.Name](/uwp/api/windows.ui.xaml.automation.automationproperties.name) attached property to an appropriate value.
     * 
     * If the container provided in the args is null, you can create a new header and provide it through the args.
     * @type {TypedEventHandler<ListViewBase, ChoosingGroupHeaderContainerEventArgs>}
    */
    OnChoosingGroupHeaderContainer {
        get {
            if(!this.HasProp("__OnChoosingGroupHeaderContainer")){
                this.__OnChoosingGroupHeaderContainer := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4f5971d1-bae9-56f4-acd6-0a8246a6f255}"),
                    ListViewBase,
                    ChoosingGroupHeaderContainerEventArgs
                )
                this.__OnChoosingGroupHeaderContainerToken := this.add_ChoosingGroupHeaderContainer(this.__OnChoosingGroupHeaderContainer.iface)
            }
            return this.__OnChoosingGroupHeaderContainer
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemClickToken")) {
            this.remove_ItemClick(this.__OnItemClickToken)
            this.__OnItemClick.iface.Dispose()
        }

        if(this.HasProp("__OnDragItemsStartingToken")) {
            this.remove_DragItemsStarting(this.__OnDragItemsStartingToken)
            this.__OnDragItemsStarting.iface.Dispose()
        }

        if(this.HasProp("__OnContainerContentChangingToken")) {
            this.remove_ContainerContentChanging(this.__OnContainerContentChangingToken)
            this.__OnContainerContentChanging.iface.Dispose()
        }

        if(this.HasProp("__OnDragItemsCompletedToken")) {
            this.remove_DragItemsCompleted(this.__OnDragItemsCompletedToken)
            this.__OnDragItemsCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnChoosingItemContainerToken")) {
            this.remove_ChoosingItemContainer(this.__OnChoosingItemContainerToken)
            this.__OnChoosingItemContainer.iface.Dispose()
        }

        if(this.HasProp("__OnChoosingGroupHeaderContainerToken")) {
            this.remove_ChoosingGroupHeaderContainer(this.__OnChoosingGroupHeaderContainerToken)
            this.__OnChoosingGroupHeaderContainer.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_SelectedItems() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_SelectedItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_SelectionMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSwipeEnabled() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_IsSwipeEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSwipeEnabled(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_IsSwipeEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDragItems() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_CanDragItems()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDragItems(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_CanDragItems(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReorderItems() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_CanReorderItems()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReorderItems(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_CanReorderItems(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItemClickEnabled() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_IsItemClickEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsItemClickEnabled(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_IsItemClickEnabled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DataFetchSize() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_DataFetchSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DataFetchSize(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_DataFetchSize(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IncrementalLoadingThreshold() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_IncrementalLoadingThreshold()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_IncrementalLoadingThreshold(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_IncrementalLoadingThreshold(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncrementalLoadingTrigger() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_IncrementalLoadingTrigger()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IncrementalLoadingTrigger(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_IncrementalLoadingTrigger(value)
    }

    /**
     * 
     * @param {ItemClickEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemClick(handler) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.add_ItemClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemClick(token) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.remove_ItemClick(token)
    }

    /**
     * 
     * @param {DragItemsStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsStarting(handler) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.add_DragItemsStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsStarting(token) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.remove_DragItemsStarting(token)
    }

    /**
     * Scrolls the list to bring the specified data item into view.
     * @remarks
     * You use the [ScrollIntoView](listviewbase_scrollintoview_2024050476.md) method to bring an item into view when the [ListViewBase](listviewbase.md) control is not used as a view in a [SemanticZoom](semanticzoom.md) control. To bring an item into view when the [ListViewBase](listviewbase.md) control is used in a [SemanticZoom](semanticzoom.md), use the [MakeVisible](listviewbase_makevisible_1148837317.md) method instead.
     * 
     * When the contents of the [ItemsSource](itemscontrol_itemssource.md) collection changes, particularly if many items are added to or removed from the collection, you might need to call [UpdateLayout](../windows.ui.xaml/uielement_updatelayout_1243658106.md) prior to calling [ScrollIntoView](listviewbase_scrollintoview_2024050476.md) for the specified item to scroll into the viewport.
     * @param {IInspectable} item The data item to bring into view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.scrollintoview
     */
    ScrollIntoView(item) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.ScrollIntoView(item)
    }

    /**
     * Selects all the items in a view.
     * @remarks
     * > [!WARNING]
     * > Call the SelectAll method only when the [SelectionMode](listviewbase_selectionmode.md) property is set to [Multiple](listviewselectionmode.md) or [Extended](listviewselectionmode.md). If you call SelectAll when the [SelectionMode](listviewbase_selectionmode.md) is **Single** or **None**, an exception is thrown.
     * 
     * Starting in Windows 10, you can use the [SelectRange](listviewbase_selectrange_1824826911.md) and [DeselectRange](listviewbase_deselectrange_1629963900.md) methods with the [SelectedRanges](listviewbase_selectedranges.md) property to make selections using ranges of indexes. This is a more efficient way to describe item selection than using [SelectedItems](listviewbase_selecteditems.md), which requires the actual item object to be created for each selected item. To select all items using index ranges, use [SelectRange](listviewbase_selectrange_1824826911.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selectall
     */
    SelectAll() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.SelectAll()
    }

    /**
     * Initiates the asynchronous request to load more data items, in accordance with the active incremental loading settings.
     * @returns {IAsyncOperation<LoadMoreItemsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.loadmoreitemsasync
     */
    LoadMoreItemsAsync() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.LoadMoreItemsAsync()
    }

    /**
     * Scrolls the list to bring the specified data item into view with the specified alignment.
     * @remarks
     * You use the ScrollIntoView method to bring an item into view when the [ListViewBase](listviewbase.md) control is not used as a view in a [SemanticZoom](semanticzoom.md) control. To bring an item into view when the [ListViewBase](listviewbase.md) control is used in a [SemanticZoom](semanticzoom.md), use the [MakeVisible](listviewbase_makevisible_1148837317.md) method instead.
     * 
     * When the contents of the [ItemsSource](itemscontrol_itemssource.md) collection changes, particularly if many items are added to or removed from the collection, you might need to call [UpdateLayout](../windows.ui.xaml/uielement_updatelayout_1243658106.md) prior to calling ScrollIntoView for the specified item to scroll into the viewport.
     * @param {IInspectable} item The data item to bring into view.
     * @param {Integer} alignment An enumeration value that specifies whether the item uses **Default** or **Leading** alignment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.scrollintoview
     */
    ScrollIntoViewWithAlignment(item, alignment) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.ScrollIntoViewWithAlignment(item, alignment)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_HeaderTransitions() {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.get_HeaderTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_HeaderTransitions(value) {
        if (!this.HasProp("__IListViewBase")) {
            if ((queryResult := this.QueryInterface(IListViewBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase := IListViewBase(outPtr)
        }

        return this.__IListViewBase.put_HeaderTransitions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowsScrollingPlaceholders() {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.get_ShowsScrollingPlaceholders()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowsScrollingPlaceholders(value) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.put_ShowsScrollingPlaceholders(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ContainerContentChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContainerContentChanging(handler) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.add_ContainerContentChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContainerContentChanging(token) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.remove_ContainerContentChanging(token)
    }

    /**
     * Sets the maximum target time between two render passes when a [ListViewBase](listviewbase.md) is updating its UI with data items during initial load or scrolling.
     * @param {TimeSpan} duration_ The maximum target time between two render passes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.setdesiredcontainerupdateduration
     */
    SetDesiredContainerUpdateDuration(duration_) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.SetDesiredContainerUpdateDuration(duration_)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Footer() {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.get_Footer()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Footer(value) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.put_Footer(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_FooterTemplate() {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.get_FooterTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_FooterTemplate(value) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.put_FooterTemplate(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_FooterTransitions() {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.get_FooterTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_FooterTransitions(value) {
        if (!this.HasProp("__IListViewBase2")) {
            if ((queryResult := this.QueryInterface(IListViewBase2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase2 := IListViewBase2(outPtr)
        }

        return this.__IListViewBase2.put_FooterTransitions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReorderMode() {
        if (!this.HasProp("__IListViewBase3")) {
            if ((queryResult := this.QueryInterface(IListViewBase3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase3 := IListViewBase3(outPtr)
        }

        return this.__IListViewBase3.get_ReorderMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReorderMode(value) {
        if (!this.HasProp("__IListViewBase3")) {
            if ((queryResult := this.QueryInterface(IListViewBase3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase3 := IListViewBase3(outPtr)
        }

        return this.__IListViewBase3.put_ReorderMode(value)
    }

    /**
     * 
     * @returns {IVectorView<ItemIndexRange>} 
     */
    get_SelectedRanges() {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.get_SelectedRanges()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMultiSelectCheckBoxEnabled() {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.get_IsMultiSelectCheckBoxEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMultiSelectCheckBoxEnabled(value) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.put_IsMultiSelectCheckBoxEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, DragItemsCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsCompleted(handler) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.add_DragItemsCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsCompleted(token) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.remove_DragItemsCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ChoosingItemContainerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ChoosingItemContainer(handler) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.add_ChoosingItemContainer(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ChoosingItemContainer(token) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.remove_ChoosingItemContainer(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ChoosingGroupHeaderContainerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ChoosingGroupHeaderContainer(handler) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.add_ChoosingGroupHeaderContainer(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ChoosingGroupHeaderContainer(token) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.remove_ChoosingGroupHeaderContainer(token)
    }

    /**
     * Selects a block of items described by the [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md).
     * @remarks
     * SelectRange and [DeselectRange](listviewbase_deselectrange_1629963900.md) provide a more efficient way to modify the selection than using the [SelectedItems](listviewbase_selecteditems.md) property. When you select items using index ranges, use the [SelectedRanges](listviewbase_selectedranges.md) property to get all selected ranges in the list.
     * 
     * When you call SelectRange, all items in the specified range are selected, regardless of their original selection state. You can select all items in a collection by using an [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md) with a [FirstIndex](../windows.ui.xaml.data/itemindexrange_firstindex.md) value of 0 and a [Length](../windows.ui.xaml.data/itemindexrange_length.md) value equal to the number of items in the collection.
     * 
     * > [!WARNING]
     * > Call the SelectRange method only when the [SelectionMode](listviewbase_selectionmode.md) property is set to [Multiple](listviewselectionmode.md) or [Extended](listviewselectionmode.md). If you call SelectRange when the [SelectionMode](listviewbase_selectionmode.md) is **Single** or **None**, an exception is thrown.
     * 
     * > [!NOTE]
     * > If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), the [SelectedItems](listviewbase_selecteditems.md) collection is not updated based on selection in the list. Use the [SelectedRanges](listviewbase_selectedranges.md) property instead.
     * @param {ItemIndexRange} itemIndexRange_ Information about the range of items, including the index of the first and last items in the range, and the number of items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.selectrange
     */
    SelectRange(itemIndexRange_) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.SelectRange(itemIndexRange_)
    }

    /**
     * Deselects a block of items described by the [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md).
     * @remarks
     * [SelectRange](listviewbase_selectrange_1824826911.md) and DeselectRange provide a more efficient way to modify the selection than using the [SelectedItems](listviewbase_selecteditems.md) property. When you select items using index ranges, use the [SelectedRanges](listviewbase_selectedranges.md) property to get all selected ranges in the list.
     * 
     * When you call DeselectRange, all items in the specified range are deselected, regardless of their original selection state. You can deselect all items in a collection by using an [ItemIndexRange](../windows.ui.xaml.data/itemindexrange.md) with a [FirstIndex](../windows.ui.xaml.data/itemindexrange_firstindex.md) value of 0 and a [Length](../windows.ui.xaml.data/itemindexrange_length.md) value equal to the number of items in the collection.
     * 
     * > [!NOTE]
     * > If the [ItemsSource](itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), the [SelectedItems](listviewbase_selecteditems.md) collection is not updated based on selection in the list. Use the [SelectedRanges](listviewbase_selectedranges.md) property instead.
     * @param {ItemIndexRange} itemIndexRange_ Information about the range of items, including the index of the first and last items in the range, and the number of items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.deselectrange
     */
    DeselectRange(itemIndexRange_) {
        if (!this.HasProp("__IListViewBase4")) {
            if ((queryResult := this.QueryInterface(IListViewBase4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase4 := IListViewBase4(outPtr)
        }

        return this.__IListViewBase4.DeselectRange(itemIndexRange_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleSelectionFollowsFocus() {
        if (!this.HasProp("__IListViewBase5")) {
            if ((queryResult := this.QueryInterface(IListViewBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase5 := IListViewBase5(outPtr)
        }

        return this.__IListViewBase5.get_SingleSelectionFollowsFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SingleSelectionFollowsFocus(value) {
        if (!this.HasProp("__IListViewBase5")) {
            if ((queryResult := this.QueryInterface(IListViewBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase5 := IListViewBase5(outPtr)
        }

        return this.__IListViewBase5.put_SingleSelectionFollowsFocus(value)
    }

    /**
     * Returns a value that indicates whether the list view is both the drag source and drop target in a drag-and-drop operation.
     * @remarks
     * For more info, see [Drag and drop](/windows/uwp/design/input/drag-and-drop).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.isdragsource
     */
    IsDragSource() {
        if (!this.HasProp("__IListViewBase5")) {
            if ((queryResult := this.QueryInterface(IListViewBase5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase5 := IListViewBase5(outPtr)
        }

        return this.__IListViewBase5.IsDragSource()
    }

    /**
     * Attempts to start the animation.
     * @param {ConnectedAnimation} animation 
     * @param {IInspectable} item The data item that is animated into view.
     * @param {HSTRING} elementName The name of the element in the ItemTemplate that provides the animated visual.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.trystartconnectedanimationasync
     */
    TryStartConnectedAnimationAsync(animation, item, elementName) {
        if (!this.HasProp("__IListViewBase6")) {
            if ((queryResult := this.QueryInterface(IListViewBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase6 := IListViewBase6(outPtr)
        }

        return this.__IListViewBase6.TryStartConnectedAnimationAsync(animation, item, elementName)
    }

    /**
     * Returns a connected animation that's associated with the specified key, data item, and source element.
     * @param {HSTRING} key The key for the animation.
     * @param {IInspectable} item The data item that is animated out of view.
     * @param {HSTRING} elementName The name of the element in the ItemTemplate that provides the animated visual.
     * @returns {ConnectedAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.prepareconnectedanimation
     */
    PrepareConnectedAnimation(key, item, elementName) {
        if (!this.HasProp("__IListViewBase6")) {
            if ((queryResult := this.QueryInterface(IListViewBase6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewBase6 := IListViewBase6(outPtr)
        }

        return this.__IListViewBase6.PrepareConnectedAnimation(key, item, elementName)
    }

    /**
     * 
     * @returns {SemanticZoom} 
     */
    get_SemanticZoomOwner() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_SemanticZoomOwner()
    }

    /**
     * 
     * @param {SemanticZoom} value 
     * @returns {HRESULT} 
     */
    put_SemanticZoomOwner(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_SemanticZoomOwner(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActiveView() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_IsActiveView()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActiveView(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_IsActiveView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomedInView() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_IsZoomedInView()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomedInView(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_IsZoomedInView(value)
    }

    /**
     * Initializes the changes to related aspects of presentation (such as scrolling UI or state) when the overall view for a [SemanticZoom](isemanticzoominformation.md) is about to change.
     * @remarks
     * Controls derived from [ListViewBase](listviewbase.md) typically have an associated [ScrollViewer](scrollviewer.md) as part of their template. The [ListViewBase](listviewbase.md) implementation of [InitializeViewChange](isemanticzoominformation_initializeviewchange_1165335344.md) stores [ScrollBarVisibility](scrollbarvisibility.md) for current scroll bars, so that values can be perpetuated across the views when the views change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.initializeviewchange
     */
    InitializeViewChange() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.InitializeViewChange()
    }

    /**
     * Changes related aspects of presentation when the overall view for a [SemanticZoom](isemanticzoominformation.md) changes.
     * @remarks
     * Controls derived from [ListViewBase](listviewbase.md) typically have an associated [ScrollViewer](scrollviewer.md) as part of their template. The [ListViewBase](listviewbase.md) implementation of [CompleteViewChange](isemanticzoominformation_completeviewchange_1917507883.md) perpetuates [ScrollBarVisibility](scrollbarvisibility.md) for any scroll bars across the views when the views change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.completeviewchange
     */
    CompleteViewChange() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChange()
    }

    /**
     * Forces content in the view to scroll until the item that's specified by [SemanticZoomLocation](semanticzoomlocation.md) is visible. Also focuses the item if it finds the item.
     * @remarks
     * You use the MakeVisible method to bring an item into view when the [ListViewBase](listviewbase.md) control is used as a view in a [SemanticZoom](semanticzoom.md) control. To bring an item into view when the [ListViewBase](listviewbase.md) control is not used in a [SemanticZoom](semanticzoom.md), use the [ScrollIntoView](listviewbase_scrollintoview_2024050476.md) method instead.
     * @param {SemanticZoomLocation} item The item in the view to scroll to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.makevisible
     */
    MakeVisible(item) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.MakeVisible(item)
    }

    /**
     * Initializes item-wise operations that are related to a view change when the [ListViewBase](listviewbase.md) instance is the source view and the pending destination view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.startviewchangefrom
     */
    StartViewChangeFrom(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.StartViewChangeFrom(source, destination)
    }

    /**
     * Initializes item-wise operations that are related to a view change when the source view is a different view and the pending destination view is the [ListViewBase](listviewbase.md) instance.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.startviewchangeto
     */
    StartViewChangeTo(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.StartViewChangeTo(source, destination)
    }

    /**
     * Completes item-wise operations that are related to a view change when the [ListViewBase](listviewbase.md) instance is the source view and the new view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.completeviewchangefrom
     */
    CompleteViewChangeFrom(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChangeFrom(source, destination)
    }

    /**
     * Completes item-wise operations that are related to a view change when the [ListViewBase](listviewbase.md) instance is the destination view and the source view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewbase.completeviewchangeto
     */
    CompleteViewChangeTo(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChangeTo(source, destination)
    }

;@endregion Instance Methods
}
