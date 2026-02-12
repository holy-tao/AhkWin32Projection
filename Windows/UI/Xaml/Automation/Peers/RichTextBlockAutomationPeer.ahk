#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IRichTextBlockAutomationPeer.ahk
#Include .\IRichTextBlockAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) class creates a new RichTextBlockAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) is sealed, so the normal scenario of deriving from the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) class and its existing peer isn't applicable to RichTextBlockAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.richtextblockautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RichTextBlockAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichTextBlockAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichTextBlockAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RichTextBlock} owner 
     * @returns {RichTextBlockAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RichTextBlockAutomationPeer.HasProp("__IRichTextBlockAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RichTextBlockAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockAutomationPeerFactory.IID)
            RichTextBlockAutomationPeer.__IRichTextBlockAutomationPeerFactory := IRichTextBlockAutomationPeerFactory(factoryPtr)
        }

        return RichTextBlockAutomationPeer.__IRichTextBlockAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
