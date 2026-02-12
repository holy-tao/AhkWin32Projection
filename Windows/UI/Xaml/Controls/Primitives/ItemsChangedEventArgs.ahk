#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IItemsChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [ItemsChanged](../windows.ui.xaml.controls/itemcontainergenerator_itemschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ItemsChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the action that occurred on the items collection.
     * @remarks
     * The `int` values for this property correspond to the values of the [CollectionChange](/uwp/api/Windows.Foundation.Collections.CollectionChange) enum.
     * 
     * |Value |Action  |
     * |---------|---------|
     * | 0    | Reset - The collection is changed.       |
     * |1     | ItemInserted - An item is added to the collection.        |
     * |2     | ItemRemoved - An item is removed from the collection.        |
     * |3     | ItemChanged - An item is changed in the collection.        |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * Gets the position in the collection where the change occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs.position
     * @type {GeneratorPosition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the position in the collection before the change occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs.oldposition
     * @type {GeneratorPosition} 
     */
    OldPosition {
        get => this.get_OldPosition()
    }

    /**
     * Gets the number of items that were involved in the change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs.itemcount
     * @type {Integer} 
     */
    ItemCount {
        get => this.get_ItemCount()
    }

    /**
     * Gets the number of UI elements involved in the change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.itemschangedeventargs.itemuicount
     * @type {Integer} 
     */
    ItemUICount {
        get => this.get_ItemUICount()
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
    get_Action() {
        if (!this.HasProp("__IItemsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsChangedEventArgs := IItemsChangedEventArgs(outPtr)
        }

        return this.__IItemsChangedEventArgs.get_Action()
    }

    /**
     * 
     * @returns {GeneratorPosition} 
     */
    get_Position() {
        if (!this.HasProp("__IItemsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsChangedEventArgs := IItemsChangedEventArgs(outPtr)
        }

        return this.__IItemsChangedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {GeneratorPosition} 
     */
    get_OldPosition() {
        if (!this.HasProp("__IItemsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsChangedEventArgs := IItemsChangedEventArgs(outPtr)
        }

        return this.__IItemsChangedEventArgs.get_OldPosition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCount() {
        if (!this.HasProp("__IItemsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsChangedEventArgs := IItemsChangedEventArgs(outPtr)
        }

        return this.__IItemsChangedEventArgs.get_ItemCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemUICount() {
        if (!this.HasProp("__IItemsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsChangedEventArgs := IItemsChangedEventArgs(outPtr)
        }

        return this.__IItemsChangedEventArgs.get_ItemUICount()
    }

;@endregion Instance Methods
}
