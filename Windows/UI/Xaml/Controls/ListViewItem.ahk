#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\SelectorItem.ahk
#Include .\IListViewItem.ahk
#Include .\IListViewItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [ListView](listview.md) control.
 * @remarks
 * The ListViewItem class provides the container for items displayed in a [ListView](listview.md) control. You populate the [ListView](listview.md) by adding objects directly to its [Items](itemscontrol_items.md) collection or by binding its [ItemsSource](itemscontrol_itemssource.md) property to a data source. When items are added to the [ListView](listview.md), a ListViewItem container is created automatically for each item in the collection.
 * 
 * You can specify the look of the ListViewItem by setting the [ListView](listview.md)'s [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property to a [Style](../windows.ui.xaml/style.md) with a [TargetType](../windows.ui.xaml/style_targettype.md) of ListViewItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewItem extends SelectorItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ListViewItem} 
     */
    static CreateInstance() {
        if (!ListViewItem.HasProp("__IListViewItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ListViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemFactory.IID)
            ListViewItem.__IListViewItemFactory := IListViewItemFactory(factoryPtr)
        }

        return ListViewItem.__IListViewItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when you're defining templates for a [ListViewItem](listviewitem.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewitem.templatesettings
     * @type {ListViewItemTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ListViewItemTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IListViewItem")) {
            if ((queryResult := this.QueryInterface(IListViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItem := IListViewItem(outPtr)
        }

        return this.__IListViewItem.get_TemplateSettings()
    }

;@endregion Instance Methods
}
