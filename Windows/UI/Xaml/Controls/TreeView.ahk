#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ITreeView.ahk
#Include .\ITreeView2.ahk
#Include .\ITreeViewFactory.ahk
#Include .\ITreeViewStatics2.ahk
#Include .\ITreeViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TreeView.ahk
#Include .\TreeViewItemInvokedEventArgs.ahk
#Include .\TreeViewExpandingEventArgs.ahk
#Include .\TreeViewCollapsedEventArgs.ahk
#Include .\TreeViewDragItemsStartingEventArgs.ahk
#Include .\TreeViewDragItemsCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a hierarchical list with expanding and collapsing nodes that contain nested items. 
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView](/windows/winui/api/microsoft.ui.xaml.controls.treeview) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeView extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeView.IID

    /**
     * Identifies the CanDragItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.CanDragItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.candragitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.candragitemsproperty
     * @type {DependencyProperty} 
     */
    static CanDragItemsProperty {
        get => TreeView.get_CanDragItemsProperty()
    }

    /**
     * Identifies the CanReorderItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.CanReorderItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.canreorderitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.canreorderitemsproperty
     * @type {DependencyProperty} 
     */
    static CanReorderItemsProperty {
        get => TreeView.get_CanReorderItemsProperty()
    }

    /**
     * Identifies the ItemTemplate dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemTemplateProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemtemplateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemtemplateproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateProperty {
        get => TreeView.get_ItemTemplateProperty()
    }

    /**
     * Identifies the ItemTemplateSelector dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemTemplateSelectorProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemtemplateselectorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemtemplateselectorproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateSelectorProperty {
        get => TreeView.get_ItemTemplateSelectorProperty()
    }

    /**
     * Identifies the ItemContainerStyle dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerStyleProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainerstyleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainerstyleproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerStyleProperty {
        get => TreeView.get_ItemContainerStyleProperty()
    }

    /**
     * Identifies the ItemContainerStyleSelector dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerStyleSelectorProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainerstyleselectorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainerstyleselectorproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerStyleSelectorProperty {
        get => TreeView.get_ItemContainerStyleSelectorProperty()
    }

    /**
     * Identifies the ItemContainerTransitions dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerTransitionsProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainertransitionsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainertransitionsproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerTransitionsProperty {
        get => TreeView.get_ItemContainerTransitionsProperty()
    }

    /**
     * Identifies the ItemsSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemsSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemssourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemssourceproperty
     * @type {DependencyProperty} 
     */
    static ItemsSourceProperty {
        get => TreeView.get_ItemsSourceProperty()
    }

    /**
     * Identifies the SelectionMode dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.SelectionModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeview.selectionmodeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.selectionmodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionModeProperty {
        get => TreeView.get_SelectionModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TreeView} 
     */
    static CreateInstance() {
        if (!TreeView.HasProp("__ITreeViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewFactory.IID)
            TreeView.__ITreeViewFactory := ITreeViewFactory(factoryPtr)
        }

        return TreeView.__ITreeViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanDragItemsProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_CanDragItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanReorderItemsProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_CanReorderItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateSelectorProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemTemplateSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerStyleProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemContainerStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerStyleSelectorProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemContainerStyleSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerTransitionsProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemContainerTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsSourceProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics2.IID)
            TreeView.__ITreeViewStatics2 := ITreeViewStatics2(factoryPtr)
        }

        return TreeView.__ITreeViewStatics2.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionModeProperty() {
        if (!TreeView.HasProp("__ITreeViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewStatics.IID)
            TreeView.__ITreeViewStatics := ITreeViewStatics(factoryPtr)
        }

        return TreeView.__ITreeViewStatics.get_SelectionModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of root nodes of the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.RootNodes](/windows/winui/api/microsoft.ui.xaml.controls.treeview.rootnodes) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.rootnodes
     * @type {IVector<TreeViewNode>} 
     */
    RootNodes {
        get => this.get_RootNodes()
    }

    /**
     * Gets or sets the selection behavior for a [TreeView](treeview.md) instance.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.SelectionMode](/windows/winui/api/microsoft.ui.xaml.controls.treeview.selectionmode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Gets or sets the collection of nodes that are selected in the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.SelectedNodes](/windows/winui/api/microsoft.ui.xaml.controls.treeview.selectednodes) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.selectednodes
     * @type {IVector<TreeViewNode>} 
     */
    SelectedNodes {
        get => this.get_SelectedNodes()
    }

    /**
     * Gets or sets a value that indicates whether items in the view can be dragged as data payload.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.CanDragItems](/windows/winui/api/microsoft.ui.xaml.controls.treeview.candragitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.candragitems
     * @type {Boolean} 
     */
    CanDragItems {
        get => this.get_CanDragItems()
        set => this.put_CanDragItems(value)
    }

    /**
     * Gets or sets a value that indicates whether items in the view can be reordered through user interaction.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.CanReorderItems](/windows/winui/api/microsoft.ui.xaml.controls.treeview.canreorderitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.canreorderitems
     * @type {Boolean} 
     */
    CanReorderItems {
        get => this.get_CanReorderItems()
        set => this.put_CanReorderItems(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display each item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemTemplate](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemtemplate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * In Windows 10, version 1803, there is no **ItemTemplate** property. Instead, you have to re-template the **TreeView** control and specify a custom **ItemTemplate** if your content is not a string. This example shows how to apply a [DataTemplate](../windows.ui.xaml/datatemplate.md) to a tree view item in Windows 10, version 1803. For the code that defines `Item` and populates the **TreeView**, see the "[Tree view using data binding](/windows/uwp/design/controls-and-patterns/tree-view#tree-view-using-data-binding)" example in the _TreeView_ article.
     * 
     * ```xaml
     * <Page.Resources>
     *     <DataTemplate x:Key="TreeViewItemDataTemplate" x:DataType="local:Item">
     *         <TreeViewItem ItemsSource="{x:Bind Children}"
     *                       Content="{x:Bind Name}"/>
     *     </DataTemplate>
     * 
     *     <Style TargetType="TreeView">
     *         <Setter Property="IsTabStop" Value="False" />
     *         <Setter Property="Template">
     *             <Setter.Value>
     *                 <ControlTemplate TargetType="TreeView">
     *                     <TreeViewList x:Name="ListControl"
     *                                   ItemTemplate="{StaticResource TreeViewItemDataTemplate}"
     *                                   ItemContainerStyle="{StaticResource TreeViewItemStyle}"
     *                                   CanDragItems="True"
     *                                   AllowDrop="True"
     *                                   CanReorderItems="True">
     *                         <TreeViewList.ItemContainerTransitions>
     *                             <TransitionCollection>
     *                                 <ContentThemeTransition />
     *                                 <ReorderThemeTransition />
     *                                 <EntranceThemeTransition IsStaggeringEnabled="False" />
     *                             </TransitionCollection>
     *                         </TreeViewList.ItemContainerTransitions>
     *                     </TreeViewList>
     *                 </ControlTemplate>
     *             </Setter.Value>
     *         </Setter>
     *     </Style>
     * </Page.Resources>
     * <Grid>
     *     <TreeView Name="DessertTree"
     *               ItemsSource="{x:Bind DataSource}"/>
     * </Grid>
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemtemplate
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * Gets or sets a reference to a custom [DataTemplateSelector](datatemplateselector.md) logic class. The DataTemplateSelector referenced by this property returns a template to apply to items.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemTemplateSelector](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemtemplateselector) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemtemplateselector
     * @type {DataTemplateSelector} 
     */
    ItemTemplateSelector {
        get => this.get_ItemTemplateSelector()
        set => this.put_ItemTemplateSelector(value)
    }

    /**
     * Gets or sets the style that is used when rendering the item containers.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerStyle](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainerstyle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainerstyle
     * @type {Style} 
     */
    ItemContainerStyle {
        get => this.get_ItemContainerStyle()
        set => this.put_ItemContainerStyle(value)
    }

    /**
     * Gets or sets a reference to a custom [StyleSelector](styleselector.md) logic class. The [StyleSelector](styleselector.md) returns different [Style](../windows.ui.xaml/style.md) values to use for the item container based on characteristics of the object being displayed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerStyleSelector](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainerstyleselector) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainerstyleselector
     * @type {StyleSelector} 
     */
    ItemContainerStyleSelector {
        get => this.get_ItemContainerStyleSelector()
        set => this.put_ItemContainerStyleSelector(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the item containers of a TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemContainerTransitions](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemcontainertransitions) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemcontainertransitions
     * @type {TransitionCollection} 
     */
    ItemContainerTransitions {
        get => this.get_ItemContainerTransitions()
        set => this.put_ItemContainerTransitions(value)
    }

    /**
     * Gets or sets an object source used to generate the content of the TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemsSource](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemssource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The type of the object that you set the **ItemsSource** property to must implement particular interface(s). For more details, see the [Remarks](/uwp/api/windows.ui.xaml.controls.itemscontrol.itemssource#remarks) section of **ItemsControl.ItemsSource**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemssource
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * Occurs when an item in the tree is invoked.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemInvoked](/windows/winui/api/microsoft.ui.xaml.controls.treeview.iteminvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<TreeView, TreeViewItemInvokedEventArgs>}
    */
    OnItemInvoked {
        get {
            if(!this.HasProp("__OnItemInvoked")){
                this.__OnItemInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2311df32-be87-54cf-b2e0-d5a37e0fedef}"),
                    TreeView,
                    TreeViewItemInvokedEventArgs
                )
                this.__OnItemInvokedToken := this.add_ItemInvoked(this.__OnItemInvoked.iface)
            }
            return this.__OnItemInvoked
        }
    }

    /**
     * Occurs when a node in the tree starts to expand.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.Expanding](/windows/winui/api/microsoft.ui.xaml.controls.treeview.expanding) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<TreeView, TreeViewExpandingEventArgs>}
    */
    OnExpanding {
        get {
            if(!this.HasProp("__OnExpanding")){
                this.__OnExpanding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{21aa264d-5bc5-5244-ac35-3304786162d3}"),
                    TreeView,
                    TreeViewExpandingEventArgs
                )
                this.__OnExpandingToken := this.add_Expanding(this.__OnExpanding.iface)
            }
            return this.__OnExpanding
        }
    }

    /**
     * Occurs when a node in the tree is collapsed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.Collapsed](/windows/winui/api/microsoft.ui.xaml.controls.treeview.collapsed) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<TreeView, TreeViewCollapsedEventArgs>}
    */
    OnCollapsed {
        get {
            if(!this.HasProp("__OnCollapsed")){
                this.__OnCollapsed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cfb65e59-864e-5e43-a5dd-4bb9dab9721b}"),
                    TreeView,
                    TreeViewCollapsedEventArgs
                )
                this.__OnCollapsedToken := this.add_Collapsed(this.__OnCollapsed.iface)
            }
            return this.__OnCollapsed
        }
    }

    /**
     * Occurs when a drag operation that involves one of the items in the view is initiated.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.DragItemsStarting](/windows/winui/api/microsoft.ui.xaml.controls.treeview.dragitemsstarting) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * To receive this event, set the [CanDragItems](treeview_candragitems.md) property to **true**.
     * 
     * This event occurs when you start a drag-and-drop operation, including when you perform a reorder operation by drag-and-drop. When you perform custom actions as a result of a drag-and-drop operation, you typically listen to this event and provide more data using the [TreeViewDragItemsStartingEventArgs.Data](treeviewdragitemsstartingeventargs_data.md) property.
     * 
     * You can inspect the items being dragged by checking the [TreeViewDragItemsStartingEventArgs.Items](treeviewdragitemsstartingeventargs_items.md) property.
     * 
     * You can cancel the drag operation by setting the [TreeViewDragItemsStartingEventArgs.Cancel](treeviewdragitemsstartingeventargs_cancel.md) property to **true**.
     * @type {TypedEventHandler<TreeView, TreeViewDragItemsStartingEventArgs>}
    */
    OnDragItemsStarting {
        get {
            if(!this.HasProp("__OnDragItemsStarting")){
                this.__OnDragItemsStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c4bf4c51-0eea-501a-9f08-0e2271d8a4e5}"),
                    TreeView,
                    TreeViewDragItemsStartingEventArgs
                )
                this.__OnDragItemsStartingToken := this.add_DragItemsStarting(this.__OnDragItemsStarting.iface)
            }
            return this.__OnDragItemsStarting
        }
    }

    /**
     * Occurs when a drag operation that involves one of the items in the view is ended.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.DragItemsCompleted](/windows/winui/api/microsoft.ui.xaml.controls.treeview.dragitemscompleted) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * To receive this event, set the [CanDragItems](treeview_candragitems.md) property to **true**.
     * @type {TypedEventHandler<TreeView, TreeViewDragItemsCompletedEventArgs>}
    */
    OnDragItemsCompleted {
        get {
            if(!this.HasProp("__OnDragItemsCompleted")){
                this.__OnDragItemsCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{abb5b41c-b4ac-5a6f-8832-95e197428f89}"),
                    TreeView,
                    TreeViewDragItemsCompletedEventArgs
                )
                this.__OnDragItemsCompletedToken := this.add_DragItemsCompleted(this.__OnDragItemsCompleted.iface)
            }
            return this.__OnDragItemsCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemInvokedToken")) {
            this.remove_ItemInvoked(this.__OnItemInvokedToken)
            this.__OnItemInvoked.iface.Dispose()
        }

        if(this.HasProp("__OnExpandingToken")) {
            this.remove_Expanding(this.__OnExpandingToken)
            this.__OnExpanding.iface.Dispose()
        }

        if(this.HasProp("__OnCollapsedToken")) {
            this.remove_Collapsed(this.__OnCollapsedToken)
            this.__OnCollapsed.iface.Dispose()
        }

        if(this.HasProp("__OnDragItemsStartingToken")) {
            this.remove_DragItemsStarting(this.__OnDragItemsStartingToken)
            this.__OnDragItemsStarting.iface.Dispose()
        }

        if(this.HasProp("__OnDragItemsCompletedToken")) {
            this.remove_DragItemsCompleted(this.__OnDragItemsCompletedToken)
            this.__OnDragItemsCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_RootNodes() {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.get_RootNodes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.put_SelectionMode(value)
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_SelectedNodes() {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.get_SelectedNodes()
    }

    /**
     * Expands the specified node in the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.Expand](/windows/winui/api/microsoft.ui.xaml.controls.treeview.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {TreeViewNode} value The tree node to expand.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.expand
     */
    Expand(value) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.Expand(value)
    }

    /**
     * Collapses the specified node in the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.Collapse](/windows/winui/api/microsoft.ui.xaml.controls.treeview.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {TreeViewNode} value The tree node to collapse.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.collapse
     */
    Collapse(value) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.Collapse(value)
    }

    /**
     * Selects all nodes in the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.SelectAll](/windows/winui/api/microsoft.ui.xaml.controls.treeview.selectall) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.selectall
     */
    SelectAll() {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.SelectAll()
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewItemInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemInvoked(handler) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.add_ItemInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemInvoked(token) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.remove_ItemInvoked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewExpandingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Expanding(handler) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.add_Expanding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Expanding(token) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.remove_Expanding(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewCollapsedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Collapsed(handler) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.add_Collapsed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Collapsed(token) {
        if (!this.HasProp("__ITreeView")) {
            if ((queryResult := this.QueryInterface(ITreeView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView := ITreeView(outPtr)
        }

        return this.__ITreeView.remove_Collapsed(token)
    }

    /**
     * Returns the TreeViewNode corresponding to the specified container.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.NodeFromContainer](/windows/winui/api/microsoft.ui.xaml.controls.treeview.nodefromcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {DependencyObject} container The container to retrieve the TreeViewNode for.
     * @returns {TreeViewNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.nodefromcontainer
     */
    NodeFromContainer(container) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.NodeFromContainer(container)
    }

    /**
     * Returns the container corresponding to the specified node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ContainerFromNode](/windows/winui/api/microsoft.ui.xaml.controls.treeview.containerfromnode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {TreeViewNode} node_ The node to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.containerfromnode
     */
    ContainerFromNode(node_) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.ContainerFromNode(node_)
    }

    /**
     * Returns the item that corresponds to the specified, generated container.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ItemFromContainer](/windows/winui/api/microsoft.ui.xaml.controls.treeview.itemfromcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {DependencyObject} container The [DependencyObject](../windows.ui.xaml/dependencyobject.md) that corresponds to the item to be returned.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.itemfromcontainer
     */
    ItemFromContainer(container) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.ItemFromContainer(container)
    }

    /**
     * Returns the container corresponding to the specified item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeView.ContainerFromItem(Object)](/windows/winui/api/microsoft.ui.xaml.controls.treeview.containerfromitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {IInspectable} item The item to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeview.containerfromitem
     */
    ContainerFromItem(item) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.ContainerFromItem(item)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDragItems() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_CanDragItems()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDragItems(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_CanDragItems(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReorderItems() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_CanReorderItems()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReorderItems(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_CanReorderItems(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ItemTemplateSelector() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplateSelector(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemTemplateSelector(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ItemContainerStyle() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemContainerStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyle(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemContainerStyle(value)
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ItemContainerStyleSelector() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemContainerStyleSelector()
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyleSelector(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemContainerStyleSelector(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ItemContainerTransitions() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemContainerTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerTransitions(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemContainerTransitions(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.get_ItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.put_ItemsSource(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewDragItemsStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsStarting(handler) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.add_DragItemsStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsStarting(token) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.remove_DragItemsStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewDragItemsCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsCompleted(handler) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.add_DragItemsCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsCompleted(token) {
        if (!this.HasProp("__ITreeView2")) {
            if ((queryResult := this.QueryInterface(ITreeView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeView2 := ITreeView2(outPtr)
        }

        return this.__ITreeView2.remove_DragItemsCompleted(token)
    }

;@endregion Instance Methods
}
