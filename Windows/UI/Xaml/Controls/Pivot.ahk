#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControl.ahk
#Include .\IPivot.ahk
#Include .\IPivot2.ahk
#Include .\IPivot3.ahk
#Include .\IPivotStatics.ahk
#Include .\IPivotStatics3.ahk
#Include .\IPivotStatics2.ahk
#Include .\IPivotFactory.ahk
#Include .\SelectionChangedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\SelectionChangedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\Pivot.ahk
#Include .\PivotItemEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that provides quick navigation of views within an app.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Pivot](/windows/uwp/design/controls-and-patterns/pivot).
 * 
 * Use a Pivot to present groups of content that a user can swipe through. You typically use a Pivot as the top level control on a page.
 * 
 * Pivot is an [ItemsControl](itemscontrol.md), so it can contain a collection of items of any type. Any item you add to the Pivot that is not explicitly a [PivotItem](pivotitem.md) is implicitly wrapped in a [PivotItem](pivotitem.md). Because a Pivot is often used to navigate between pages of content, it's common to populate the [Items](itemscontrol_items.md) collection directly with XAML UI elements. Or, you can set the [ItemsSource](itemscontrol_itemssource.md) property to a data source. Items bound in the [ItemsSource](itemscontrol_itemssource.md) can be of any type, but if they aren't explicitly [PivotItem](pivotitem.md) s, you must define an [ItemTemplate](itemscontrol_itemtemplate.md) and [HeaderTemplate](pivot_headertemplate.md) to specify how the items are displayed.
 * 
 * <!--<note>You can define an <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_itemtemplate">ItemTemplate</xref> whether <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.pivot">Pivot</xref> is populated through the <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_items">Items</xref> or <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_itemssource">ItemsSource</xref> property. If you populate the <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.pivot">Pivot</xref> by setting the <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_itemssource">ItemsSource</xref> property, the <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_itemtemplate">ItemTemplate</xref> is applied to every item. If you populate the <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_items">Items</xref> collection directly, the <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.itemscontrol_itemtemplate">ItemTemplate</xref> is applied only if the item is not a <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.pivotitem">PivotItem</xref>.</note>-->
 * 
 * You can use the [SelectedItem](pivot_selecteditem.md) property to get or set the Pivot's active item. Use the [SelectedIndex](pivot_selectedindex.md) property to get or set the index of the active item.
 * 
 * You can use the [LeftHeader](pivot_leftheader.md) and [RightHeader](pivot_rightheader.md) properties to add other controls to the Pivot header.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Pivot extends ItemsControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivot

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivot.IID

    /**
     * Identifies the [Title](pivot_title.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => Pivot.get_TitleProperty()
    }

    /**
     * Identifies the [TitleTemplate](pivot_titletemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.titletemplateproperty
     * @type {DependencyProperty} 
     */
    static TitleTemplateProperty {
        get => Pivot.get_TitleTemplateProperty()
    }

    /**
     * Identifies the [HeaderTemplate](pivot_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => Pivot.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [SelectedIndex](pivot_selectedindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.selectedindexproperty
     * @type {DependencyProperty} 
     */
    static SelectedIndexProperty {
        get => Pivot.get_SelectedIndexProperty()
    }

    /**
     * Identifies the [SelectedItem](pivot_selecteditem.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.selecteditemproperty
     * @type {DependencyProperty} 
     */
    static SelectedItemProperty {
        get => Pivot.get_SelectedItemProperty()
    }

    /**
     * Identifies the [IsLocked](pivot_islocked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.islockedproperty
     * @type {DependencyProperty} 
     */
    static IsLockedProperty {
        get => Pivot.get_IsLockedProperty()
    }

    /**
     * Identifies the [SlideInAnimationGroup](pivot_slideinanimationgroup.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.slideinanimationgroupproperty
     * @type {DependencyProperty} 
     */
    static SlideInAnimationGroupProperty {
        get => Pivot.get_SlideInAnimationGroupProperty()
    }

    /**
     * Identifies the [HeaderFocusVisualPlacement](pivot_headerfocusvisualplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.headerfocusvisualplacementproperty
     * @type {DependencyProperty} 
     */
    static HeaderFocusVisualPlacementProperty {
        get => Pivot.get_HeaderFocusVisualPlacementProperty()
    }

    /**
     * Identifies the [IsHeaderItemsCarouselEnabled](pivot_isheaderitemscarouselenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.isheaderitemscarouselenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHeaderItemsCarouselEnabledProperty {
        get => Pivot.get_IsHeaderItemsCarouselEnabledProperty()
    }

    /**
     * Identifies the [LeftHeader](pivot_leftheader.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.leftheaderproperty
     * @type {DependencyProperty} 
     */
    static LeftHeaderProperty {
        get => Pivot.get_LeftHeaderProperty()
    }

    /**
     * Identifies the [LeftHeaderTemplate](pivot_leftheadertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.leftheadertemplateproperty
     * @type {DependencyProperty} 
     */
    static LeftHeaderTemplateProperty {
        get => Pivot.get_LeftHeaderTemplateProperty()
    }

    /**
     * Identifies the [RightHeader](pivot_rightheader.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.rightheaderproperty
     * @type {DependencyProperty} 
     */
    static RightHeaderProperty {
        get => Pivot.get_RightHeaderProperty()
    }

    /**
     * Identifies the [RightHeaderTemplate](pivot_rightheadertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.rightheadertemplateproperty
     * @type {DependencyProperty} 
     */
    static RightHeaderTemplateProperty {
        get => Pivot.get_RightHeaderTemplateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_TitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleTemplateProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_TitleTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedIndexProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_SelectedIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedItemProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_SelectedItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsLockedProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_IsLockedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SlideInAnimationGroupProperty() {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.get_SlideInAnimationGroupProperty()
    }

    /**
     * Retrieves the animation group that a [FrameworkElement](../windows.ui.xaml/frameworkelement.md) belongs to.
     * @param {FrameworkElement} element The [FrameworkElement](../windows.ui.xaml/frameworkelement.md) within the Pivot (such as a [TextBlock](richtextblock.md)) that is to be animated.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.getslideinanimationgroup
     */
    static GetSlideInAnimationGroup(element) {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.GetSlideInAnimationGroup(element)
    }

    /**
     * Assigns a [FrameworkElement](../windows.ui.xaml/frameworkelement.md) to a slide-in animation group so that element is animated at the same time as the other members of that group.
     * @param {FrameworkElement} element The [FrameworkElement](../windows.ui.xaml/frameworkelement.md) within the Pivot (such as a [TextBlock](richtextblock.md)) that is to be animated.
     * @param {Integer} value The slide-in animation group that this [FrameworkElement](../windows.ui.xaml/frameworkelement.md) belongs to. This element will be animated with all other elements that share the same group number.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.setslideinanimationgroup
     */
    static SetSlideInAnimationGroup(element, value) {
        if (!Pivot.HasProp("__IPivotStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics.IID)
            Pivot.__IPivotStatics := IPivotStatics(factoryPtr)
        }

        return Pivot.__IPivotStatics.SetSlideInAnimationGroup(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderFocusVisualPlacementProperty() {
        if (!Pivot.HasProp("__IPivotStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics3.IID)
            Pivot.__IPivotStatics3 := IPivotStatics3(factoryPtr)
        }

        return Pivot.__IPivotStatics3.get_HeaderFocusVisualPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHeaderItemsCarouselEnabledProperty() {
        if (!Pivot.HasProp("__IPivotStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics3.IID)
            Pivot.__IPivotStatics3 := IPivotStatics3(factoryPtr)
        }

        return Pivot.__IPivotStatics3.get_IsHeaderItemsCarouselEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftHeaderProperty() {
        if (!Pivot.HasProp("__IPivotStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics2.IID)
            Pivot.__IPivotStatics2 := IPivotStatics2(factoryPtr)
        }

        return Pivot.__IPivotStatics2.get_LeftHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftHeaderTemplateProperty() {
        if (!Pivot.HasProp("__IPivotStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics2.IID)
            Pivot.__IPivotStatics2 := IPivotStatics2(factoryPtr)
        }

        return Pivot.__IPivotStatics2.get_LeftHeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RightHeaderProperty() {
        if (!Pivot.HasProp("__IPivotStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics2.IID)
            Pivot.__IPivotStatics2 := IPivotStatics2(factoryPtr)
        }

        return Pivot.__IPivotStatics2.get_RightHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RightHeaderTemplateProperty() {
        if (!Pivot.HasProp("__IPivotStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotStatics2.IID)
            Pivot.__IPivotStatics2 := IPivotStatics2(factoryPtr)
        }

        return Pivot.__IPivotStatics2.get_RightHeaderTemplateProperty()
    }

    /**
     * 
     * @returns {Pivot} 
     */
    static CreateInstance() {
        if (!Pivot.HasProp("__IPivotFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Pivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotFactory.IID)
            Pivot.__IPivotFactory := IPivotFactory(factoryPtr)
        }

        return Pivot.__IPivotFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the title to be optionally set above the headers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.title
     * @type {IInspectable} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the title template used for displaying the title above the headers area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.titletemplate
     * @type {DataTemplate} 
     */
    TitleTemplate {
        get => this.get_TitleTemplate()
        set => this.put_TitleTemplate(value)
    }

    /**
     * Gets or sets the template for the [Header](pivotitem_header.md) property of [PivotItem](pivotitem.md) children.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the zero-based index of the currently selected item in the [Pivot](pivot.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * Gets or sets the currently selected item in the [Pivot](pivot.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * Gets or sets whether the [Pivot](pivot.md) is locked to show only the current [PivotItem](pivotitem.md). While the Pivot is locked, all other PivotItems are removed, and the user cannot navigate to them. An example of locking is when the email list is put into a multi-select mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.islocked
     * @type {Boolean} 
     */
    IsLocked {
        get => this.get_IsLocked()
        set => this.put_IsLocked(value)
    }

    /**
     * Gets or sets the content for the header on the control's left side.
     * @remarks
     * You can set a data template for the LeftHeader value by using the [LeftHeaderTemplate](pivot_leftheadertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.leftheader
     * @type {IInspectable} 
     */
    LeftHeader {
        get => this.get_LeftHeader()
        set => this.put_LeftHeader(value)
    }

    /**
     * Gets or sets the template for the header on the control's left side.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.leftheadertemplate
     * @type {DataTemplate} 
     */
    LeftHeaderTemplate {
        get => this.get_LeftHeaderTemplate()
        set => this.put_LeftHeaderTemplate(value)
    }

    /**
     * Gets or sets the content for the header on the control's right side.
     * @remarks
     * You can set a data template for the RightHeader value by using the [RightHeaderTemplate](pivot_rightheadertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.rightheader
     * @type {IInspectable} 
     */
    RightHeader {
        get => this.get_RightHeader()
        set => this.put_RightHeader(value)
    }

    /**
     * Gets or sets the template for the header on the control's right side.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.rightheadertemplate
     * @type {DataTemplate} 
     */
    RightHeaderTemplate {
        get => this.get_RightHeaderTemplate()
        set => this.put_RightHeaderTemplate(value)
    }

    /**
     * Gets or sets a value that specifies the style of focus visual used for pivot header items.
     * @remarks
     * Use this property to specify how the focus visual is drawn around the [Pivot](pivot.md) header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.headerfocusvisualplacement
     * @type {Integer} 
     */
    HeaderFocusVisualPlacement {
        get => this.get_HeaderFocusVisualPlacement()
        set => this.put_HeaderFocusVisualPlacement(value)
    }

    /**
     * Gets or sets a value that indicates whether the selected header moves to the first position.
     * @remarks
     * This property has an effect only when the Pivot doesn't have enough space to show all the headers. If space is available, all headers are shown regardless of this property setting.
     * 
     * By default, the selected [Pivot](pivot.md) header always moves to the first position (far left), and the headers carousel. The user can pan infinitely and the content just wraps around from front to back.
     * 
     * When this property is **false**, the [Pivot](pivot.md) headers always keep the same position. Scrolling is enabled to show headers that don't fit in the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivot.isheaderitemscarouselenabled
     * @type {Boolean} 
     */
    IsHeaderItemsCarouselEnabled {
        get => this.get_IsHeaderItemsCarouselEnabled()
        set => this.put_IsHeaderItemsCarouselEnabled(value)
    }

    /**
     * Occurs when the currently selected item changes.
     * @type {SelectionChangedEventHandler}
    */
    OnSelectionChanged {
        get {
            if(!this.HasProp("__OnSelectionChanged")){
                this.__OnSelectionChanged := WinRTEventHandler(
                    SelectionChangedEventHandler,
                    SelectionChangedEventHandler.IID,
                    IInspectable,
                    SelectionChangedEventArgs
                )
                this.__OnSelectionChangedToken := this.add_SelectionChanged(this.__OnSelectionChanged.iface)
            }
            return this.__OnSelectionChanged
        }
    }

    /**
     * Event for offering an opportunity to dynamically load or change the content of a pivot item before it is displayed.
     * @type {TypedEventHandler<Pivot, PivotItemEventArgs>}
    */
    OnPivotItemLoading {
        get {
            if(!this.HasProp("__OnPivotItemLoading")){
                this.__OnPivotItemLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6b0c4ca2-7feb-5e4e-bf5c-de9f3ac4221c}"),
                    Pivot,
                    PivotItemEventArgs
                )
                this.__OnPivotItemLoadingToken := this.add_PivotItemLoading(this.__OnPivotItemLoading.iface)
            }
            return this.__OnPivotItemLoading
        }
    }

    /**
     * Event for indicating that an item has fully loaded.
     * @type {TypedEventHandler<Pivot, PivotItemEventArgs>}
    */
    OnPivotItemLoaded {
        get {
            if(!this.HasProp("__OnPivotItemLoaded")){
                this.__OnPivotItemLoaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6b0c4ca2-7feb-5e4e-bf5c-de9f3ac4221c}"),
                    Pivot,
                    PivotItemEventArgs
                )
                this.__OnPivotItemLoadedToken := this.add_PivotItemLoaded(this.__OnPivotItemLoaded.iface)
            }
            return this.__OnPivotItemLoaded
        }
    }

    /**
     * Event for offering an opportunity to dynamically load, change, or remove the content of a pivot item as it is removed.
     * @type {TypedEventHandler<Pivot, PivotItemEventArgs>}
    */
    OnPivotItemUnloading {
        get {
            if(!this.HasProp("__OnPivotItemUnloading")){
                this.__OnPivotItemUnloading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6b0c4ca2-7feb-5e4e-bf5c-de9f3ac4221c}"),
                    Pivot,
                    PivotItemEventArgs
                )
                this.__OnPivotItemUnloadingToken := this.add_PivotItemUnloading(this.__OnPivotItemUnloading.iface)
            }
            return this.__OnPivotItemUnloading
        }
    }

    /**
     * Event for notifying that the pivot item has been completely unloaded from the visual pivot.
     * @type {TypedEventHandler<Pivot, PivotItemEventArgs>}
    */
    OnPivotItemUnloaded {
        get {
            if(!this.HasProp("__OnPivotItemUnloaded")){
                this.__OnPivotItemUnloaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6b0c4ca2-7feb-5e4e-bf5c-de9f3ac4221c}"),
                    Pivot,
                    PivotItemEventArgs
                )
                this.__OnPivotItemUnloadedToken := this.add_PivotItemUnloaded(this.__OnPivotItemUnloaded.iface)
            }
            return this.__OnPivotItemUnloaded
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPivotItemLoadingToken")) {
            this.remove_PivotItemLoading(this.__OnPivotItemLoadingToken)
            this.__OnPivotItemLoading.iface.Dispose()
        }

        if(this.HasProp("__OnPivotItemLoadedToken")) {
            this.remove_PivotItemLoaded(this.__OnPivotItemLoadedToken)
            this.__OnPivotItemLoaded.iface.Dispose()
        }

        if(this.HasProp("__OnPivotItemUnloadingToken")) {
            this.remove_PivotItemUnloading(this.__OnPivotItemUnloadingToken)
            this.__OnPivotItemUnloading.iface.Dispose()
        }

        if(this.HasProp("__OnPivotItemUnloadedToken")) {
            this.remove_PivotItemUnloaded(this.__OnPivotItemUnloadedToken)
            this.__OnPivotItemUnloaded.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Title() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_Title()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_Title(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_TitleTemplate() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_TitleTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_TitleTemplate(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_TitleTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_SelectedIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_SelectedIndex(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_SelectedItem()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_SelectedItem(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLocked() {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.get_IsLocked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLocked(value) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.put_IsLocked(value)
    }

    /**
     * 
     * @param {SelectionChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Pivot, PivotItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PivotItemLoading(handler) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.add_PivotItemLoading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PivotItemLoading(token) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.remove_PivotItemLoading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Pivot, PivotItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PivotItemLoaded(handler) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.add_PivotItemLoaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PivotItemLoaded(token) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.remove_PivotItemLoaded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Pivot, PivotItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PivotItemUnloading(handler) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.add_PivotItemUnloading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PivotItemUnloading(token) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.remove_PivotItemUnloading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Pivot, PivotItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PivotItemUnloaded(handler) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.add_PivotItemUnloaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PivotItemUnloaded(token) {
        if (!this.HasProp("__IPivot")) {
            if ((queryResult := this.QueryInterface(IPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot := IPivot(outPtr)
        }

        return this.__IPivot.remove_PivotItemUnloaded(token)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_LeftHeader() {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.get_LeftHeader()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_LeftHeader(value) {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.put_LeftHeader(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_LeftHeaderTemplate() {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.get_LeftHeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_LeftHeaderTemplate(value) {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.put_LeftHeaderTemplate(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_RightHeader() {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.get_RightHeader()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_RightHeader(value) {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.put_RightHeader(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_RightHeaderTemplate() {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.get_RightHeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_RightHeaderTemplate(value) {
        if (!this.HasProp("__IPivot2")) {
            if ((queryResult := this.QueryInterface(IPivot2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot2 := IPivot2(outPtr)
        }

        return this.__IPivot2.put_RightHeaderTemplate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeaderFocusVisualPlacement() {
        if (!this.HasProp("__IPivot3")) {
            if ((queryResult := this.QueryInterface(IPivot3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot3 := IPivot3(outPtr)
        }

        return this.__IPivot3.get_HeaderFocusVisualPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HeaderFocusVisualPlacement(value) {
        if (!this.HasProp("__IPivot3")) {
            if ((queryResult := this.QueryInterface(IPivot3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot3 := IPivot3(outPtr)
        }

        return this.__IPivot3.put_HeaderFocusVisualPlacement(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeaderItemsCarouselEnabled() {
        if (!this.HasProp("__IPivot3")) {
            if ((queryResult := this.QueryInterface(IPivot3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot3 := IPivot3(outPtr)
        }

        return this.__IPivot3.get_IsHeaderItemsCarouselEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHeaderItemsCarouselEnabled(value) {
        if (!this.HasProp("__IPivot3")) {
            if ((queryResult := this.QueryInterface(IPivot3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivot3 := IPivot3(outPtr)
        }

        return this.__IPivot3.put_IsHeaderItemsCarouselEnabled(value)
    }

;@endregion Instance Methods
}
