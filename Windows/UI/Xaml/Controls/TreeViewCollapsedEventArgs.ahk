#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITreeViewCollapsedEventArgs.ahk
#Include .\ITreeViewCollapsedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TreeView.Collapsed](treeview_collapsed.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewCollapsedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.treeviewcollapsedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewcollapsedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewCollapsedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewCollapsedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewCollapsedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the TreeView node that is collapsed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewCollapsedEventArgs.Node](/windows/winui/api/microsoft.ui.xaml.controls.treeviewcollapsedeventargs.node) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewcollapsedeventargs.node
     * @type {TreeViewNode} 
     */
    Node {
        get => this.get_Node()
    }

    /**
     * Gets the TreeView item that is collapsed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewCollapsedEventArgs.Item](/windows/winui/api/microsoft.ui.xaml.controls.treeviewcollapsedeventargs.item) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewcollapsedeventargs.item
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TreeViewNode} 
     */
    get_Node() {
        if (!this.HasProp("__ITreeViewCollapsedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewCollapsedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewCollapsedEventArgs := ITreeViewCollapsedEventArgs(outPtr)
        }

        return this.__ITreeViewCollapsedEventArgs.get_Node()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__ITreeViewCollapsedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ITreeViewCollapsedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewCollapsedEventArgs2 := ITreeViewCollapsedEventArgs2(outPtr)
        }

        return this.__ITreeViewCollapsedEventArgs2.get_Item()
    }

;@endregion Instance Methods
}
