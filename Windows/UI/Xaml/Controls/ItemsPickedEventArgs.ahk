#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IItemsPickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ItemsPicked](listpickerflyout_itemspicked.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspickedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsPickedEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsPickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsPickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of items that were selected by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspickedeventargs.addeditems
     * @type {IVector<IInspectable>} 
     */
    AddedItems {
        get => this.get_AddedItems()
    }

    /**
     * Gets the collection of items that were unselected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspickedeventargs.removeditems
     * @type {IVector<IInspectable>} 
     */
    RemovedItems {
        get => this.get_RemovedItems()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemsPickedEventArgs](itemspickedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPickedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_AddedItems() {
        if (!this.HasProp("__IItemsPickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsPickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPickedEventArgs := IItemsPickedEventArgs(outPtr)
        }

        return this.__IItemsPickedEventArgs.get_AddedItems()
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_RemovedItems() {
        if (!this.HasProp("__IItemsPickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemsPickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPickedEventArgs := IItemsPickedEventArgs(outPtr)
        }

        return this.__IItemsPickedEventArgs.get_RemovedItems()
    }

;@endregion Instance Methods
}
