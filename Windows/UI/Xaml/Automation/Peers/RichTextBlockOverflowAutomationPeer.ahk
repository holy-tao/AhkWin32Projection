#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IRichTextBlockOverflowAutomationPeer.ahk
#Include .\IRichTextBlockOverflowAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) class creates a new RichTextBlockOverflowAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) is sealed, so the normal scenario of deriving from the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) class and its existing peer isn't applicable to RichTextBlockOverflowAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.richtextblockoverflowautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RichTextBlockOverflowAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichTextBlockOverflowAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichTextBlockOverflowAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RichTextBlockOverflow} owner 
     * @returns {RichTextBlockOverflowAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RichTextBlockOverflowAutomationPeer.HasProp("__IRichTextBlockOverflowAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RichTextBlockOverflowAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowAutomationPeerFactory.IID)
            RichTextBlockOverflowAutomationPeer.__IRichTextBlockOverflowAutomationPeerFactory := IRichTextBlockOverflowAutomationPeerFactory(factoryPtr)
        }

        return RichTextBlockOverflowAutomationPeer.__IRichTextBlockOverflowAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
