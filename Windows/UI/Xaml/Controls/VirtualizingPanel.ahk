#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IVirtualizingPanel.ahk
#Include .\IVirtualizingPanelProtected.ahk
#Include .\IVirtualizingPanelOverrides.ahk
#Include .\IVirtualizingPanelFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a framework for [Panel](panel.md) elements that virtualize their visual children.
 * @remarks
 * VirtualizingPanel is not typically used as an object element in XAML. You typically use derived classes such as [VirtualizingStackPanel](virtualizingstackpanel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class VirtualizingPanel extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualizingPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualizingPanel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that identifies the [ItemContainerGenerator](itemcontainergenerator.md) for this [VirtualizingPanel](virtualizingpanel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.itemcontainergenerator
     * @type {ItemContainerGenerator} 
     */
    ItemContainerGenerator {
        get => this.get_ItemContainerGenerator()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ItemContainerGenerator} 
     */
    get_ItemContainerGenerator() {
        if (!this.HasProp("__IVirtualizingPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanel := IVirtualizingPanel(outPtr)
        }

        return this.__IVirtualizingPanel.get_ItemContainerGenerator()
    }

    /**
     * Adds the specified [UIElement](../windows.ui.xaml/uielement.md) to the [Children](panel_children.md) collection of a [VirtualizingPanel](virtualizingpanel.md) element.
     * @param {UIElement} child The [UIElement](../windows.ui.xaml/uielement.md) child to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.addinternalchild
     */
    AddInternalChild(child) {
        if (!this.HasProp("__IVirtualizingPanelProtected")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelProtected := IVirtualizingPanelProtected(outPtr)
        }

        return this.__IVirtualizingPanelProtected.AddInternalChild(child)
    }

    /**
     * Adds the specified [UIElement](../windows.ui.xaml/uielement.md) to the collection of a [VirtualizingPanel](virtualizingpanel.md) element at the specified index position.
     * @param {Integer} index The index position within the collection at which the child element is inserted.
     * @param {UIElement} child The [UIElement](../windows.ui.xaml/uielement.md) child to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.insertinternalchild
     */
    InsertInternalChild(index, child) {
        if (!this.HasProp("__IVirtualizingPanelProtected")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelProtected := IVirtualizingPanelProtected(outPtr)
        }

        return this.__IVirtualizingPanelProtected.InsertInternalChild(index, child)
    }

    /**
     * Removes child elements from the [Children](panel_children.md) collection.
     * @param {Integer} index The beginning index position within the collection at which the first child element is removed.
     * @param {Integer} range The total number of child elements to remove from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.removeinternalchildrange
     */
    RemoveInternalChildRange(index, range) {
        if (!this.HasProp("__IVirtualizingPanelProtected")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelProtected := IVirtualizingPanelProtected(outPtr)
        }

        return this.__IVirtualizingPanelProtected.RemoveInternalChildRange(index, range)
    }

    /**
     * Called when the [Items](itemscontrol_items.md) collection that is associated with the [ItemsControl](itemscontrol.md) for this [Panel](panel.md) changes.
     * @param {IInspectable} sender The [Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true) that raised the event.
     * @param {ItemsChangedEventArgs} args Provides data for the [ItemsChanged](itemcontainergenerator_itemschanged.md) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.onitemschanged
     */
    OnItemsChanged(sender, args) {
        if (!this.HasProp("__IVirtualizingPanelOverrides")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelOverrides := IVirtualizingPanelOverrides(outPtr)
        }

        return this.__IVirtualizingPanelOverrides.OnItemsChanged(sender, args)
    }

    /**
     * Called when the collection of child elements is cleared by the base [Panel](panel.md) class.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.onclearchildren
     */
    OnClearChildren() {
        if (!this.HasProp("__IVirtualizingPanelOverrides")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelOverrides := IVirtualizingPanelOverrides(outPtr)
        }

        return this.__IVirtualizingPanelOverrides.OnClearChildren()
    }

    /**
     * Generates the item at the specified index location and makes it visible.
     * @param {Integer} index The index position of the item that is generated and made visible.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingpanel.bringindexintoview
     */
    BringIndexIntoView(index) {
        if (!this.HasProp("__IVirtualizingPanelOverrides")) {
            if ((queryResult := this.QueryInterface(IVirtualizingPanelOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingPanelOverrides := IVirtualizingPanelOverrides(outPtr)
        }

        return this.__IVirtualizingPanelOverrides.BringIndexIntoView(index)
    }

;@endregion Instance Methods
}
