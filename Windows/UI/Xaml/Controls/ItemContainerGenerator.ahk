#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IItemContainerGenerator.ahk
#Include Primitives\ItemsChangedEventHandler.ahk
#Include Primitives\ItemsChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides mappings between the items of an [ItemsControl](itemscontrol.md) and their container elements.
 * @remarks
 * You set an ItemContainerGenerator as the value of the [ItemsControl.ItemContainerGenerator](itemscontrol_itemcontainergenerator.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemContainerGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemContainerGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemContainerGenerator.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemsChangedToken")) {
            this.remove_ItemsChanged(this.__OnItemsChangedToken)
            this.__OnItemsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {ItemsChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemsChanged(handler) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.add_ItemsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemsChanged(token) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.remove_ItemsChanged(token)
    }

    /**
     * > [!NOTE]
     * > ItemFromContainer may be altered or unavailable for releases after Windows 8.1. Instead, use [ItemsControl.ItemFromContainer](itemscontrol_itemfromcontainer_185124917.md).
     * 
     * Returns the item that corresponds to the specified, generated container.
     * @param {DependencyObject} container The [DependencyObject](../windows.ui.xaml/dependencyobject.md) that corresponds to the item to be returned.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.itemfromcontainer
     */
    ItemFromContainer(container) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.ItemFromContainer(container)
    }

    /**
     * > [!NOTE]
     * > ContainerFromItem may be altered or unavailable for releases after Windows 8.1. Instead, use [ItemsControl.ContainerFromItem](itemscontrol_containerfromitem_832238941.md).
     * 
     * Returns the container corresponding to the specified item.
     * @param {IInspectable} item The item to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.containerfromitem
     */
    ContainerFromItem(item) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.ContainerFromItem(item)
    }

    /**
     * > [!NOTE]
     * > IndexFromContainer may be altered or unavailable for releases after Windows 8.1. Instead, use [ItemsControl.IndexFromContainer](itemscontrol_indexfromcontainer_392666786.md).
     * 
     * Returns the index to the item that has the specified, generated container.
     * @param {DependencyObject} container The generated container to retrieve the item index for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.indexfromcontainer
     */
    IndexFromContainer(container) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.IndexFromContainer(container)
    }

    /**
     * > [!NOTE]
     * > ContainerFromIndex may be altered or unavailable for releases after Windows 8.1. Instead, use [ItemsControl.ContainerFromIndex](itemscontrol_containerfromindex_1393457780.md).
     * 
     * Returns the container for the item at the specified index within the [ItemCollection](itemcollection.md).
     * @param {Integer} index The index of the item to retrieve.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.containerfromindex
     */
    ContainerFromIndex(index) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.ContainerFromIndex(index)
    }

    /**
     * Returns the [ItemContainerGenerator](itemcontainergenerator.md) that is appropriate for use by the specified panel.
     * @param {Panel} panel_ The panel for which to return an appropriate [ItemContainerGenerator](itemcontainergenerator.md).
     * @returns {ItemContainerGenerator} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.getitemcontainergeneratorforpanel
     */
    GetItemContainerGeneratorForPanel(panel_) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.GetItemContainerGeneratorForPanel(panel_)
    }

    /**
     * Prepares the generator to generate items, starting at the specified [GeneratorPosition](../windows.ui.xaml.controls.primitives/generatorposition.md) and moving in the specified [GeneratorDirection](../windows.ui.xaml.controls.primitives/generatordirection.md). This method also controls whether or not to start at a generated (realized) item.
     * @param {GeneratorPosition} position A [GeneratorPosition](../windows.ui.xaml.controls.primitives/generatorposition.md) that specifies the position of the item to start generating items at.
     * @param {Integer} direction_ Specifies the position of the item to start generating items at.
     * @param {Boolean} allowStartAtRealizedItem Specifies whether to start at a generated (realized) item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.startat
     */
    StartAt(position, direction_, allowStartAtRealizedItem) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.StartAt(position, direction_, allowStartAtRealizedItem)
    }

    /**
     * Disposes the [ItemContainerGenerator](itemcontainergenerator.md). 
     * <!--Kind of a weak desc but it is straight from the devdoc.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.stop
     */
    Stop() {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.Stop()
    }

    /**
     * Returns the container element used to display the next item, and indicates whether the container element has been newly generated (realized).
     * @param {Pointer<Boolean>} isNewlyRealized **true** if the returned [DependencyObject](../windows.ui.xaml/dependencyobject.md) is newly generated (realized); otherwise, **false**.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.generatenext
     */
    GenerateNext(isNewlyRealized) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.GenerateNext(isNewlyRealized)
    }

    /**
     * Prepares the specified element as the container for the corresponding item.
     * @param {DependencyObject} container The container to prepare. Typically, *container* is the result of the previous call to [GenerateNext](itemcontainergenerator_generatenext_1034911097.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.prepareitemcontainer
     */
    PrepareItemContainer(container) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.PrepareItemContainer(container)
    }

    /**
     * Removes all generated (realized) items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.RemoveAll()
    }

    /**
     * Removes one or more generated (realized) items.
     * @param {GeneratorPosition} position The index of the element to remove. *position* must refer to a previously generated (realized) item, which means its offset must be zero.
     * @param {Integer} count The number of elements to remove, starting at *position*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.remove
     */
    Remove(position, count) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.Remove(position, count)
    }

    /**
     * Gets the generated position of the item at the specified index.
     * @param {Integer} itemIndex The index of the item to retrieve the position of.
     * @returns {GeneratorPosition} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.generatorpositionfromindex
     */
    GeneratorPositionFromIndex(itemIndex) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.GeneratorPositionFromIndex(itemIndex)
    }

    /**
     * Returns the index that maps to the specified [GeneratorPosition](../windows.ui.xaml.controls.primitives/generatorposition.md).
     * @param {GeneratorPosition} position The [GeneratorPosition](../windows.ui.xaml.controls.primitives/generatorposition.md) for the desired index.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.indexfromgeneratorposition
     */
    IndexFromGeneratorPosition(position) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.IndexFromGeneratorPosition(position)
    }

    /**
     * Disassociates item containers from their data items and saves the containers so they can be reused later for other data items.
     * @param {GeneratorPosition} position The zero-based index of the first element to reuse. *position* must refer to a previously generated (realized) item.
     * @param {Integer} count The number of elements to reuse, starting at *position*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcontainergenerator.recycle
     */
    Recycle(position, count) {
        if (!this.HasProp("__IItemContainerGenerator")) {
            if ((queryResult := this.QueryInterface(IItemContainerGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemContainerGenerator := IItemContainerGenerator(outPtr)
        }

        return this.__IItemContainerGenerator.Recycle(position, count)
    }

;@endregion Instance Methods
}
