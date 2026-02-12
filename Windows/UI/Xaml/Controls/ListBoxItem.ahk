#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\SelectorItem.ahk
#Include .\IListBoxItem.ahk
#Include .\IListBoxItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [ListBox](listbox.md) control.
 * @remarks
 * The ListBoxItem class provides the container for items displayed in a [ListBox](listbox.md) control. You populate the [ListBox](listbox.md) by adding ListBoxItems directly to its [Items](itemscontrol_items.md) collection or by binding its [ItemsSource](itemscontrol_itemssource.md) property to a data source. When items are added to the [ListBox](listbox.md), a ListBoxItem container is created automatically for each item in the collection.
 * 
 * You can specify the look of the ListBoxItem by setting the [ListBox](listbox.md)'s [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property to a [Style](../windows.ui.xaml/style.md) with a [TargetType](../windows.ui.xaml/style_targettype.md) of ListBoxItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listboxitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListBoxItem extends SelectorItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListBoxItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListBoxItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ListBoxItem} 
     */
    static CreateInstance() {
        if (!ListBoxItem.HasProp("__IListBoxItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListBoxItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxItemFactory.IID)
            ListBoxItem.__IListBoxItemFactory := IListBoxItemFactory(factoryPtr)
        }

        return ListBoxItem.__IListBoxItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
