#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITreeViewDragItemsStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TreeView.DragItemsStarting](treeview_dragitemsstarting.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsStartingEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemsstartingeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemsstartingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewDragItemsStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewDragItemsStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewDragItemsStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the item drag action should be canceled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsStartingEventArgs.Cancel](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemsstartingeventargs.cancel) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * Set this property to **true** in a handler in order to cancel an items drag action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemsstartingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the data payload associated with an items drag action.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsStartingEventArgs.Data](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemsstartingeventargs.data) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * By default the data is empty. When you perform custom actions as the result of a drag-and-drop operation, you typically provide custom data that can later be inspected and used to perform the custom action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemsstartingeventargs.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the loosely typed collection of objects that are selected for the item drag action.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsStartingEventArgs.Items](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemsstartingeventargs.items) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemsstartingeventargs.items
     * @type {IVector<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ITreeViewDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsStartingEventArgs := ITreeViewDragItemsStartingEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsStartingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ITreeViewDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsStartingEventArgs := ITreeViewDragItemsStartingEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsStartingEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__ITreeViewDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsStartingEventArgs := ITreeViewDragItemsStartingEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsStartingEventArgs.get_Data()
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__ITreeViewDragItemsStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsStartingEventArgs := ITreeViewDragItemsStartingEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsStartingEventArgs.get_Items()
    }

;@endregion Instance Methods
}
