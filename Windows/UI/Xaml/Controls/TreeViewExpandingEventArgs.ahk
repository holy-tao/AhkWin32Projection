#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITreeViewExpandingEventArgs.ahk
#Include .\ITreeViewExpandingEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TreeView.Expanding](treeview_expanding.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewExpandingEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.treeviewexpandingeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewexpandingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewExpandingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewExpandingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewExpandingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the tree view node that is expanding.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewExpandingEventArgs.Node](/windows/winui/api/microsoft.ui.xaml.controls.treeviewexpandingeventargs.node) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewexpandingeventargs.node
     * @type {TreeViewNode} 
     */
    Node {
        get => this.get_Node()
    }

    /**
     * Gets the data item for the tree view node that is expanding.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewExpandingEventArgs.Item](/windows/winui/api/microsoft.ui.xaml.controls.treeviewexpandingeventargs.item) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewexpandingeventargs.item
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
        if (!this.HasProp("__ITreeViewExpandingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITreeViewExpandingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewExpandingEventArgs := ITreeViewExpandingEventArgs(outPtr)
        }

        return this.__ITreeViewExpandingEventArgs.get_Node()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__ITreeViewExpandingEventArgs2")) {
            if ((queryResult := this.QueryInterface(ITreeViewExpandingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewExpandingEventArgs2 := ITreeViewExpandingEventArgs2(outPtr)
        }

        return this.__ITreeViewExpandingEventArgs2.get_Item()
    }

;@endregion Instance Methods
}
