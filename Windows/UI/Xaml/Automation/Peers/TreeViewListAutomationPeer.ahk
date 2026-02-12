#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorAutomationPeer.ahk
#Include .\ITreeViewListAutomationPeer.ahk
#Include .\ITreeViewListAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[TreeViewList](../windows.ui.xaml.controls/treeviewlist.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.TreeViewListAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.treeviewlistautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.treeviewlistautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class TreeViewListAutomationPeer extends SelectorAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewListAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewListAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {TreeViewList} owner 
     * @returns {TreeViewListAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!TreeViewListAutomationPeer.HasProp("__ITreeViewListAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.TreeViewListAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewListAutomationPeerFactory.IID)
            TreeViewListAutomationPeer.__ITreeViewListAutomationPeerFactory := ITreeViewListAutomationPeerFactory(factoryPtr)
        }

        return TreeViewListAutomationPeer.__ITreeViewListAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
