#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragItemsCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DragItemsCompleted](listviewbase_dragitemscompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemscompletedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DragItemsCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragItemsCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragItemsCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the loosely typed collection of objects that are selected for the item drag action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemscompletedeventargs.items
     * @type {IVectorView<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets a value that indicates what operation was performed on the dragged data, and whether it was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemscompletedeventargs.dropresult
     * @type {Integer} 
     */
    DropResult {
        get => this.get_DropResult()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__IDragItemsCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsCompletedEventArgs := IDragItemsCompletedEventArgs(outPtr)
        }

        return this.__IDragItemsCompletedEventArgs.get_Items()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DropResult() {
        if (!this.HasProp("__IDragItemsCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsCompletedEventArgs := IDragItemsCompletedEventArgs(outPtr)
        }

        return this.__IDragItemsCompletedEventArgs.get_DropResult()
    }

;@endregion Instance Methods
}
