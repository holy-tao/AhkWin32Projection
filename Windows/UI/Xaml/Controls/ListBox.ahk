#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\Selector.ahk
#Include .\IListBox.ahk
#Include .\IListBox2.ahk
#Include .\IListBoxStatics2.ahk
#Include .\IListBoxFactory.ahk
#Include .\IListBoxStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Presents a list of items the user can select from.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Lists](/windows/uwp/design/controls-and-patterns/lists#list-boxes).
 * 
 * ListBox lets users select from a pre-defined list of options presented like a text control. Use a ListBox when you want the options to be visible all the time or when users can select more than one option at a time. ListBox controls are always open, so several items can be displayed without user interaction.
 * 
 * <img alt="List box control" src="images/controls/ListBox.png" />
 * 
 * > [!NOTE]
 * > ListBox is useful when you are upgrading a Universal Windows 8 app that uses ListBox, and need to minimize changes. For new apps in Windows 10, we recommend using the [ListView](listview.md) control instead.
 * 
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListBox extends Selector {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListBox.IID

    /**
     * Identifies the [SingleSelectionFollowsFocus](listbox_singleselectionfollowsfocus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.singleselectionfollowsfocusproperty
     * @type {DependencyProperty} 
     */
    static SingleSelectionFollowsFocusProperty {
        get => ListBox.get_SingleSelectionFollowsFocusProperty()
    }

    /**
     * Identifies the [SelectionMode](listbox_selectionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.selectionmodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionModeProperty {
        get => ListBox.get_SelectionModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SingleSelectionFollowsFocusProperty() {
        if (!ListBox.HasProp("__IListBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxStatics2.IID)
            ListBox.__IListBoxStatics2 := IListBoxStatics2(factoryPtr)
        }

        return ListBox.__IListBoxStatics2.get_SingleSelectionFollowsFocusProperty()
    }

    /**
     * 
     * @returns {ListBox} 
     */
    static CreateInstance() {
        if (!ListBox.HasProp("__IListBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxFactory.IID)
            ListBox.__IListBoxFactory := IListBoxFactory(factoryPtr)
        }

        return ListBox.__IListBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionModeProperty() {
        if (!ListBox.HasProp("__IListBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxStatics.IID)
            ListBox.__IListBoxStatics := IListBoxStatics(factoryPtr)
        }

        return ListBox.__IListBoxStatics.get_SelectionModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of currently selected items for the [ListBox](listbox.md) control.
     * @remarks
     * When [SelectionMode](listbox_selectionmode.md) is **Multiple** or **Extended**, use the [SelectedItems](listviewbase_selecteditems.md) property to get the items that are selected. When [SelectionMode](listbox_selectionmode.md) is **Single**, use the [Selector.SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) property to get the item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.selecteditems
     * @type {IVector<IInspectable>} 
     */
    SelectedItems {
        get => this.get_SelectedItems()
    }

    /**
     * Gets or sets the selection behavior for the [ListBox](listbox.md) control.
     * @remarks
     * By default, a user can select a single item in a [ListBox](listbox.md). You can set the ListBox.SelectionMode property to a [SelectionMode](selectionmode.md) enumeration value to enable multi-selection. Here are the selection mode values.
     * 
     * | Selection mode | Behavior |
     * |---|---|
     * | [Single](selectionmode.md) | A user can select a single item using the space bar, mouse click, or touch tap. A user can deselect an item using a downward swipe gesture.<br/>- While pressing Ctrl: a user can deselect the item by using the space bar, mouse click, or touch tap. Using the arrow keys, a user can move focus independently of selection. |
     * | [Multiple](listviewselectionmode.md) | A user can select multiple items using the space bar, mouse click, or touch tap to toggle selection on the focused item. Using the arrow keys, a user can move focus independently of selection. |
     * | [Extended](listviewselectionmode.md) | With no modifier keys: the behavior is the same as [Single](listviewselectionmode.md) selection.<br/>- While pressing Ctrl: a user can select multiple items using the space bar, mouse click, or touch tap to toggle selection on the focused item. Using the arrow keys, a user can move focus independently of selection.<br/>- While pressing Shift: a user can select multiple contiguous items by clicking or tapping the first item in the selection and then the last item in the selection. Using the arrow keys, a user can create a contiguous selection starting with the item selected when Shift is pressed. |
     * 
     * When SelectionMode is **Single**, use the [Selector.SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) property to get the item that's selected. When SelectionMode is **Multiple** or **Extended**, use the [SelectedItems](listviewbase_selecteditems.md) property to get the items that are selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Gets or sets a value that indicates whether item selection changes when keyboard focus changes.
     * @remarks
     * This property is ignored if the list box's [SelectionMode](listviewbase_selectionmode.md) property is not set to **Single**.
     * 
     * By default, when a list box is configured for single selection, when the user moves keyboard focus to an item, the focused item is also selected. For example, if keyboard focus is moved from the first item to the second item, the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) property is updated from 0 to 1.
     * 
     * Set this property to **false** to let a user move focus without the item selection following. For example, if each selection change causes significant UI updates, you might prefer to let the user move focus to a non-adjacent item and then press enter to update selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.singleselectionfollowsfocus
     * @type {Boolean} 
     */
    SingleSelectionFollowsFocus {
        get => this.get_SingleSelectionFollowsFocus()
        set => this.put_SingleSelectionFollowsFocus(value)
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
    get_SelectedItems() {
        if (!this.HasProp("__IListBox")) {
            if ((queryResult := this.QueryInterface(IListBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox := IListBox(outPtr)
        }

        return this.__IListBox.get_SelectedItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IListBox")) {
            if ((queryResult := this.QueryInterface(IListBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox := IListBox(outPtr)
        }

        return this.__IListBox.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__IListBox")) {
            if ((queryResult := this.QueryInterface(IListBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox := IListBox(outPtr)
        }

        return this.__IListBox.put_SelectionMode(value)
    }

    /**
     * Causes the object to scroll into view.
     * @remarks
     * When the contents of the [ItemsSource](itemscontrol_itemssource.md) collection changes, particularly if many items are added to or removed from the collection, you might need to call [UpdateLayout](../windows.ui.xaml/uielement_updatelayout_1243658106.md) prior to calling ScrollIntoView for the specified item to scroll into the viewport.
     * @param {IInspectable} item The object to scroll to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.scrollintoview
     */
    ScrollIntoView(item) {
        if (!this.HasProp("__IListBox")) {
            if ((queryResult := this.QueryInterface(IListBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox := IListBox(outPtr)
        }

        return this.__IListBox.ScrollIntoView(item)
    }

    /**
     * Selects all the items in the [ListBox](listbox.md) control.
     * @remarks
     * > [!WARNING]
     * > The SelectAll method should only be called when the [SelectionMode](listbox_selectionmode.md) property is set to [Multiple](selectionmode.md) or [Extended](selectionmode.md). If SelectAll is called when the [SelectionMode](listbox_selectionmode.md) is **Single**, an exception is thrown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listbox.selectall
     */
    SelectAll() {
        if (!this.HasProp("__IListBox")) {
            if ((queryResult := this.QueryInterface(IListBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox := IListBox(outPtr)
        }

        return this.__IListBox.SelectAll()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleSelectionFollowsFocus() {
        if (!this.HasProp("__IListBox2")) {
            if ((queryResult := this.QueryInterface(IListBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox2 := IListBox2(outPtr)
        }

        return this.__IListBox2.get_SingleSelectionFollowsFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SingleSelectionFollowsFocus(value) {
        if (!this.HasProp("__IListBox2")) {
            if ((queryResult := this.QueryInterface(IListBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListBox2 := IListBox2(outPtr)
        }

        return this.__IListBox2.put_SingleSelectionFollowsFocus(value)
    }

;@endregion Instance Methods
}
