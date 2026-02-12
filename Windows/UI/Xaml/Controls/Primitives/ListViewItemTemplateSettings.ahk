#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IListViewItemTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ListViewItem](../windows.ui.xaml.controls/listviewitem.md). Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitemtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ListViewItemTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewItemTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewItemTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items for a drag payload that contains this item as an origin.
     * @remarks
     * The default [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) template uses this value to display a text field that shows the count.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitemtemplatesettings.dragitemscount
     * @type {Integer} 
     */
    DragItemsCount {
        get => this.get_DragItemsCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragItemsCount() {
        if (!this.HasProp("__IListViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IListViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemTemplateSettings := IListViewItemTemplateSettings(outPtr)
        }

        return this.__IListViewItemTemplateSettings.get_DragItemsCount()
    }

;@endregion Instance Methods
}
