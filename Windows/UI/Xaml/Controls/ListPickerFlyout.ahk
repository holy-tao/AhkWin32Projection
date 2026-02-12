#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\PickerFlyoutBase.ahk
#Include .\IListPickerFlyout.ahk
#Include .\IListPickerFlyoutStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ListPickerFlyout.ahk
#Include .\ItemsPickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick one or more items from a list. See Remarks.
 * @remarks
 * > [!IMPORTANT]
 * > ListPickerFlyout is not supported for use in Universal Windows Platform (UWP) app for Windows 10. Instead, to let a user to pick one item from a list use a [MenuFlyout](menuflyout.md). To let a user pick multiple items, use a [Flyout](flyout.md) with a list that has multiple-selection enabled.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListPickerFlyout extends PickerFlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListPickerFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListPickerFlyout.IID

    /**
     * Identifies the [ItemsSource](listpickerflyout_itemssource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.itemssourceproperty
     * @type {DependencyProperty} 
     */
    static ItemsSourceProperty {
        get => ListPickerFlyout.get_ItemsSourceProperty()
    }

    /**
     * Identifies the [ItemTemplate](listpickerflyout_itemtemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.itemtemplateproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateProperty {
        get => ListPickerFlyout.get_ItemTemplateProperty()
    }

    /**
     * Identifies the [DisplayMemberPath](listpickerflyout_displaymemberpath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.displaymemberpathproperty
     * @type {DependencyProperty} 
     */
    static DisplayMemberPathProperty {
        get => ListPickerFlyout.get_DisplayMemberPathProperty()
    }

    /**
     * Identifies the [SelectionMode](listpickerflyout_selectionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectionmodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionModeProperty {
        get => ListPickerFlyout.get_SelectionModeProperty()
    }

    /**
     * Identifies the [SelectedIndex](listpickerflyout_selectedindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedindexproperty
     * @type {DependencyProperty} 
     */
    static SelectedIndexProperty {
        get => ListPickerFlyout.get_SelectedIndexProperty()
    }

    /**
     * Identifies the [SelectedItem](listpickerflyout_selecteditem.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selecteditemproperty
     * @type {DependencyProperty} 
     */
    static SelectedItemProperty {
        get => ListPickerFlyout.get_SelectedItemProperty()
    }

    /**
     * Identifies the [SelectedValue](listpickerflyout_selectedvalue.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedvalueproperty
     * @type {DependencyProperty} 
     */
    static SelectedValueProperty {
        get => ListPickerFlyout.get_SelectedValueProperty()
    }

    /**
     * Identifies the [SelectedValuePath](listpickerflyout_selectedvaluepath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedvaluepathproperty
     * @type {DependencyProperty} 
     */
    static SelectedValuePathProperty {
        get => ListPickerFlyout.get_SelectedValuePathProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsSourceProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_ItemTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayMemberPathProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_DisplayMemberPathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionModeProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_SelectionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedIndexProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_SelectedIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedItemProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_SelectedItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedValueProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_SelectedValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedValuePathProperty() {
        if (!ListPickerFlyout.HasProp("__IListPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListPickerFlyoutStatics.IID)
            ListPickerFlyout.__IListPickerFlyoutStatics := IListPickerFlyoutStatics(factoryPtr)
        }

        return ListPickerFlyout.__IListPickerFlyoutStatics.get_SelectedValuePathProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an object source used to generate the content of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.itemssource
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * Gets or sets the DataTemplate used to display each item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.itemtemplate
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * Gets or sets the name or path of the property that is displayed for each data item
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.displaymemberpath
     * @type {HSTRING} 
     */
    DisplayMemberPath {
        get => this.get_DisplayMemberPath()
        set => this.put_DisplayMemberPath(value)
    }

    /**
     * Gets or sets the selection mode of the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Gets or sets the index of the selected item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * Gets or sets the selected item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * Gets or sets the value of the selected item, obtained by using the [SelectedValuePath](listpickerflyout_selectedvaluepath.md)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedvalue
     * @type {IInspectable} 
     */
    SelectedValue {
        get => this.get_SelectedValue()
        set => this.put_SelectedValue(value)
    }

    /**
     * Gets or sets the property path that is used to get the [SelectedValue](listpickerflyout_selectedvalue.md) property of the [SelectedItem](listpickerflyout_selecteditem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selectedvaluepath
     * @type {HSTRING} 
     */
    SelectedValuePath {
        get => this.get_SelectedValuePath()
        set => this.put_SelectedValuePath(value)
    }

    /**
     * Gets the list of currently selected items.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.selecteditems
     * @type {IVector<IInspectable>} 
     */
    SelectedItems {
        get => this.get_SelectedItems()
    }

    /**
     * Occurs when the user has selected items.
     * @type {TypedEventHandler<ListPickerFlyout, ItemsPickedEventArgs>}
    */
    OnItemsPicked {
        get {
            if(!this.HasProp("__OnItemsPicked")){
                this.__OnItemsPicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{46c68740-3f79-593f-a85f-4248127948c6}"),
                    ListPickerFlyout,
                    ItemsPickedEventArgs
                )
                this.__OnItemsPickedToken := this.add_ItemsPicked(this.__OnItemsPicked.iface)
            }
            return this.__OnItemsPicked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ListPickerFlyout](listpickerflyout.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListPickerFlyout")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemsPickedToken")) {
            this.remove_ItemsPicked(this.__OnItemsPickedToken)
            this.__OnItemsPicked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_ItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_ItemsSource(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_ItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_ItemTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMemberPath() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_DisplayMemberPath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMemberPath(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_DisplayMemberPath(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_SelectionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectedIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_SelectedIndex(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectedItem()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_SelectedItem(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedValue() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectedValue()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedValue(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_SelectedValue(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedValuePath() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectedValuePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SelectedValuePath(value) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.put_SelectedValuePath(value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_SelectedItems() {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.get_SelectedItems()
    }

    /**
     * 
     * @param {TypedEventHandler<ListPickerFlyout, ItemsPickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemsPicked(handler) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.add_ItemsPicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemsPicked(token) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.remove_ItemsPicked(token)
    }

    /**
     * Begins an asynchronous operation to show the flyout placed in relation to the specified element.
     * @param {FrameworkElement} target The element to use as the flyout's placement target.
     * @returns {IAsyncOperation<IVectorView<IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyout.showatasync
     */
    ShowAtAsync(target) {
        if (!this.HasProp("__IListPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IListPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListPickerFlyout := IListPickerFlyout(outPtr)
        }

        return this.__IListPickerFlyout.ShowAtAsync(target)
    }

;@endregion Instance Methods
}
