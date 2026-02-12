#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewItemAutomationPeer.ahk
#Include .\ITreeViewItemAutomationPeer.ahk
#Include ..\Provider\IExpandCollapseProvider.ahk
#Include .\ITreeViewItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[TreeViewItem](../windows.ui.xaml.controls/treeviewitem.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.TreeViewItemAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.treeviewitemautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.treeviewitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class TreeViewItemAutomationPeer extends ListViewItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {TreeViewItem} owner 
     * @returns {TreeViewItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!TreeViewItemAutomationPeer.HasProp("__ITreeViewItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.TreeViewItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemAutomationPeerFactory.IID)
            TreeViewItemAutomationPeer.__ITreeViewItemAutomationPeerFactory := ITreeViewItemAutomationPeerFactory(factoryPtr)
        }

        return TreeViewItemAutomationPeer.__ITreeViewItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating the expanded or collapsed state of the associated **[TreeViewItem](file:///C:\Repos\winrt-api\windows.ui.xaml.controls\treeviewitem.md)**.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.TreeViewItemAutomationPeer.ExpandCollapseState](/windows/winui/api/microsoft.ui.xaml.automation.peers.treeviewitemautomationpeer.expandcollapsestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * **ExpandCollapseState** refers to the visibility of immediate child objects only, it does not refer to the visibility of all descendant objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.treeviewitemautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
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
    get_ExpandCollapseState() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.get_ExpandCollapseState()
    }

    /**
     * Collapses the associated **[TreeViewItem](file:///C:\Repos\winrt-api\windows.ui.xaml.controls\treeviewitem.md)**.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.TreeViewItemAutomationPeer.Collapse](/windows/winui/api/microsoft.ui.xaml.automation.peers.treeviewitemautomationpeer.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.treeviewitemautomationpeer.collapse
     */
    Collapse() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Collapse()
    }

    /**
     * Expands the associated **[TreeViewItem](file:///C:\Repos\winrt-api\windows.ui.xaml.controls\treeviewitem.md)**.  
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.TreeViewItemAutomationPeer.Expand](/windows/winui/api/microsoft.ui.xaml.automation.peers.treeviewitemautomationpeer.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.treeviewitemautomationpeer.expand
     */
    Expand() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Expand()
    }

;@endregion Instance Methods
}
