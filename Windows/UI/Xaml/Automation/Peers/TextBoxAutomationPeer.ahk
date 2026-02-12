#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ITextBoxAutomationPeer.ahk
#Include .\ITextBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [TextBox](../windows.ui.xaml.controls/textbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [TextBox](../windows.ui.xaml.controls/textbox.md) class creates a new TextBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from TextBoxAutomationPeer if you are deriving a custom class from [TextBox](../windows.ui.xaml.controls/textbox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.textboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class TextBoxAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {TextBox} owner 
     * @returns {TextBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!TextBoxAutomationPeer.HasProp("__ITextBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.TextBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxAutomationPeerFactory.IID)
            TextBoxAutomationPeer.__ITextBoxAutomationPeerFactory := ITextBoxAutomationPeerFactory(factoryPtr)
        }

        return TextBoxAutomationPeer.__ITextBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
