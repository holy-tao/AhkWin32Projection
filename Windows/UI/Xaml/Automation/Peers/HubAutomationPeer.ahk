#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IHubAutomationPeer.ahk
#Include .\IHubAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [Hub](../windows.ui.xaml.controls/hub.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [Hub](../windows.ui.xaml.controls/hub.md) class creates a new HubAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from HubAutomationPeer if you are deriving a custom class from [Hub](../windows.ui.xaml.controls/hub.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.hubautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class HubAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHubAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHubAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Hub} owner 
     * @returns {HubAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!HubAutomationPeer.HasProp("__IHubAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.HubAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubAutomationPeerFactory.IID)
            HubAutomationPeer.__IHubAutomationPeerFactory := IHubAutomationPeerFactory(factoryPtr)
        }

        return HubAutomationPeer.__IHubAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
