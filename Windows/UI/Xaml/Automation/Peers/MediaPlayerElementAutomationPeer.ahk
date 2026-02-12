#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMediaPlayerElementAutomationPeer.ahk
#Include .\IMediaPlayerElementAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mediaplayerelementautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MediaPlayerElementAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerElementAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerElementAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MediaPlayerElement} owner 
     * @returns {MediaPlayerElementAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!MediaPlayerElementAutomationPeer.HasProp("__IMediaPlayerElementAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.MediaPlayerElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementAutomationPeerFactory.IID)
            MediaPlayerElementAutomationPeer.__IMediaPlayerElementAutomationPeerFactory := IMediaPlayerElementAutomationPeerFactory(factoryPtr)
        }

        return MediaPlayerElementAutomationPeer.__IMediaPlayerElementAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
