#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBase.ahk
#Include .\IListView.ahk
#Include .\IListViewFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that displays data items in a vertical stack.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [List view and grid view](/windows/uwp/design/controls-and-patterns/listview-and-gridview).
 * 
 * Use a ListView to display a collection of items stacked vertically or horizontally. To display a collection in rows and columns, use a [GridView](gridview.md).
 * 
 * <img alt="List view control" src="images/controls/ListViewBasic.png" />
 * 
 * ListView is an [ItemsControl](itemscontrol.md), so it can contain a collection of items of any type. To populate the view, add items to the [Items](itemscontrol_items.md) collection, or set the [ItemsSource](itemscontrol_itemssource.md) property to a data source.
 * 
 * By default, a data item is displayed in the ListView as the string representation of the data object it's bound to. To specify exactly how items in the ListView are displayed, you create a [DataTemplate](../windows.ui.xaml/datatemplate.md) to define the layout of controls used to display an individual item. The controls in the layout can be bound to properties of a data object, or have content defined inline. You assign the [DataTemplate](../windows.ui.xaml/datatemplate.md) to the [ItemTemplate](itemscontrol_itemtemplate.md) property of the ListView. For common templates you can use in your app, see [Item templates for ListView](/windows/uwp/controls-and-patterns/item-templates-listview).
 * 
 * > [!NOTE]
 * > If you populate the ListView by setting the [ItemsSource](itemscontrol_itemssource.md) property, the [ItemTemplate](itemscontrol_itemtemplate.md) is applied to every item. If you populate the [Items](itemscontrol_items.md) collection directly, the [ItemTemplate](itemscontrol_itemtemplate.md) is applied only if the item is not a [ListViewItem](listviewitem.md). See Examples for more info.
 * 
 * If you use the ListView to display large sets of data, see [Optimize ListView and GridView](/windows/uwp/debug-test-perf/optimize-gridview-and-listview) for tips to maintain a smooth and responsive user experience.
 * 
 * > <div id="main">
 * > <strong>Windows 10, version 1709 (SDK 16299) - Behavior change</strong>
 * > </div>
 * > By default, instead of performing selection, an active pen now scrolls/pans a list in UWP apps (like touch, touchpad, and passive pen).
 * > If your app depends on the previous behavior, you can override pen scrolling and revert to the previous behavior. See [ScrollViewer](scrollviewer.md) for details.
 * 
 * By default, a user can select a single item in a ListView. You can set the [SelectionMode](listviewbase_selectionmode.md) property to a [ListViewSelectionMode](listviewselectionmode.md) enumeration value to allow multi-selection or to disable selection. You can also change the ListView interaction mode to make items respond to a user click like a button instead of being selected.
 * 
 * This table shows the ways a user can interact with a ListView, and how you can respond to the interaction.
 * 
 * | To enable this interaction: | Use these settings: | Handle this event: | Use this property to get the selected item: |
 * | - | - | - | - |
 * | No interaction | [SelectionMode](listviewbase_selectionmode.md) = [None](listviewselectionmode.md), [IsItemClickEnabled](listviewbase_isitemclickenabled.md) = **False** | N/A | N/A |
 * | Single selection | [SelectionMode](listviewbase_selectionmode.md) = [Single](listviewselectionmode.md), [IsItemClickEnabled](listviewbase_isitemclickenabled.md) = **False** | [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) | [SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md), [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) |
 * | Contiguous multi-selection | [SelectionMode](listviewbase_selectionmode.md) = [Multiple](listviewselectionmode.md), [IsItemClickEnabled](listviewbase_isitemclickenabled.md) = **False** | [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) | [SelectedItems](listviewbase_selecteditems.md) |
 * | Non-contiguous multi-selection | [SelectionMode](listviewbase_selectionmode.md) = [Extended](listviewselectionmode.md), [IsItemClickEnabled](listviewbase_isitemclickenabled.md) = **False** | [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) | [SelectedItems](listviewbase_selecteditems.md) |
 * | Click | [SelectionMode](listviewbase_selectionmode.md) = [None](listviewselectionmode.md), [IsItemClickEnabled](listviewbase_isitemclickenabled.md) = **True** | [ItemClick](listviewbase_itemclick.md) | N/A |
 * 
 * > [!NOTE]
 * > The [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md) event does not bubble up from a ListView. This means that a control that has a ListView inside of it does not receive mouse wheel change messages if the pointer is over the ListView. For example, if you put a ListView inside of a [ScrollViewer](scrollviewer.md), you can't scroll the [ScrollViewer](scrollviewer.md) with the mouse wheel when the pointer is over the ListView.
 * 
 * ListView supports data virtualization to improve performance with large data sets. Random access virtualization is supported when the data source implements the appropriate interfaces, which vary depending on the programming language:
 * 
 * + Visual C++ component extensions (C++/CX) apps should implement [IObservableVector](../windows.foundation.collections/iobservablevector_1.md).
 * + C# or Visual Basic apps should implement [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true) and [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) (not [IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true)). Virtualization requires both of these interfaces.
 *  Incremental loading virtualization is supported when the data source implements the [ISupportIncrementalLoading](../windows.ui.xaml.data/isupportincrementalloading.md) interface. When incremental loading is supported, you can use these members to control data loading: [DataFetchSize](listviewbase_datafetchsize.md), [IncrementalLoadingThreshold](listviewbase_incrementalloadingthreshold.md), [IncrementalLoadingTrigger](listviewbase_incrementalloadingtrigger.md), [LoadMoreItemsAsync](listviewbase_loadmoreitemsasync_1264491126.md).
 * 
 * > **Windows 8**
 * > In Windows 8, when the data item in a selected [ListViewItem](listviewitem.md) is replaced, the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) value is not cleared. In Windows 8.1 or later, the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) value is cleared.
 * 
 * ListView implements the [ISemanticZoomInformation](isemanticzoominformation.md) interface, so it can be used as a view in a [SemanticZoom](semanticzoom.md) control. When it's used in a [SemanticZoom](semanticzoom.md) control, always set the [ScrollViewer.IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) attached property to **false** on the [ScrollViewer](scrollviewer.md) that's in the ListView's control template, like this: `<ListView ScrollViewer.IsVerticalScrollChainingEnabled="False">`. These members have an effect only when the ListView is hosted in a [SemanticZoom](semanticzoom.md) control: [IsActiveView](listviewbase_isactiveview.md), [IsZoomedInView](listviewbase_iszoomedinview.md), [SemanticZoomOwner](listviewbase_semanticzoomowner.md), [CompleteViewChange](listviewbase_completeviewchange_1917507883.md), [CompleteViewChangeFrom](listviewbase_completeviewchangefrom_788425485.md), [CompleteViewChangeTo](listviewbase_completeviewchangeto_41306206.md), [InitializeViewChange](listviewbase_initializeviewchange_1165335344.md), [MakeVisible](listviewbase_makevisible_1148837317.md), [StartViewChangeFrom](listviewbase_startviewchangefrom_1386295791.md), [StartViewChangeTo](listviewbase_startviewchangeto_1504058226.md).
 * 
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListView extends ListViewBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ListView} 
     */
    static CreateInstance() {
        if (!ListView.HasProp("__IListViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewFactory.IID)
            ListView.__IListViewFactory := IListViewFactory(factoryPtr)
        }

        return ListView.__IListViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
