#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RangeBaseAutomationPeer.ahk
#Include .\IProgressBarAutomationPeer.ahk
#Include .\IProgressBarAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ProgressBar](../windows.ui.xaml.controls/progressbar.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.ProgressBarAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.progressbarautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * The Windows Runtime  [ProgressBar](../windows.ui.xaml.controls/progressbar.md) class creates a new ProgressBarAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ProgressBarAutomationPeer if you are deriving a custom class from [ProgressBar](../windows.ui.xaml.controls/progressbar.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.progressbarautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ProgressBarAutomationPeer extends RangeBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressBarAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressBarAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ProgressBar} owner 
     * @returns {ProgressBarAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ProgressBarAutomationPeer.HasProp("__IProgressBarAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ProgressBarAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressBarAutomationPeerFactory.IID)
            ProgressBarAutomationPeer.__IProgressBarAutomationPeerFactory := IProgressBarAutomationPeerFactory(factoryPtr)
        }

        return ProgressBarAutomationPeer.__IProgressBarAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
