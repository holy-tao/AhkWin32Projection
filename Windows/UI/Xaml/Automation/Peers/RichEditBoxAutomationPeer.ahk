#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IRichEditBoxAutomationPeer.ahk
#Include .\IRichEditBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) class creates a new RichEditBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from RichEditBoxAutomationPeer if you are deriving a custom class from [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.richeditboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RichEditBoxAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichEditBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichEditBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RichEditBox} owner 
     * @returns {RichEditBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RichEditBoxAutomationPeer.HasProp("__IRichEditBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RichEditBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxAutomationPeerFactory.IID)
            RichEditBoxAutomationPeer.__IRichEditBoxAutomationPeerFactory := IRichEditBoxAutomationPeerFactory(factoryPtr)
        }

        return RichEditBoxAutomationPeer.__IRichEditBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
