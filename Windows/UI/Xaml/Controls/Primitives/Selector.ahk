#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ItemsControl.ahk
#Include .\ISelector.ahk
#Include .\ISelectorStatics.ahk
#Include .\ISelectorFactory.ahk
#Include ..\SelectionChangedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\SelectionChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that enables a user to select an item from a collection of items.
 * @remarks
 * Selector has properties that enable selection of a single item in a collection.
 * 
 * - [SelectedIndex](selector_selectedindex.md): The 0-based index of the selected item. The default is -1, which indicates no item is selected.
 * - [SelectedItem](selector_selecteditem.md): The selected data item. The default is **null**, which indicates no item is selected.
 * - [SelectedValue](selector_selectedindex.md): The value of the selected data item, obtained by using the [SelectedValuePath](selector_selectedvaluepath.md).
 * 
 * Some controls that are derived from Selector, like [ListBox](../windows.ui.xaml.controls/listbox.md), [ListView](../windows.ui.xaml.controls/listview.md), and [GridView](../windows.ui.xaml.controls/gridview.md), also support multi-selection. When multi-selection is enabled in those controls, use their [SelectedItems](../windows.ui.xaml.controls/listviewbase_selecteditems.md) property to get the selected item collection.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class Selector extends ItemsControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelector.IID

    /**
     * Identifies the [SelectedIndex](selector_selectedindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedindexproperty
     * @type {DependencyProperty} 
     */
    static SelectedIndexProperty {
        get => Selector.get_SelectedIndexProperty()
    }

    /**
     * Identifies the [SelectedItem](selector_selecteditem.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selecteditemproperty
     * @type {DependencyProperty} 
     */
    static SelectedItemProperty {
        get => Selector.get_SelectedItemProperty()
    }

    /**
     * Gets the identifier for the [SelectedValue](selector_selectedvalue.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedvalueproperty
     * @type {DependencyProperty} 
     */
    static SelectedValueProperty {
        get => Selector.get_SelectedValueProperty()
    }

    /**
     * Gets the identifier for the [SelectedValuePath](selector_selectedvaluepath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedvaluepathproperty
     * @type {DependencyProperty} 
     */
    static SelectedValuePathProperty {
        get => Selector.get_SelectedValuePathProperty()
    }

    /**
     * Identifies the [IsSynchronizedWithCurrentItem](selector_issynchronizedwithcurrentitem.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.issynchronizedwithcurrentitemproperty
     * @type {DependencyProperty} 
     */
    static IsSynchronizedWithCurrentItemProperty {
        get => Selector.get_IsSynchronizedWithCurrentItemProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedIndexProperty() {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.get_SelectedIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedItemProperty() {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.get_SelectedItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedValueProperty() {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.get_SelectedValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedValuePathProperty() {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.get_SelectedValuePathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSynchronizedWithCurrentItemProperty() {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.get_IsSynchronizedWithCurrentItemProperty()
    }

    /**
     * Gets a value that indicates whether the specified [Selector](selector.md) has the focus.
     * @param {DependencyObject} element The [Selector](selector.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.getisselectionactive
     */
    static GetIsSelectionActive(element) {
        if (!Selector.HasProp("__ISelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Selector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectorStatics.IID)
            Selector.__ISelectorStatics := ISelectorStatics(factoryPtr)
        }

        return Selector.__ISelectorStatics.GetIsSelectionActive(element)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the index of the selected item.
     * @remarks
     * Some controls that are derived from [Selector](selector.md), like [ListBox](../windows.ui.xaml.controls/listbox.md), [ListView](../windows.ui.xaml.controls/listview.md), and [GridView](../windows.ui.xaml.controls/gridview.md), also support multi-selection. When multi-selection is enabled in those controls, use their [SelectedItems](../windows.ui.xaml.controls/listviewbase_selecteditems.md) property to get the selected item collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * Gets or sets the selected item.
     * @remarks
     * Some controls that are derived from [Selector](selector.md), like [ListBox](../windows.ui.xaml.controls/listbox.md), [ListView](../windows.ui.xaml.controls/listview.md), and [GridView](../windows.ui.xaml.controls/gridview.md), also support multi-selection. When multi-selection is enabled in those controls, use their [SelectedItems](../windows.ui.xaml.controls/listviewbase_selecteditems.md) property to get the selected item collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * Gets or sets the value of the selected item, obtained by using the [SelectedValuePath](selector_selectedvaluepath.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedvalue
     * @type {IInspectable} 
     */
    SelectedValue {
        get => this.get_SelectedValue()
        set => this.put_SelectedValue(value)
    }

    /**
     * Gets or sets the property path that is used to get the [SelectedValue](selector_selectedvalue.md) property of the [SelectedItem](selector_selecteditem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.selectedvaluepath
     * @type {HSTRING} 
     */
    SelectedValuePath {
        get => this.get_SelectedValuePath()
        set => this.put_SelectedValuePath(value)
    }

    /**
     * Gets or sets a value that indicates whether a [Selector](selector.md) should keep the [SelectedItem](selector_selecteditem.md) synchronized with the current item in the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) property.
     * @remarks
     * The nullable value for IsSynchronizedWithCurrentItem enables the value to be indeterminate, neither **true** nor **false**. This is indicated by a value of **null** if accessed in code. To set the value to **null** in XAML, use the [{x:Null} markup extension](/windows/uwp/xaml-platform/x-null-markup-extension).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.selector.issynchronizedwithcurrentitem
     * @type {IReference<Boolean>} 
     */
    IsSynchronizedWithCurrentItem {
        get => this.get_IsSynchronizedWithCurrentItem()
        set => this.put_IsSynchronizedWithCurrentItem(value)
    }

    /**
     * Occurs when the currently selected item changes.
     * @remarks
     * > [!NOTE]
     * > For [ListView](../windows.ui.xaml.controls/listview.md) and [GridView](../windows.ui.xaml.controls/gridview.md): If the [ItemsSource](../windows.ui.xaml.controls/itemscontrol_itemssource.md) implements [IItemsRangeInfo](../windows.ui.xaml.data/iitemsrangeinfo.md), and selection is modified using [SelectRange](../windows.ui.xaml.controls/listviewbase_selectrange_1824826911.md) or [DeselectRange](../windows.ui.xaml.controls/listviewbase_deselectrange_1629963900.md), the [AddedItems](../windows.ui.xaml.controls/selectionchangedeventargs_addeditems.md) and [RemovedItems](../windows.ui.xaml.controls/selectionchangedeventargs_removeditems.md) properties are not set in the [SelectionChangedEventArgs](../windows.ui.xaml.controls/selectionchangedeventargs.md). Setting these properties requires devirtualizing the item object. Use the [SelectedRanges](../windows.ui.xaml.controls/listviewbase_selectedranges.md) property to get the items instead.
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

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.get_SelectedIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.put_SelectedIndex(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.get_SelectedItem()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.put_SelectedItem(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedValue() {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.get_SelectedValue()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedValue(value) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.put_SelectedValue(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedValuePath() {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.get_SelectedValuePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SelectedValuePath(value) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.put_SelectedValuePath(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsSynchronizedWithCurrentItem() {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.get_IsSynchronizedWithCurrentItem()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsSynchronizedWithCurrentItem(value) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.put_IsSynchronizedWithCurrentItem(value)
    }

    /**
     * 
     * @param {SelectionChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__ISelector")) {
            if ((queryResult := this.QueryInterface(ISelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelector := ISelector(outPtr)
        }

        return this.__ISelector.remove_SelectionChanged(token)
    }

;@endregion Instance Methods
}
