#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMenuBarAutomationPeer.ahk
#Include .\IMenuBarAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes MenuBar types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.MenuBarAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.menubarautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.menubarautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MenuBarAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuBarAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuBarAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {WinRTMenuBar} owner 
     * @returns {MenuBarAutomationPeer} 
     */
    static CreateInstance(owner) {
        if (!MenuBarAutomationPeer.HasProp("__IMenuBarAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MenuBarAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarAutomationPeerFactory.IID)
            MenuBarAutomationPeer.__IMenuBarAutomationPeerFactory := IMenuBarAutomationPeerFactory(factoryPtr)
        }

        return MenuBarAutomationPeer.__IMenuBarAutomationPeerFactory.CreateInstance(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
