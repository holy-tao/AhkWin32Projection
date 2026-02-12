#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\SelectorItem.ahk
#Include .\IGridViewItem.ahk
#Include .\IGridViewItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [GridView](gridview.md) control.
 * @remarks
 * The GridViewItem class provides the container for items displayed in a [GridView](gridview.md) control. You populate the [GridView](gridview.md) by adding objects directly to its [Items](itemscontrol_items.md) collection or by binding its [ItemsSource](itemscontrol_itemssource.md) property to a data source. When items are added to the [GridView](gridview.md), a GridViewItem container is created automatically for each item in the collection.
 * 
 * You can specify the look of the GridViewItem by setting the [GridView](gridview.md)'s [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property to a [Style](../windows.ui.xaml/style.md) with a [TargetType](../windows.ui.xaml/style_targettype.md) of GridViewItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.gridviewitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class GridViewItem extends SelectorItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GridViewItem} 
     */
    static CreateInstance() {
        if (!GridViewItem.HasProp("__IGridViewItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.GridViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemFactory.IID)
            GridViewItem.__IGridViewItemFactory := IGridViewItemFactory(factoryPtr)
        }

        return GridViewItem.__IGridViewItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [GridViewItem](gridviewitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.gridviewitem.templatesettings
     * @type {GridViewItemTemplateSettings} 
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
     * @returns {GridViewItemTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IGridViewItem")) {
            if ((queryResult := this.QueryInterface(IGridViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItem := IGridViewItem(outPtr)
        }

        return this.__IGridViewItem.get_TemplateSettings()
    }

;@endregion Instance Methods
}
