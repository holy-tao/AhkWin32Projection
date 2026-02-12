#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IItemClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ItemClick](listviewbase_itemclick.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemclickeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemClickEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemClickEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemClickEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the clicked item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemclickeventargs.clickeditem
     * @type {IInspectable} 
     */
    ClickedItem {
        get => this.get_ClickedItem()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemClickEventArgs](itemclickeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemClickEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ClickedItem() {
        if (!this.HasProp("__IItemClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemClickEventArgs := IItemClickEventArgs(outPtr)
        }

        return this.__IItemClickEventArgs.get_ClickedItem()
    }

;@endregion Instance Methods
}
