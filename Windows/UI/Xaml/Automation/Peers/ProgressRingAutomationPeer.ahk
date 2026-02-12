#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IProgressRingAutomationPeer.ahk
#Include .\IProgressRingAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ProgressRing](../windows.ui.xaml.controls/progressring.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.ProgressRingAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.progressringautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * The Windows Runtime  [ProgressRing](../windows.ui.xaml.controls/progressring.md) class creates a new ProgressRingAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [ProgressRing](../windows.ui.xaml.controls/progressring.md) is sealed, so the normal scenario of deriving from the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) class and its existing peer isn't applicable to ProgressRingAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.progressringautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ProgressRingAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressRingAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressRingAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ProgressRing} owner 
     * @returns {ProgressRingAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ProgressRingAutomationPeer.HasProp("__IProgressRingAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ProgressRingAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProgressRingAutomationPeerFactory.IID)
            ProgressRingAutomationPeer.__IProgressRingAutomationPeerFactory := IProgressRingAutomationPeerFactory(factoryPtr)
        }

        return ProgressRingAutomationPeer.__IProgressRingAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
