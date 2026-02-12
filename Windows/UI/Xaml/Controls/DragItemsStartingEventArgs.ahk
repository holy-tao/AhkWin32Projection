#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragItemsStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DragItemsStarting](listviewbase_dragitemsstarting.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemsstartingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DragItemsStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragItemsStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragItemsStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the item drag action should be canceled.
     * @remarks
     * Set this property to **true** in a handler in order to cancel an items drag action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemsstartingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the loosely typed collection of objects that are selected for the item drag action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemsstartingeventargs.items
     * @type {IVector<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets the data payload associated with an items drag action.
     * @remarks
     * By default the data is empty. When you perform custom actions as the result of a drag-and-drop operation, you typically provide custom data that can later be inspected and used to perform the custom action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dragitemsstartingeventargs.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DragItemsStartingEventArgs](dragitemsstartingeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DragItemsStartingEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsStartingEventArgs := IDragItemsStartingEventArgs(outPtr)
        }

        return this.__IDragItemsStartingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsStartingEventArgs := IDragItemsStartingEventArgs(outPtr)
        }

        return this.__IDragItemsStartingEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__IDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsStartingEventArgs := IDragItemsStartingEventArgs(outPtr)
        }

        return this.__IDragItemsStartingEventArgs.get_Items()
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__IDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemsStartingEventArgs := IDragItemsStartingEventArgs(outPtr)
        }

        return this.__IDragItemsStartingEventArgs.get_Data()
    }

;@endregion Instance Methods
}
