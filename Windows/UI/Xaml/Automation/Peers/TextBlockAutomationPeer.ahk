#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ITextBlockAutomationPeer.ahk
#Include .\ITextBlockAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [TextBlock](../windows.ui.xaml.controls/textblock.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [TextBlock](../windows.ui.xaml.controls/textblock.md) class creates a new TextBlockAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [TextBlock](../windows.ui.xaml.controls/textblock.md) is sealed, so the normal scenario of deriving from the [TextBlock](../windows.ui.xaml.controls/textblock.md) class and its existing peer isn't applicable to TextBlockAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.textblockautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class TextBlockAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBlockAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBlockAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {TextBlock} owner 
     * @returns {TextBlockAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!TextBlockAutomationPeer.HasProp("__ITextBlockAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.TextBlockAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockAutomationPeerFactory.IID)
            TextBlockAutomationPeer.__ITextBlockAutomationPeerFactory := ITextBlockAutomationPeerFactory(factoryPtr)
        }

        return TextBlockAutomationPeer.__ITextBlockAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
