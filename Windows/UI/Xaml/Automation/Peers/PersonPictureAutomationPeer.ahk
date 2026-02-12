#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IPersonPictureAutomationPeer.ahk
#Include .\IPersonPictureAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[PersonPicture](../windows.ui.xaml.controls/personpicture.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.PersonPictureAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.personpictureautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.personpictureautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class PersonPictureAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPersonPictureAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPersonPictureAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {PersonPicture} owner 
     * @returns {PersonPictureAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!PersonPictureAutomationPeer.HasProp("__IPersonPictureAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.PersonPictureAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureAutomationPeerFactory.IID)
            PersonPictureAutomationPeer.__IPersonPictureAutomationPeerFactory := IPersonPictureAutomationPeerFactory(factoryPtr)
        }

        return PersonPictureAutomationPeer.__IPersonPictureAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
