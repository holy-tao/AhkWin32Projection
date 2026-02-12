#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IHubSectionAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include .\IHubSectionAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [HubSection](../windows.ui.xaml.controls/hubsection.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [HubSection](../windows.ui.xaml.controls/hubsection.md) class creates a new HubSectionAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from HubSectionAutomationPeer if you are deriving a custom class from [HubSection](../windows.ui.xaml.controls/hubsection.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.hubsectionautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class HubSectionAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHubSectionAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHubSectionAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HubSection} owner 
     * @returns {HubSectionAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!HubSectionAutomationPeer.HasProp("__IHubSectionAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.HubSectionAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionAutomationPeerFactory.IID)
            HubSectionAutomationPeer.__IHubSectionAutomationPeerFactory := IHubSectionAutomationPeerFactory(factoryPtr)
        }

        return HubSectionAutomationPeer.__IHubSectionAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of the parent container in order to display the item within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.hubsectionautomationpeer.scrollintoview
     */
    ScrollIntoView() {
        if (!this.HasProp("__IScrollItemProvider")) {
            if ((queryResult := this.QueryInterface(IScrollItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollItemProvider := IScrollItemProvider(outPtr)
        }

        return this.__IScrollItemProvider.ScrollIntoView()
    }

;@endregion Instance Methods
}
