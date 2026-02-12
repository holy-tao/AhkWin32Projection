#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMediaElementAutomationPeer.ahk
#Include .\IMediaElementAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MediaElement](../windows.ui.xaml.controls/mediaelement.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [MediaElement](../windows.ui.xaml.controls/mediaelement.md) class creates a new MediaElementAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from MediaElementAutomationPeer if you are deriving a custom class from [MediaElement](../windows.ui.xaml.controls/mediaelement.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mediaelementautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MediaElementAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaElementAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaElementAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MediaElement} owner 
     * @returns {MediaElementAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!MediaElementAutomationPeer.HasProp("__IMediaElementAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MediaElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementAutomationPeerFactory.IID)
            MediaElementAutomationPeer.__IMediaElementAutomationPeerFactory := IMediaElementAutomationPeerFactory(factoryPtr)
        }

        return MediaElementAutomationPeer.__IMediaElementAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
