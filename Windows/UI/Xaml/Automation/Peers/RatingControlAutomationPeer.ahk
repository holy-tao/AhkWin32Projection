#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IRatingControlAutomationPeer.ahk
#Include .\IRatingControlAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[RatingControl](../windows.ui.xaml.controls/ratingcontrol.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.RatingControlAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.ratingcontrolautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.ratingcontrolautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RatingControlAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatingControlAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatingControlAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RatingControl} owner 
     * @returns {RatingControlAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RatingControlAutomationPeer.HasProp("__IRatingControlAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RatingControlAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingControlAutomationPeerFactory.IID)
            RatingControlAutomationPeer.__IRatingControlAutomationPeerFactory := IRatingControlAutomationPeerFactory(factoryPtr)
        }

        return RatingControlAutomationPeer.__IRatingControlAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
