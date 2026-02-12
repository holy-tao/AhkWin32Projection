#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IItemsControl.ahk
#Include .\IItemsControl2.ahk
#Include .\IItemsControl3.ahk
#Include .\IItemsControlOverrides.ahk
#Include .\IItemContainerMapping.ahk
#Include .\IItemsControlStatics.ahk
#Include .\IItemsControlFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that can be used to present a collection of items.
 * @remarks
 * An ItemsControl object can serve two roles. It can be used to present a fixed set of items, or it can be used to display a list obtained from data binding to a data source. Using an ItemsControl for data is more common. To display data, specify the binding to the data as the [ItemsSource](itemscontrol_itemssource.md) value (or use the data context) and don't populate [Items](itemscontrol_items.md). If you want to display a fixed list, populate [Items](itemscontrol_items.md) with one or more [FrameworkElement](../windows.ui.xaml/frameworkelement.md) child objects, and don't specify [ItemsSource](itemscontrol_itemssource.md).
 * 
 * There are several controls that inherit from ItemsControl that you can use in your app, but you can also use an ItemsControl directly, because it does offer a basic presentation of data or items. Controls that derive from ItemsControl and which add additional presentation features include: [ListView](listview.md), [GridView](gridview.md), [ListBox](listbox.md), other [Selector](../windows.ui.xaml.controls.primitives/selector.md) derived controls ([ComboBox](combobox.md), [FlipView](flipview.md)), [MenuFlyoutPresenter](menuflyoutpresenter.md).
 * 
 * [ListView](listview.md) and [GridView](gridview.md) are the two most commonly used controls for displaying data. For more info on how to use these controls, including sample code, see [Adding ListView and GridView controls](/previous-versions/windows/apps/hh780618(v=win.10)).
 * 
 * [ItemsSource](itemscontrol_itemssource.md) typically references a list of items. This can be a fixed list from a business object, or a list that's designed to fire notifications if the underlying data changes. The list might be a generic interface (for example [IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true)) or a practical class that implements the collection interfaces that Windows Runtime data binding supports. When you display items in an ItemsControl, you can use the [ItemTemplate](itemscontrol_itemtemplate.md) property, the [ItemsPanel](itemscontrol_itemspanel.md) property, or both to specify the appearance of the items. The [DisplayMemberPath](itemscontrol_displaymemberpath.md) property can be used for a master-details view of the data. For more info on how to use these properties in data binding scenarios, how lists are supported, and how to implement two-way bindings or notifications on changes, see the "Binding to collections" section of [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth). Support for data and items is one of the areas where you'll use different interfaces and techniques for Visual C++ component extensions (C++/CX) than you do for C# or Microsoft Visual Basic; [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth) also includes a table for that info.
 * 
 * You can provide a custom template for an ItemsControl because it is a [Control](control.md) class. But before retemplating ItemsControl you should check whether one of the derived classes already offers a similar template and gives you the presentation experience you want. In particular, if you're looking for data presentation that has an association with the orientation of the items (list is either horizontal or vertical) you should look at [ListView](listview.md) and [GridView](gridview.md).
 * 
 * ItemsControl implements [IItemContainerMapping](iitemcontainermapping.md), which is mainly a helper interface that supports other features. App code seldom calls the [IItemContainerMapping](iitemcontainermapping.md) methods directly, and controls that derive from ItemsControl or any of the deeper classes typically don't have to reimplement [IItemContainerMapping](iitemcontainermapping.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsControl.IID

    /**
     * Identifies the [ItemsSource](itemscontrol_itemssource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemssourceproperty
     * @type {DependencyProperty} 
     */
    static ItemsSourceProperty {
        get => ItemsControl.get_ItemsSourceProperty()
    }

    /**
     * Identifies the [ItemTemplate](itemscontrol_itemtemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemtemplateproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateProperty {
        get => ItemsControl.get_ItemTemplateProperty()
    }

    /**
     * Identifies the [ItemTemplateSelector](itemscontrol_itemtemplateselector.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemtemplateselectorproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateSelectorProperty {
        get => ItemsControl.get_ItemTemplateSelectorProperty()
    }

    /**
     * Identifies the [ItemsPanel](itemscontrol_itemspanel.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemspanelproperty
     * @type {DependencyProperty} 
     */
    static ItemsPanelProperty {
        get => ItemsControl.get_ItemsPanelProperty()
    }

    /**
     * Identifies the [DisplayMemberPath](itemscontrol_displaymemberpath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.displaymemberpathproperty
     * @type {DependencyProperty} 
     */
    static DisplayMemberPathProperty {
        get => ItemsControl.get_DisplayMemberPathProperty()
    }

    /**
     * Identifies the [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainerstyleproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerStyleProperty {
        get => ItemsControl.get_ItemContainerStyleProperty()
    }

    /**
     * Identifies the [ItemContainerStyleSelector](itemscontrol_itemcontainerstyleselector.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainerstyleselectorproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerStyleSelectorProperty {
        get => ItemsControl.get_ItemContainerStyleSelectorProperty()
    }

    /**
     * Identifies the [ItemContainerTransitions](itemscontrol_itemcontainertransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainertransitionsproperty
     * @type {DependencyProperty} 
     */
    static ItemContainerTransitionsProperty {
        get => ItemsControl.get_ItemContainerTransitionsProperty()
    }

    /**
     * Identifies the [GroupStyleSelector](itemscontrol_groupstyleselector.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.groupstyleselectorproperty
     * @type {DependencyProperty} 
     */
    static GroupStyleSelectorProperty {
        get => ItemsControl.get_GroupStyleSelectorProperty()
    }

    /**
     * Identifies the [IsGrouping](itemscontrol_isgrouping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.isgroupingproperty
     * @type {DependencyProperty} 
     */
    static IsGroupingProperty {
        get => ItemsControl.get_IsGroupingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsSourceProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateSelectorProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemTemplateSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsPanelProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemsPanelProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayMemberPathProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_DisplayMemberPathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerStyleProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemContainerStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerStyleSelectorProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemContainerStyleSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemContainerTransitionsProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_ItemContainerTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupStyleSelectorProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_GroupStyleSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsGroupingProperty() {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.get_IsGroupingProperty()
    }

    /**
     * Returns the [ItemsControl](itemscontrol.md) that the specified element hosts items for.
     * @param {DependencyObject} element The host element.
     * @returns {ItemsControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.getitemsowner
     */
    static GetItemsOwner(element) {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.GetItemsOwner(element)
    }

    /**
     * Returns the [ItemsControl](itemscontrol.md) that owns the specified container element.
     * @param {DependencyObject} container The container element to return the [ItemsControl](itemscontrol.md) for.
     * @returns {ItemsControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemscontrolfromitemcontainer
     */
    static ItemsControlFromItemContainer(container) {
        if (!ItemsControl.HasProp("__IItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlStatics.IID)
            ItemsControl.__IItemsControlStatics := IItemsControlStatics(factoryPtr)
        }

        return ItemsControl.__IItemsControlStatics.ItemsControlFromItemContainer(container)
    }

    /**
     * 
     * @returns {ItemsControl} 
     */
    static CreateInstance() {
        if (!ItemsControl.HasProp("__IItemsControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsControlFactory.IID)
            ItemsControl.__IItemsControlFactory := IItemsControlFactory(factoryPtr)
        }

        return ItemsControl.__IItemsControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an object source used to generate the content of the [ItemsControl](itemscontrol.md).
     * @remarks
     * The type of the object that you set the **ItemsSource** property to must implement one of these interfaces.
     * 
     * |.NET|C++/WinRT|C++/CX|
     * |-|-|-|
     * |[IEnumerable\<Object\>](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true)|[IIterable](/uwp/api/windows.foundation.collections.iiterable_t_)\<[IInspectable](/windows/win32/api/inspectable/nn-inspectable-iinspectable)\>|[IIterable](/uwp/api/windows.foundation.collections.iiterable_t_)\<[Object](/cpp/cppcx/platform-object-class)^\>|
     * |[IEnumerable](/dotnet/api/system.collections.ienumerable?view=dotnet-uwp-10.0&preserve-view=true)|[IBindableIterable](/uwp/api/windows.ui.xaml.interop.ibindableiterable)|[IBindableIterable](/uwp/api/windows.ui.xaml.interop.ibindableiterable)|
     * 
     * The **ItemsControl** can provide better performance if the **ItemsSource** property value also implements a random-access list interface.
     * 
     * |.NET|C++/WinRT|C++/CX|
     * |-|-|-|
     * |[IList\<Object\>](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true)|[IVector](/uwp/api/windows.foundation.collections.ivector_t_)\<[IInspectable](/windows/win32/api/inspectable/nn-inspectable-iinspectable)\>|[IVector](/uwp/api/windows.foundation.collections.ivector_t_)\<[Object](/cpp/cppcx/platform-object-class)^\>|
     * |[IReadOnlyCollection\<Object\>](/dotnet/api/system.collections.generic.ireadonlylist-1?view=dotnet-uwp-10.0&preserve-view=true)|[IVectorView](/uwp/api/windows.foundation.collections.ivectorview_t_)\<[IInspectable](/windows/win32/api/inspectable/nn-inspectable-iinspectable)\>|[IVectorView](/uwp/api/windows.foundation.collections.ivectorview_t_)\<[Object](/cpp/cppcx/platform-object-class)^\>|
     * |[IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true)|[IBindableVector](/uwp/api/windows.ui.xaml.interop.ibindablevector)|[IBindableVector](/uwp/api/windows.ui.xaml.interop.ibindablevector)|
     * ||[IBindableVectorView](/uwp/api/windows.ui.xaml.interop.ibindablevectorview)|[IBindableVectorView](/uwp/api/windows.ui.xaml.interop.ibindablevectorview)|
     * ||[IBindableObservableVector](/uwp/api/windows.ui.xaml.interop.ibindableobservablevector)|[IBindableObservableVector](/uwp/api/windows.ui.xaml.interop.ibindableobservablevector)|
     * 
     * The **ItemsControl** can raise collection-changed notification events if the **ItemsSource** property value also implements a collection-changed notification interface.
     * 
     * |.NET|C++/WinRT|C++/CX|
     * |-|-|-|
     * |[INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true)|[INotifyCollectionChanged](/uwp/api/windows.ui.xaml.interop.inotifycollectionchanged)|[INotifyCollectionChanged](/uwp/api/windows.ui.xaml.interop.inotifycollectionchanged)|
     * |[ObservableCollection\<Object\>](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true)|[IObservableVector](/uwp/api/windows.foundation.collections.iobservablevector_t_)\<[IInspectable](/windows/win32/api/inspectable/nn-inspectable-iinspectable)\>|[IObservableVector](/uwp/api/windows.foundation.collections.iobservablevector_t_)\<[Object](/cpp/cppcx/platform-object-class)^\>|
     * 
     * For .NET, in order for the collection-changed events to be handled, the **ItemsSource** property must also implement the non-generic [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemssource
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * Gets the collection used to generate the content of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.items
     * @type {ItemCollection} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display each item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemtemplate
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * Gets or sets a reference to a custom [DataTemplateSelector](datatemplateselector.md) logic class. The [DataTemplateSelector](datatemplateselector.md) referenced by this property returns a template to apply to items.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemtemplateselector
     * @type {DataTemplateSelector} 
     */
    ItemTemplateSelector {
        get => this.get_ItemTemplateSelector()
        set => this.put_ItemTemplateSelector(value)
    }

    /**
     * Gets or sets the template that defines the panel that controls the layout of items.
     * @remarks
     * > [!NOTE]
     * > [ComboBox](combobox.md) uses a [CarouselPanel](../windows.ui.xaml.controls.primitives/carouselpanel.md) as its ItemsPanel. Using a different panel as the ItemsPanel of [ComboBox](combobox.md) is not supported and might result in undesired behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemspanel
     * @type {ItemsPanelTemplate} 
     */
    ItemsPanel {
        get => this.get_ItemsPanel()
        set => this.put_ItemsPanel(value)
    }

    /**
     * Gets or sets the name or path of the property that is displayed for each data item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.displaymemberpath
     * @type {HSTRING} 
     */
    DisplayMemberPath {
        get => this.get_DisplayMemberPath()
        set => this.put_DisplayMemberPath(value)
    }

    /**
     * Gets or sets the style that is used when rendering the item containers for an [ItemsControl](/uwp/api/windows.ui.xaml.controls.itemscontrol).
     * @remarks
     * Derived classes of `ItemsControl` include [Selector](/uwp/api/windows.ui.xaml.controls.primitives.selector) and [MenuFlyoutPresenter](/uwp/api/windows.ui.xaml.controls.menuflyoutpresenter). Derived classes from Selector include [ComboBox](/uwp/api/windows.ui.xaml.controls.combobox), [FlipView](/uwp/api/windows.ui.xaml.controls.flipview), [ListBox](/uwp/api/windows.ui.xaml.controls.listbox), and [ListViewBase](/uwp/api/windows.ui.xaml.controls.listviewbase) (which [ListView](/uwp/api/windows.ui.xaml.controls.listview) and [GridView](/uwp/api/windows.ui.xaml.controls.gridview) are derived from). Therefore the `ItemContainerStyle` class can be used to edit the [Style](/uwp/api/windows.ui.xaml.style) of a `ListViewItem`, `GridViewItem`, and so on. 
     * 
     * For every item in an `ItemsControl`, an item container element is used to display the item. By default the item container is a [ContentPresenter](/uwp/api/Windows.UI.Xaml.Controls.ContentPresenter). But subclasses of `ItemsControl` can override this, for example the container type in a [ListView](/uwp/api/Windows.UI.Xaml.Controls.ListView) is a [ListViewItem](/uwp/api/Windows.UI.Xaml.Controls.ListViewItem). The value of the `ItemContainerStyle` is set as the [FrameworkElement.Style](/uwp/api/Windows.UI.Xaml.FrameworkElement.Style) property of the container.
     * 
     * `ItemContainerStyle` can then be used to change the style of every element generated by an ItemsControl, and provides a lot of flexibility and customization options in that area. Although many styling options are available within the `ItemContainerStyle` class, it is most useful when trying to edit how the _elements containing the data_ are displayed in comparison to one another - changing their spacing, their horizontal alignment, etc. To change the visualization of the _data objects themselves_, such as their background color or font-size, use an [ItemTemplate](/uwp/api/windows.ui.xaml.controls.itemscontrol.itemtemplate). To change the overall layout or orientation of your ItemsControl/its items, look into editing its [ItemsPanel](/uwp/api/windows.ui.xaml.controls.itemscontrol.itemspanel).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainerstyle
     * @type {Style} 
     */
    ItemContainerStyle {
        get => this.get_ItemContainerStyle()
        set => this.put_ItemContainerStyle(value)
    }

    /**
     * Gets or sets a reference to a custom [StyleSelector](styleselector.md) logic class. The [StyleSelector](styleselector.md) returns different [Style](../windows.ui.xaml/style.md) values to use for the item container based on characteristics of the object being displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainerstyleselector
     * @type {StyleSelector} 
     */
    ItemContainerStyleSelector {
        get => this.get_ItemContainerStyleSelector()
        set => this.put_ItemContainerStyleSelector(value)
    }

    /**
     * Gets the [ItemContainerGenerator](itemcontainergenerator.md) associated with this [ItemsControl](itemscontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainergenerator
     * @type {ItemContainerGenerator} 
     */
    ItemContainerGenerator {
        get => this.get_ItemContainerGenerator()
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the item containers of an [ItemsControl](itemscontrol.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Items collections can have transition animations associated with add or remove actions, or for drop target scenarios.
     * 
     * This property is more typically set in a [Style](../windows.ui.xaml/style.md) setter rather than inline on an object element in UI definition. For more info, see [Styling controls](/windows/uwp/controls-and-patterns/styling-controls).
     * 
     * The default template for [GridView](gridview.md) includes existing transition animations. Specifically, the default ItemContainerTransitions value already contains values for [AddDeleteThemeTransition](../windows.ui.xaml.media.animation/adddeletethemetransition.md), [ContentThemeTransition](../windows.ui.xaml.media.animation/contentthemetransition.md), [ReorderThemeTransition](../windows.ui.xaml.media.animation/reorderthemetransition.md) and [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md) (with `IsStaggeringEnabled="False"`). If you are setting a new value for ItemContainerTransitions on [GridView](gridview.md), consider reproducing these same theme animations as a starting point.
     * 
     * To remove all default content transitions from a [GridView](gridview.md), you might have to re-template the [GroupStyle.ContainerStyle](groupstyle_containerstyle.md). The transition behavior for items and their containers are interrelated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemcontainertransitions
     * @type {TransitionCollection} 
     */
    ItemContainerTransitions {
        get => this.get_ItemContainerTransitions()
        set => this.put_ItemContainerTransitions(value)
    }

    /**
     * Gets a collection of [GroupStyle](groupstyle.md) objects that define the appearance of each level of groups.
     * @remarks
     * > [!NOTE]
     * > [GroupStyle.ContainerStyle](groupstyle_containerstyle.md) and [GroupStyle.ContainerStyleSelector](groupstyle_containerstyleselector.md) are deprecated in Windows 8.1, and are ignored in ItemsControl.GroupStyle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.groupstyle
     * @type {IObservableVector<GroupStyle>} 
     */
    GroupStyle {
        get => this.get_GroupStyle()
    }

    /**
     * Gets or sets a reference to a custom [GroupStyleSelector](groupstyleselector.md) logic class. The [GroupStyleSelector](groupstyleselector.md) returns different [GroupStyle](groupstyle.md) values to use for content based on the characteristics of that content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.groupstyleselector
     * @type {GroupStyleSelector} 
     */
    GroupStyleSelector {
        get => this.get_GroupStyleSelector()
        set => this.put_GroupStyleSelector(value)
    }

    /**
     * Gets a value that indicates whether the control is using grouping.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.isgrouping
     * @type {Boolean} 
     */
    IsGrouping {
        get => this.get_IsGrouping()
    }

    /**
     * Gets the [Panel](panel.md) specified by [ItemsPanel](itemscontrol_itemspanel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemspanelroot
     * @type {Panel} 
     */
    ItemsPanelRoot {
        get => this.get_ItemsPanelRoot()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemsSource(value)
    }

    /**
     * 
     * @returns {ItemCollection} 
     */
    get_Items() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_Items()
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ItemTemplateSelector() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplateSelector(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemTemplateSelector(value)
    }

    /**
     * 
     * @returns {ItemsPanelTemplate} 
     */
    get_ItemsPanel() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemsPanel()
    }

    /**
     * 
     * @param {ItemsPanelTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemsPanel(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemsPanel(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMemberPath() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_DisplayMemberPath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMemberPath(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_DisplayMemberPath(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ItemContainerStyle() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemContainerStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyle(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemContainerStyle(value)
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ItemContainerStyleSelector() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemContainerStyleSelector()
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyleSelector(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemContainerStyleSelector(value)
    }

    /**
     * 
     * @returns {ItemContainerGenerator} 
     */
    get_ItemContainerGenerator() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemContainerGenerator()
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ItemContainerTransitions() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_ItemContainerTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerTransitions(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_ItemContainerTransitions(value)
    }

    /**
     * 
     * @returns {IObservableVector<GroupStyle>} 
     */
    get_GroupStyle() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_GroupStyle()
    }

    /**
     * 
     * @returns {GroupStyleSelector} 
     */
    get_GroupStyleSelector() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_GroupStyleSelector()
    }

    /**
     * 
     * @param {GroupStyleSelector} value 
     * @returns {HRESULT} 
     */
    put_GroupStyleSelector(value) {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.put_GroupStyleSelector(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrouping() {
        if (!this.HasProp("__IItemsControl")) {
            if ((queryResult := this.QueryInterface(IItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl := IItemsControl(outPtr)
        }

        return this.__IItemsControl.get_IsGrouping()
    }

    /**
     * 
     * @returns {Panel} 
     */
    get_ItemsPanelRoot() {
        if (!this.HasProp("__IItemsControl2")) {
            if ((queryResult := this.QueryInterface(IItemsControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl2 := IItemsControl2(outPtr)
        }

        return this.__IItemsControl2.get_ItemsPanelRoot()
    }

    /**
     * Returns the group header container that corresponds to the specified container element.
     * @param {DependencyObject} itemContainer The container element to return the group header container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.groupheadercontainerfromitemcontainer
     */
    GroupHeaderContainerFromItemContainer(itemContainer) {
        if (!this.HasProp("__IItemsControl3")) {
            if ((queryResult := this.QueryInterface(IItemsControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControl3 := IItemsControl3(outPtr)
        }

        return this.__IItemsControl3.GroupHeaderContainerFromItemContainer(itemContainer)
    }

    /**
     * Determines whether the specified item is (or is eligible to be) its own container.
     * @param {IInspectable} item The item to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.isitemitsowncontaineroverride
     */
    IsItemItsOwnContainerOverride(item) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.IsItemItsOwnContainerOverride(item)
    }

    /**
     * Creates or identifies the element that is used to display the given item.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.getcontainerforitemoverride
     */
    GetContainerForItemOverride() {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.GetContainerForItemOverride()
    }

    /**
     * Undoes the effects of the [PrepareContainerForItemOverride](itemscontrol_preparecontainerforitemoverride_1839050347.md) method.
     * @param {DependencyObject} element The container element.
     * @param {IInspectable} item The item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.clearcontainerforitemoverride
     */
    ClearContainerForItemOverride(element, item) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.ClearContainerForItemOverride(element, item)
    }

    /**
     * Prepares the specified element to display the specified item.
     * @param {DependencyObject} element The element that's used to display the specified item.
     * @param {IInspectable} item The item to display.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.preparecontainerforitemoverride
     */
    PrepareContainerForItemOverride(element, item) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.PrepareContainerForItemOverride(element, item)
    }

    /**
     * Invoked when the value of the [Items](itemscontrol_items.md) property changes.
     * @param {IInspectable} e Event data. Not specifically typed in the current implementation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.onitemschanged
     */
    OnItemsChanged(e) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnItemsChanged(e)
    }

    /**
     * Invoked when the value of the [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property changes.
     * @param {Style} oldItemContainerStyle The previous value of the [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property.
     * @param {Style} newItemContainerStyle The current value of the [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.onitemcontainerstylechanged
     */
    OnItemContainerStyleChanged(oldItemContainerStyle, newItemContainerStyle) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnItemContainerStyleChanged(oldItemContainerStyle, newItemContainerStyle)
    }

    /**
     * Invoked when the value of the [ItemContainerStyleSelector](itemscontrol_itemcontainerstyleselector.md) property changes.
     * @param {StyleSelector} oldItemContainerStyleSelector The previous value of the [ItemContainerStyleSelector](itemscontrol_itemcontainerstyleselector.md) property.
     * @param {StyleSelector} newItemContainerStyleSelector The current value of the [ItemContainerStyleSelector](itemscontrol_itemcontainerstyleselector.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.onitemcontainerstyleselectorchanged
     */
    OnItemContainerStyleSelectorChanged(oldItemContainerStyleSelector, newItemContainerStyleSelector) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnItemContainerStyleSelectorChanged(oldItemContainerStyleSelector, newItemContainerStyleSelector)
    }

    /**
     * Invoked when the value of the [ItemTemplate](itemscontrol_itemtemplate.md) property changes.
     * @param {DataTemplate} oldItemTemplate The previous value of the [ItemTemplate](itemscontrol_itemtemplate.md) property.
     * @param {DataTemplate} newItemTemplate The current value of the [ItemTemplate](itemscontrol_itemtemplate.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.onitemtemplatechanged
     */
    OnItemTemplateChanged(oldItemTemplate, newItemTemplate) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnItemTemplateChanged(oldItemTemplate, newItemTemplate)
    }

    /**
     * Invoked when the value of the [ItemTemplateSelector](itemscontrol_itemtemplateselector.md) property changes.
     * @param {DataTemplateSelector} oldItemTemplateSelector The previous value of the [ItemTemplateSelector](itemscontrol_itemtemplateselector.md) property.
     * @param {DataTemplateSelector} newItemTemplateSelector The current value of the [ItemTemplateSelector](itemscontrol_itemtemplateselector.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.onitemtemplateselectorchanged
     */
    OnItemTemplateSelectorChanged(oldItemTemplateSelector, newItemTemplateSelector) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnItemTemplateSelectorChanged(oldItemTemplateSelector, newItemTemplateSelector)
    }

    /**
     * Invoked when the value of the [GroupStyleSelector](itemscontrol_groupstyleselectorproperty.md) property changes.
     * @param {GroupStyleSelector} oldGroupStyleSelector The previous value of the [GroupStyleSelector](itemscontrol_groupstyleselectorproperty.md) property.
     * @param {GroupStyleSelector} newGroupStyleSelector The current value of the [GroupStyleSelector](itemscontrol_groupstyleselectorproperty.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.ongroupstyleselectorchanged
     */
    OnGroupStyleSelectorChanged(oldGroupStyleSelector, newGroupStyleSelector) {
        if (!this.HasProp("__IItemsControlOverrides")) {
            if ((queryResult := this.QueryInterface(IItemsControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsControlOverrides := IItemsControlOverrides(outPtr)
        }

        return this.__IItemsControlOverrides.OnGroupStyleSelectorChanged(oldGroupStyleSelector, newGroupStyleSelector)
    }

    /**
     * Returns the item that corresponds to the specified, generated container.
     * @param {DependencyObject} container The [DependencyObject](../windows.ui.xaml/dependencyobject.md) that corresponds to the item to be returned.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.itemfromcontainer
     */
    ItemFromContainer(container) {
        if (!this.HasProp("__IItemContainerMapping")) {
            if ((queryResult := this.QueryInterface(IItemContainerMapping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerMapping := IItemContainerMapping(outPtr)
        }

        return this.__IItemContainerMapping.ItemFromContainer(container)
    }

    /**
     * Returns the container corresponding to the specified item.
     * @param {IInspectable} item The item to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.containerfromitem
     */
    ContainerFromItem(item) {
        if (!this.HasProp("__IItemContainerMapping")) {
            if ((queryResult := this.QueryInterface(IItemContainerMapping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerMapping := IItemContainerMapping(outPtr)
        }

        return this.__IItemContainerMapping.ContainerFromItem(item)
    }

    /**
     * Returns the index to the item that has the specified, generated container.
     * @param {DependencyObject} container The generated container to retrieve the item index for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.indexfromcontainer
     */
    IndexFromContainer(container) {
        if (!this.HasProp("__IItemContainerMapping")) {
            if ((queryResult := this.QueryInterface(IItemContainerMapping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerMapping := IItemContainerMapping(outPtr)
        }

        return this.__IItemContainerMapping.IndexFromContainer(container)
    }

    /**
     * Returns the container for the item at the specified index within the [ItemCollection](itemcollection.md).
     * @param {Integer} index The index of the item to retrieve.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.containerfromindex
     */
    ContainerFromIndex(index) {
        if (!this.HasProp("__IItemContainerMapping")) {
            if ((queryResult := this.QueryInterface(IItemContainerMapping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerMapping := IItemContainerMapping(outPtr)
        }

        return this.__IItemContainerMapping.ContainerFromIndex(index)
    }

;@endregion Instance Methods
}
