#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITreeViewDragItemsCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TreeView.DragItemsCompleted](treeview_dragitemscompleted.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsCompletedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemscompletedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemscompletedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewDragItemsCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewDragItemsCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewDragItemsCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates what operation was performed on the dragged data, and whether it was successful.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsCompletedEventArgs.DropResult](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemscompletedeventargs.dropresult) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemscompletedeventargs.dropresult
     * @type {Integer} 
     */
    DropResult {
        get => this.get_DropResult()
    }

    /**
     * Gets the loosely typed collection of objects that are selected for the item drag action.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewDragItemsCompletedEventArgs.Items](/windows/winui/api/microsoft.ui.xaml.controls.treeviewdragitemscompletedeventargs.items) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewdragitemscompletedeventargs.items
     * @type {IVectorView<IInspectable>} 
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
     * @returns {Integer} 
     */
    get_DropResult() {
        if (!this.HasProp("__ITreeViewDragItemsCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsCompletedEventArgs := ITreeViewDragItemsCompletedEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsCompletedEventArgs.get_DropResult()
    }

    /**
     * 
     * @returns {IVectorView<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__ITreeViewDragItemsCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewDragItemsCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewDragItemsCompletedEventArgs := ITreeViewDragItemsCompletedEventArgs(outPtr)
        }

        return this.__ITreeViewDragItemsCompletedEventArgs.get_Items()
    }

;@endregion Instance Methods
}
