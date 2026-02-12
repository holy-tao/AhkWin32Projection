#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewItemAutomationPeer.ahk
#Include .\INavigationViewItemAutomationPeer.ahk
#Include .\INavigationViewItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[NavigationViewItem](../windows.ui.xaml.controls/navigationviewitem.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.NavigationViewItemAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.navigationviewitemautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.navigationviewitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class NavigationViewItemAutomationPeer extends ListViewItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {NavigationViewItem} owner 
     * @returns {NavigationViewItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!NavigationViewItemAutomationPeer.HasProp("__INavigationViewItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.NavigationViewItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemAutomationPeerFactory.IID)
            NavigationViewItemAutomationPeer.__INavigationViewItemAutomationPeerFactory := INavigationViewItemAutomationPeerFactory(factoryPtr)
        }

        return NavigationViewItemAutomationPeer.__INavigationViewItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
