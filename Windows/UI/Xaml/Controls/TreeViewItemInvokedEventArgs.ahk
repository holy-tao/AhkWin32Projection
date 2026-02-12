#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITreeViewItemInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TreeView.ItemInvoked](treeview_iteminvoked.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemInvokedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.treeviewiteminvokedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewiteminvokedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewItemInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewItemInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewItemInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the TreeView item that is invoked.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemInvokedEventArgs.InvokedItem](/windows/winui/api/microsoft.ui.xaml.controls.treeviewiteminvokedeventargs.invokeditem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewiteminvokedeventargs.invokeditem
     * @type {IInspectable} 
     */
    InvokedItem {
        get => this.get_InvokedItem()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for prevents most handlers along the event route from handling the same event again.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemInvokedEventArgs.Handled](/windows/winui/api/microsoft.ui.xaml.controls.treeviewiteminvokedeventargs.handled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewiteminvokedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_InvokedItem() {
        if (!this.HasProp("__ITreeViewItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemInvokedEventArgs := ITreeViewItemInvokedEventArgs(outPtr)
        }

        return this.__ITreeViewItemInvokedEventArgs.get_InvokedItem()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ITreeViewItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemInvokedEventArgs := ITreeViewItemInvokedEventArgs(outPtr)
        }

        return this.__ITreeViewItemInvokedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ITreeViewItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemInvokedEventArgs := ITreeViewItemInvokedEventArgs(outPtr)
        }

        return this.__ITreeViewItemInvokedEventArgs.get_Handled()
    }

;@endregion Instance Methods
}
