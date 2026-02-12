#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMenuBarItemAutomationPeer.ahk
#Include ..\Provider\IExpandCollapseProvider.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IMenuBarItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MenuBarItem](../windows.ui.xaml.controls/menubaritem.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubaritemautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubaritemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MenuBarItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuBarItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuBarItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MenuBarItem} owner 
     * @returns {MenuBarItemAutomationPeer} 
     */
    static CreateInstance(owner) {
        if (!MenuBarItemAutomationPeer.HasProp("__IMenuBarItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarItemAutomationPeerFactory.IID)
            MenuBarItemAutomationPeer.__IMenuBarItemAutomationPeerFactory := IMenuBarItemAutomationPeerFactory(factoryPtr)
        }

        return MenuBarItemAutomationPeer.__IMenuBarItemAutomationPeerFactory.CreateInstance(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state, expanded or collapsed, of the [MenuBarItem](../windows.ui.xaml.controls/menubaritem.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer.ExpandCollapseState](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubaritemautomationpeer.expandcollapsestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubaritemautomationpeer.expandcollapsestate
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
     * Hides all nodes, controls, or content that are descendants of the [MenuBarItem](../windows.ui.xaml.controls/menubaritem.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer.Collapse](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubaritemautomationpeer.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubaritemautomationpeer.collapse
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
     * Displays all child nodes, controls, or content of the [MenuBarItem](../windows.ui.xaml.controls/menubaritem.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer.Expand](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubaritemautomationpeer.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubaritemautomationpeer.expand
     */
    Expand() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Expand()
    }

    /**
     * Sends a request to click the [MenuBarItem](../windows.ui.xaml.controls/menubaritem.md) associated with the automation peer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarItemAutomationPeer.Invoke](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubaritemautomationpeer.invoke) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubaritemautomationpeer.invoke
     */
    Invoke() {
        if (!this.HasProp("__IInvokeProvider")) {
            if ((queryResult := this.QueryInterface(IInvokeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInvokeProvider := IInvokeProvider(outPtr)
        }

        return this.__IInvokeProvider.Invoke()
    }

;@endregion Instance Methods
}
