#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMediaTransportControlsAutomationPeer.ahk
#Include .\IMediaTransportControlsAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes MediaTransportControls types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mediatransportcontrolsautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MediaTransportControlsAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTransportControlsAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTransportControlsAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MediaTransportControls} owner 
     * @returns {MediaTransportControlsAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!MediaTransportControlsAutomationPeer.HasProp("__IMediaTransportControlsAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MediaTransportControlsAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsAutomationPeerFactory.IID)
            MediaTransportControlsAutomationPeer.__IMediaTransportControlsAutomationPeerFactory := IMediaTransportControlsAutomationPeerFactory(factoryPtr)
        }

        return MediaTransportControlsAutomationPeer.__IMediaTransportControlsAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
