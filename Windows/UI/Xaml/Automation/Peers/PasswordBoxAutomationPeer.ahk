#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IPasswordBoxAutomationPeer.ahk
#Include .\IPasswordBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) class creates a new PasswordBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) is sealed, so the normal scenario of deriving from the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) class and its existing peer isn't applicable to PasswordBoxAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.passwordboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class PasswordBoxAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPasswordBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPasswordBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {PasswordBox} owner 
     * @returns {PasswordBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!PasswordBoxAutomationPeer.HasProp("__IPasswordBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.PasswordBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxAutomationPeerFactory.IID)
            PasswordBoxAutomationPeer.__IPasswordBoxAutomationPeerFactory := IPasswordBoxAutomationPeerFactory(factoryPtr)
        }

        return PasswordBoxAutomationPeer.__IPasswordBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
